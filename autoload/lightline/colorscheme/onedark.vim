" [onedark.vim](https://github.com/joshdick/onedark.vim/)

" This is a [lightline.vim](https://github.com/itchyny/lightline.vim) colorscheme for use with
" the [onedark.vim](https://github.com/joshdick/onedark.vim) colorscheme.

if get(g:, 'onedark_termcolors', 256) == 16
  let s:term_red = 1
  let s:term_green = 2
  let s:term_yellow = 3
  let s:term_blue = 4
  let s:term_purple = 5
  let s:term_white = 7
  let s:term_black = 0
  let s:term_grey = 8
else
  let s:term_red = 204
  let s:term_green = 114
  let s:term_yellow = 180
  let s:term_blue = 39
  let s:term_purple = 170
  let s:term_white = 145
  let s:term_black = 235
  let s:term_grey = 236
endif

let s:red = [ '#E06C75', s:term_red ]
let s:green = [ '#98C379', s:term_green ]
let s:yellow = [ '#E5C07B', s:term_yellow ]
let s:blue = [ '#61AFEF', s:term_blue ]
let s:purple = [ '#C678DD', s:term_purple ]
let s:white = [ '#ABB2BF', s:term_white ]
let s:black = [ '#282C34', s:term_black ]
let s:grey = [ '#3E4452', s:term_grey ]

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

