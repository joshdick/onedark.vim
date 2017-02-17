" [onedark.vim](https://github.com/joshdick/onedark.vim/)

" This is a [lightline.vim](https://github.com/itchyny/lightline.vim) colorscheme for use with
" the [onedark.vim](https://github.com/joshdick/onedark.vim) colorscheme.

let s:black = [ '{{=it.black.gui}}', {{=it.black.cterm}} ]
let s:blue = [ '{{=it.blue.gui}}', {{=it.blue.cterm}} ]
let s:green = [ '{{=it.green.gui}}', {{=it.green.cterm}} ]
let s:grey = [ '{{=it.visual_grey.gui}}', {{=it.visual_grey.cterm}} ]
let s:purple = [ '{{=it.purple.gui}}', {{=it.purple.cterm}} ]
let s:red = [ '{{=it.red.gui}}', {{=it.red.cterm}} ]
let s:white = [ '{{=it.white.gui}}', {{=it.white.cterm}} ]
let s:yellow = [ '{{=it.yellow.gui}}', {{=it.yellow.cterm}} ]

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

