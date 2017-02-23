" [onedark.vim](https://github.com/joshdick/onedark.vim/)

" This is a [lightline.vim](https://github.com/itchyny/lightline.vim) colorscheme for use with
" the [onedark.vim](https://github.com/joshdick/onedark.vim) colorscheme.

if get(g:, 'onedark_termcolors', 256) == 16
  let s:term_red = {{=it.red.cterm16}}
  let s:term_green = {{=it.green.cterm16}}
  let s:term_yellow = {{=it.yellow.cterm16}}
  let s:term_blue = {{=it.blue.cterm16}}
  let s:term_purple = {{=it.purple.cterm16}}
  let s:term_white = {{=it.white.cterm16}}
  let s:term_black = {{=it.black.cterm16}}
  let s:term_visual_grey = {{=it.visual_grey.cterm16}}
else
  let s:term_red = {{=it.red.cterm}}
  let s:term_green = {{=it.green.cterm}}
  let s:term_yellow = {{=it.yellow.cterm}}
  let s:term_blue = {{=it.blue.cterm}}
  let s:term_purple = {{=it.purple.cterm}}
  let s:term_white = {{=it.white.cterm}}
  let s:term_black = {{=it.black.cterm}}
  let s:term_visual_grey = {{=it.visual_grey.cterm}}
endif

let s:red = [ '{{=it.red.gui}}', s:term_red ]
let s:green = [ '{{=it.green.gui}}', s:term_green ]
let s:yellow = [ '{{=it.yellow.gui}}', s:term_yellow ]
let s:blue = [ '{{=it.blue.gui}}', s:term_blue ]
let s:purple = [ '{{=it.purple.gui}}', s:term_purple ]
let s:white = [ '{{=it.white.gui}}', s:term_white ]
let s:black = [ '{{=it.black.gui}}', s:term_black ]
let s:grey = [ '{{=it.visual_grey.gui}}', s:term_visual_grey ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:black, s:green ], [ s:white, s:grey ] ]
let s:p.normal.right = [ [ s:black, s:green ], [ s:white, s:grey ] ]
let s:p.inactive.left =  [ [ s:white, s:grey ], [ s:white, s:grey ] ]
let s:p.inactive.right = [ [ s:black, s:white ], [ s:black, s:white ] ]
let s:p.insert.left = [ [ s:black, s:blue ], [ s:white, s:grey ] ]
let s:p.insert.right = [ [ s:black, s:blue ], [ s:white, s:grey ] ]
let s:p.replace.left = [ [ s:black, s:red ], [ s:white, s:grey ] ]
let s:p.replace.right = [ [ s:black, s:red ], [ s:white, s:grey ] ]
let s:p.visual.left = [ [ s:black, s:purple ], [ s:white, s:grey ] ]
let s:p.visual.right = [ [ s:black, s:purple ], [ s:white, s:grey ] ]
let s:p.normal.middle = [ [ s:white, s:black ] ]
let s:p.inactive.middle = [ [ s:white, s:grey ] ]
let s:p.tabline.left = [ [ s:white, s:grey ] ]
let s:p.tabline.tabsel = [ [ s:black, s:white ] ]
let s:p.tabline.middle = [ [ s:white, s:black ] ]
let s:p.tabline.right = [ [ s:white, s:grey ] ]
let s:p.normal.error = [ [ s:black, s:red ] ]
let s:p.normal.warning = [ [ s:black, s:yellow ] ]

let g:lightline#colorscheme#onedark#palette = lightline#colorscheme#flatten(s:p)

