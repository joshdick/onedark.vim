" [onedark.vim](https://github.com/joshdick/onedark.vim/)

" This is a [vim-airline](https://github.com/vim-airline/vim-airline) theme for use with
" the [onedark.vim](https://github.com/joshdick/onedark.vim) colorscheme.

" It is based on vim-airline's ["tomorrow" theme](https://github.com/vim-airline/vim-airline-themes/blob/master/autoload/airline/themes/tomorrow.vim).
function! airline#themes#onedark#refresh()

  let g:airline#themes#onedark#palette = {}

  let g:airline#themes#onedark#palette.accents = {
        \ 'red': airline#themes#get_highlight('Constant'),
        \ }

  let s:N1 = airline#themes#get_highlight2(['Normal', 'bg'], ['String', 'fg'])
  let s:N2 = airline#themes#get_highlight('Pmenu')
  let s:N3 = airline#themes#get_highlight('String')
  let g:airline#themes#onedark#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)

  let group = airline#themes#get_highlight('vimCommand')
  let g:airline#themes#onedark#palette.normal_modified = {
        \ 'airline_c': [ group[0], '', group[2], '', '' ]
        \ }

  let s:I1 = airline#themes#get_highlight('Cursor')
  let s:I2 = s:N2
  let s:I3 = airline#themes#get_highlight2(['Cursor', 'bg'], ['Normal', 'bg'])
  let g:airline#themes#onedark#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
  let g:airline#themes#onedark#palette.insert_modified = g:airline#themes#onedark#palette.normal_modified

  let s:R1 = airline#themes#get_highlight2(['Normal', 'bg'], ['Error', 'fg'])
  let s:R2 = s:N2
  let s:R3 = airline#themes#get_highlight('Error')
  let g:airline#themes#onedark#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)
  let g:airline#themes#onedark#palette.replace_modified = g:airline#themes#onedark#palette.normal_modified

  let s:V1 = airline#themes#get_highlight2(['Normal', 'bg'], ['Statement', 'fg'])
  let s:V2 = s:N2
  let s:V3 = airline#themes#get_highlight2(['Statement', 'fg'], ['Normal', 'bg'])
  let g:airline#themes#onedark#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
  let g:airline#themes#onedark#palette.visual_modified = g:airline#themes#onedark#palette.normal_modified

  let s:IA1 = airline#themes#get_highlight2(['Normal', 'bg'], ['Normal', 'fg'])
  let s:IA2 = airline#themes#get_highlight2(['Normal', 'fg'], ['Visual', 'bg'])
  let s:IA3 = s:N2
  let g:airline#themes#onedark#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)
  let g:airline#themes#onedark#palette.inactive_modified = {
        \ 'airline_c': [ group[0], '', group[2], '', '' ]
        \ }

  " Warning/Error styling code from vim-airline's ["base16" theme](https://github.com/vim-airline/vim-airline-themes/blob/master/autoload/airline/themes/base16.vim)

  " Warnings
  let s:WI = airline#themes#get_highlight2(['WarningMsg', 'bg'], ['WarningMsg', 'fg'], 'bold')
  let g:airline#themes#onedark#palette.normal.airline_warning = [
       \ s:WI[0], s:WI[1], s:WI[2], s:WI[3]
       \ ]

  let g:airline#themes#onedark#palette.normal_modified.airline_warning =
      \ g:airline#themes#onedark#palette.normal.airline_warning

  let g:airline#themes#onedark#palette.insert.airline_warning =
      \ g:airline#themes#onedark#palette.normal.airline_warning

  let g:airline#themes#onedark#palette.insert_modified.airline_warning =
      \ g:airline#themes#onedark#palette.normal.airline_warning

  let g:airline#themes#onedark#palette.visual.airline_warning =
      \ g:airline#themes#onedark#palette.normal.airline_warning

  let g:airline#themes#onedark#palette.visual_modified.airline_warning =
      \ g:airline#themes#onedark#palette.normal.airline_warning

  let g:airline#themes#onedark#palette.replace.airline_warning =
      \ g:airline#themes#onedark#palette.normal.airline_warning

  let g:airline#themes#onedark#palette.replace_modified.airline_warning =
      \ g:airline#themes#onedark#palette.normal.airline_warning

  " Errors
  let s:ER = airline#themes#get_highlight2(['ErrorMsg', 'bg'], ['ErrorMsg', 'fg'], 'bold')
  let g:airline#themes#onedark#palette.normal.airline_error = [
       \ s:ER[0], s:ER[1], s:ER[2], s:ER[3]
       \ ]

  let g:airline#themes#onedark#palette.normal_modified.airline_error =
      \ g:airline#themes#onedark#palette.normal.airline_error

  let g:airline#themes#onedark#palette.insert.airline_error =
      \ g:airline#themes#onedark#palette.normal.airline_error

  let g:airline#themes#onedark#palette.insert_modified.airline_error =
      \ g:airline#themes#onedark#palette.normal.airline_error

  let g:airline#themes#onedark#palette.visual.airline_error =
      \ g:airline#themes#onedark#palette.normal.airline_error

  let g:airline#themes#onedark#palette.visual_modified.airline_error =
      \ g:airline#themes#onedark#palette.normal.airline_error

  let g:airline#themes#onedark#palette.replace.airline_error =
      \ g:airline#themes#onedark#palette.normal.airline_error

  let g:airline#themes#onedark#palette.replace_modified.airline_error =
      \ g:airline#themes#onedark#palette.normal.airline_error

endfunction

call airline#themes#onedark#refresh()
