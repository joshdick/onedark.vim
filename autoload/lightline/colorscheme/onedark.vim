" [onedark.vim](https://github.com/joshdick/onedark.vim/)

" This is a [lightline.vim](https://github.com/itchyny/lightline.vim) colorscheme for use with
" the [onedark.vim](https://github.com/joshdick/onedark.vim) colorscheme.

let s:colors = onedark#GetColors()

if get(g:, 'onedark_termcolors', 256) == 16
  let s:term_red = s:colors.red.cterm16
  let s:term_green = s:colors.green.cterm16
  let s:term_yellow = s:colors.yellow.cterm16
  let s:term_blue = s:colors.blue.cterm16
  let s:term_purple = s:colors.purple.cterm16
  let s:term_white = s:colors.white.cterm16
  let s:term_black = s:colors.black.cterm16
  let s:term_grey = s:colors.cursor_grey.cterm16
else
  let s:term_red = s:colors.red.cterm
  let s:term_green = s:colors.green.cterm
  let s:term_yellow = s:colors.yellow.cterm
  let s:term_blue = s:colors.blue.cterm
  let s:term_purple = s:colors.purple.cterm
  let s:term_white = s:colors.white.cterm
  let s:term_black = s:colors.black.cterm
  let s:term_grey = s:colors.cursor_grey.cterm
endif

let s:red = [ s:colors.red.gui, s:term_red ]
let s:green = [ s:colors.green.gui, s:term_green ]
let s:yellow = [ s:colors.yellow.gui, s:term_yellow ]
let s:blue = [ s:colors.blue.gui, s:term_blue ]
let s:purple = [ s:colors.purple.gui, s:term_purple ]
let s:white = [ s:colors.white.gui, s:term_white ]
let s:black = [ s:colors.black.gui, s:term_black ]
let s:grey = [ s:colors.visual_grey.gui, s:term_grey ]

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

