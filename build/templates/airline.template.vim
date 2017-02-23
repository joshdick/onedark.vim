"[onedark.vim](https://github.com/joshdick/onedark.vim/)

" This is a [vim-airline](https://github.com/vim-airline/vim-airline) theme for use with
" the [onedark.vim](https://github.com/joshdick/onedark.vim) colorscheme.

" It is based on vim-airline's ["tomorrow" theme](https://github.com/vim-airline/vim-airline-themes/blob/master/autoload/airline/themes/tomorrow.vim).
function! airline#themes#onedark#refresh()

  let g:airline#themes#onedark#palette = {}

  let g:airline#themes#onedark#palette.accents = {
        \ 'red': [ '{{=it.red.gui}}', '', {{=it.red.cterm}}, 0 ]
        \ }

  let s:N1 = [ '{{=it.black.gui}}', '{{=it.green.gui}}', {{=it.black.cterm}}, {{=it.green.cterm}} ]
  let s:N2 = [ '{{=it.white.gui}}', '{{=it.visual_grey.gui}}', {{=it.white.cterm}}, {{=it.visual_grey.cterm}} ]
  let s:N3 = [ '{{=it.green.gui}}', '{{=it.black.gui}}', {{=it.green.cterm}}, '' ]
  let g:airline#themes#onedark#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)

  let group = airline#themes#get_highlight('vimCommand')
  let g:airline#themes#onedark#palette.normal_modified = {
        \ 'airline_c': [ group[0], '', group[2], '', '' ]
        \ }

  let s:I1 = [ '{{=it.black.gui}}', '{{=it.blue.gui}}', {{=it.black.cterm}}, {{=it.blue.cterm}} ]
  let s:I2 = s:N2
  let s:I3 = [ '{{=it.blue.gui}}', '{{=it.black.gui}}', {{=it.blue.cterm}}, '' ]
  let g:airline#themes#onedark#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
  let g:airline#themes#onedark#palette.insert_modified = g:airline#themes#onedark#palette.normal_modified

  let s:R1 = [ '{{=it.black.gui}}', '{{=it.red.gui}}', {{=it.black.cterm}}, {{=it.red.cterm}} ]
  let s:R2 = s:N2
  let s:R3 = [ '{{=it.red.gui}}', '{{=it.black.gui}}', {{=it.red.cterm}}, '' ]
  let g:airline#themes#onedark#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)
  let g:airline#themes#onedark#palette.replace_modified = g:airline#themes#onedark#palette.normal_modified

  let s:V1 = [ '{{=it.black.gui}}', '{{=it.purple.gui}}', {{=it.black.cterm}}, {{=it.purple.cterm}} ]
  let s:V2 = s:N2
  let s:V3 = [ '{{=it.purple.gui}}', '{{=it.black.gui}}', {{=it.purple.cterm}}, '' ]
  let g:airline#themes#onedark#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
  let g:airline#themes#onedark#palette.visual_modified = g:airline#themes#onedark#palette.normal_modified

  let s:IA1 = [ '{{=it.black.gui}}', '{{=it.white.gui}}', {{=it.black.cterm}}, {{=it.white.cterm}} ]
  let s:IA2 = [ '{{=it.white.gui}}', '{{=it.visual_grey.gui}}', {{=it.white.cterm}}, {{=it.visual_grey.cterm}} ]
  let s:IA3 = s:N2
  let g:airline#themes#onedark#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)
  let g:airline#themes#onedark#palette.inactive_modified = {
        \ 'airline_c': [ group[0], '', group[2], '', '' ]
        \ }

  " Warning/Error styling code from vim-airline's ["base16" theme](https://github.com/vim-airline/vim-airline-themes/blob/master/autoload/airline/themes/base16.vim)

  " Warnings
  let s:WI = [ '{{=it.black.gui}}', '{{=it.yellow.gui}}', {{=it.black.cterm}}, {{=it.yellow.cterm}} ]
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
  let s:ER = [ '{{=it.black.gui}}', '{{=it.red.gui}}', {{=it.black.cterm}}, {{=it.red.cterm}} ]
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
