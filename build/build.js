#!/usr/bin/env node

const doT = require('./doT.min')
const { readFileSync, writeFileSync } = require('fs')

doT.templateSettings.strip = false // preserve whitespace

const baseColors = {
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
}

const specialColors = {
	comment_grey: { gui: '#5C6370', cterm: '59', cterm16: '15' },
	gutter_fg_grey: { gui: '#636D83', cterm: '238', cterm16: '15' },
	cursor_grey:  { gui: '#2C323C', cterm: '236', cterm16: '8' },
	visual_grey: { gui: '#3E4452', cterm: '237', cterm16: '15' },
	menu_grey: { cterm16: '8' }, // vim theme handles gui/cterm values
	special_grey: { gui: '#3B4048', cterm: '238', cterm16: '15' },
	vertsplit: { gui: '#181A1F', cterm: '59', cterm16: '15' },
}

const colors = Object.assign({}, baseColors, specialColors)

const onedarkTemplate = doT.template(readFileSync('./templates/onedark.template.vim', 'utf8'))
const lightlineTemplate = doT.template(readFileSync('./templates/lightline.template.vim', 'utf8'))

writeFileSync('../colors/onedark.vim', onedarkTemplate(colors), 'utf8')
writeFileSync('../autoload/lightline/colorscheme/onedark.vim', lightlineTemplate(colors), 'utf8')
