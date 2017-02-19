#!/usr/bin/env node

const doT = require('doT')
const { readFileSync, writeFileSync } = require('fs')
const { resolve } = require('path')

doT.templateSettings.strip = false // preserve whitespace

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
	gutter_fg_grey: { gui: '#636D83', cterm: '238', cterm16: '15' },
	cursor_grey:  { gui: '#2C323C', cterm: '236', cterm16: '8' },
	visual_grey: { gui: '#3E4452', cterm: '237', cterm16: '15' },
	menu_grey: { cterm16: '8' }, // vim theme handles gui/cterm values
	special_grey: { gui: '#3B4048', cterm: '238', cterm16: '15' },
	vertsplit: { gui: '#181A1F', cterm: '59', cterm16: '15' },
})

const colors = Object.assign({}, baseColors, specialColors)

const templateMap = Object.freeze({
	'./templates/onedark.template.vim': '../colors/onedark.vim',
	'./templates/lightline.template.vim': '../autoload/lightline/colorscheme/onedark.vim'
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
		template = doT.template(templateText)
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

console.log('Success!')

