#!/usr/bin/env node

const _ = require('lodash') // ships with termcolors; only used because of termcolors customization
const termcolors = require('termcolors')
const { readFileSync, writeFileSync } = require('fs')
const { resolve } = require('path')

const baseColors = Object.freeze({
	red: { gui: '#E06C75', cterm: '204', cterm16: '1' }, // alternate cterm: 168
	dark_red: { gui: '#BE5046', cterm: '196', cterm16: '9' },
	green: { gui: '#98C379', cterm: '114', cterm16: '2' },
	yellow: { gui: '#E5C07B', cterm: '180', cterm16: '3' },
	dark_yellow: { gui: '#D19A66', cterm: '173', cterm16: '11' },
	blue: { gui: '#61AFEF', cterm: '39', cterm16: '4' }, // alternate cterm: 75
	purple: { gui: '#C678DD', cterm: '170',  cterm16: '5' }, // alternate cterm: 176
	cyan: { gui: '#56B6C2', cterm: '38', cterm16: '6' }, // alternate cterm: 73
	white: { gui: '#ABB2BF', cterm: '145', cterm16 : '7' },
	black: { gui: '#282C34', cterm: '235', cterm16: '0' }
})

const specialColors = Object.freeze({
	comment_grey: { gui: '#5C6370', cterm: '59', cterm16: '15' },
	gutter_fg_grey: { gui: '#4B5263', cterm: '238', cterm16: '15' },
	cursor_grey:  { gui: '#2C323C', cterm: '236', cterm16: '8' },
	visual_grey: { gui: '#3E4452', cterm: '237', cterm16: '15' },
	menu_grey: { cterm16: '8' }, // vim theme handles gui/cterm values
	special_grey: { gui: '#3B4048', cterm: '238', cterm16: '15' },
	vertsplit: { gui: '#181A1F', cterm: '59', cterm16: '15' },
})

const colors = Object.assign({}, baseColors, specialColors)

const templateMap = Object.freeze({
	'templates/autoload.template.vim': '../autoload/onedark.vim',
	'templates/One Dark.Xresources': '../term/One Dark.Xresources'
})

const shouldCheck = String(process.argv[2]).toLowerCase() === 'check'

const handleError = (message, cause) => {
	console.error('Error:', message)
	if (cause) console.error('Cause:', cause)
	process.exit(-1)
}

console.log(
	shouldCheck ?
		'Checking for inconsistencies between templates and existing output files...'
		:
		'Generating output files from templates...'
)

Object.keys(templateMap).forEach(templateFilename => {

	// Read the template
	const templatePath = resolve(__dirname, templateFilename)
	let templateText
	try {
		templateText = readFileSync(templatePath, 'utf8')
	} catch (e) {
		handleError(`Error reading template ${templatePath}`, e)
	}

	// Compile the template
	let template
	try {
		template = _.template(templateText)
	} catch (e) {
		handleError(`Error compiling template ${templatePath}`, e)
	}

	// Execute the template (generate the output)
	let output
	try {
		output = template(colors)
	} catch (e) {
		handleError(`Error running template ${templatePath}`, e)
	}

	let outputPath = resolve(__dirname, templateMap[templateFilename])
	try {
		const existingOutput = readFileSync(outputPath, 'utf8')
		// Only need to do something if the generated output differs from what's already on disk
		if (output !== existingOutput) {
			if (shouldCheck) { // Check generated output against existing output file
				handleError(`Changes were made to ${templateMap[templateFilename]} that are inconsistent with its template (${templateFilename}).\nDo you need to [re]build?`)
			} else { // Overwrite existing output file
				try {
					writeFileSync(outputPath, output, 'utf8')
				} catch (e) {
					handleError(`Error writing to output file ${outputPath}`, e)
				}
			}
		}
	} catch (e) {
		handleError(`Error reading existing output file ${outputPath}`, e)
	}

})

try {
	// Use the Xresources theme as a color source since it was generated above via templating
	const xresources = readFileSync(resolve(__dirname, '../term/One Dark.Xresources'), 'utf8')
	const terminalPalette = termcolors.xresources.import(xresources)

	let alacrittyTemplate, itermTemplate, kittyTemplate, terminalAppTemplate

	// Compile custom terminal color templates based on ones that ship with termcolors
	try {
		alacrittyTemplate = termcolors.export(
			readFileSync(resolve(__dirname, 'templates/One Dark.alacritty')),
			_.partialRight(_.mapValues, function (color) {
				return color.toHex().slice(1)
			})
		)

		itermTemplate = termcolors.export(
			// From termcolors/lib/formats/iterm.js
			readFileSync(resolve(__dirname, 'templates/One Dark.itermcolors')),
			_.partialRight(_.mapValues, function (color) {
				return color.toAvgRgbArray()
			})
		)

		kittyTemplate = termcolors.export(
			readFileSync(resolve(__dirname, 'templates/One Dark.kitty')),
			_.partialRight(_.mapValues, function (color) {
				return color.toHex().slice(1)
			})
		)

		// From termcolors/lib/formats/terminal-app.js
		const code = [
			Buffer.from('62706c6973743030d40102030405061516582476657273696f6e58246f626a65637473592461726368697665725424746f7012000186a0a307080f55246e756c6cd3090a0b0c0d0e554e535247425c4e53436f6c6f7253706163655624636c6173734f1027', 'hex'),
			Buffer.from('0010018002d2101112135a24636c6173736e616d655824636c6173736573574e53436f6c6f72a21214584e534f626a6563745f100f4e534b657965644172636869766572d1171854726f6f74800108111a232d32373b41484e5b628c8e9095a0a9b1b4bdcfd2d700000000000001010000000000000019000000000000000000000000000000d9', 'hex')
		]

		terminalAppTemplate = termcolors.export(
			readFileSync(resolve(__dirname, 'templates/One Dark.terminal')),
			// From termcolors/lib/formats/terminal-app.js
			_.partialRight(_.mapValues, function (color) {
				var srgb = color.toAvgRgbArray()
				srgb = srgb.map(function (n) {
					return n.toFixed(10).toString()
				}).join(' ')
				var output = code[0].toString('binary') + srgb + code[1].toString('binary')
				output = (Buffer.from(output, 'binary')).toString('base64')
				return output.match(/.{1,68}/g).join('\n\t')
			})
		)

	} catch (e) {
		handleError('Error compiling terminal color template', e)
	}

	try {
		writeFileSync(resolve(__dirname, '../term/One Dark.alacritty'), alacrittyTemplate(terminalPalette))
		writeFileSync(resolve(__dirname, '../term/One Dark.itermcolors'), itermTemplate(terminalPalette))
		writeFileSync(resolve(__dirname, '../term/One Dark.kitty'), kittyTemplate(terminalPalette))
		writeFileSync(resolve(__dirname, '../term/One Dark.terminal'), terminalAppTemplate(terminalPalette))
	} catch (e) {
		handleError('Error writing terminal color file', e)
	}

} catch (e) {
	handleError('Error reading Xresources terminal color file', e)
}

console.log('Success!')

