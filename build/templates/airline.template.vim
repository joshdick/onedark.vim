" [onedark.vim](https://github.com/joshdick/onedark.vim/)

" This is a [vim-airline](https://github.com/vim-airline/vim-airline) theme for use with
" the [onedark.vim](https://github.com/joshdick/onedark.vim) colorscheme.

" It is based on vim-airline's ["tomorrow" theme](https://github.com/vim-airline/vim-airline-themes/blob/master/autoload/airline/themes/tomorrow.vim).
function! airline#themes#onedark#refresh()

  if get(g:, 'onedark_termcolors', 256) == 16
    let s:term_red = <%=it.red.cterm16%>
    let s:term_green = <%=it.green.cterm16%>
    let s:term_yellow = <%=it.yellow.cterm16%>
    let s:term_blue = <%=it.blue.cterm16%>
    let s:term_purple = <%=it.purple.cterm16%>
    let s:term_white = <%=it.white.cterm16%>
    let s:term_black = <%=it.black.cterm16%>
    let s:term_grey = <%=it.cursor_grey.cterm16%>
  else
    let s:term_red = <%=it.red.cterm%>
    let s:term_green = <%=it.green.cterm%>
    let s:term_yellow = <%=it.yellow.cterm%>
    let s:term_blue = <%=it.blue.cterm%>
    let s:term_purple = <%=it.purple.cterm%>
    let s:term_white = <%=it.white.cterm%>
    let s:term_black = <%=it.black.cterm%>
    let s:term_grey = <%=it.cursor_grey.cterm%>
  endif

  let g:airline#themes#onedark#palette = {}

  let g:airline#themes#onedark#palette.accents = {
        \ 'red': [ '<%=it.red.gui%>', '', s:term_red, 0 ]
        \ }

  let s:N1 = [ '<%=it.black.gui%>', '<%=it.green.gui%>', s:term_black, s:term_green ]
  let s:N2 = [ '<%=it.white.gui%>', '<%=it.visual_grey.gui%>', s:term_white, s:term_grey ]
  let s:N3 = [ '<%=it.green.gui%>', '<%=it.black.gui%>', s:term_green, '' ]
  let g:airline#themes#onedark#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)

  let group = airline#themes#get_highlight('vimCommand')
  let g:airline#themes#onedark#palette.normal_modified = {
        \ 'airline_c': [ group[0], '', group[2], '', '' ]
        \ }

  let s:I1 = [ '<%=it.black.gui%>', '<%=it.blue.gui%>', s:term_black, s:term_blue ]
  let s:I2 = s:N2
  let s:I3 = [ '<%=it.blue.gui%>', '<%=it.black.gui%>', s:term_blue, '' ]
  let g:airline#themes#onedark#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
  let g:airline#themes#onedark#palette.insert_modified = g:airline#themes#onedark#palette.normal_modified

  let s:R1 = [ '<%=it.black.gui%>', '<%=it.red.gui%>', s:term_black, s:term_red ]
  let s:R2 = s:N2
  let s:R3 = [ '<%=it.red.gui%>', '<%=it.black.gui%>', s:term_red, '' ]
  let g:airline#themes#onedark#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)
  let g:airline#themes#onedark#palette.replace_modified = g:airline#themes#onedark#palette.normal_modified

  let s:V1 = [ '<%=it.black.gui%>', '<%=it.purple.gui%>', s:term_black, s:term_purple ]
  let s:V2 = s:N2
  let s:V3 = [ '<%=it.purple.gui%>', '<%=it.black.gui%>', s:term_purple, '' ]
  let g:airline#themes#onedark#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
  let g:airline#themes#onedark#palette.visual_modified = g:airline#themes#onedark#palette.normal_modified

  let s:IA1 = [ '<%=it.black.gui%>', '<%=it.white.gui%>', s:term_black, s:term_white ]
  let s:IA2 = [ '<%=it.white.gui%>', '<%=it.visual_grey.gui%>', s:term_white, s:term_grey ]
  let s:IA3 = s:N2
  let g:airline#themes#onedark#palette.inactive = airline#themes#generate_color_map(s:IA1, s:IA2, s:IA3)
  let g:airline#themes#onedark#palette.inactive_modified = {
        \ 'airline_c': [ group[0], '', group[2], '', '' ]
        \ }

  " Warning/Error styling code from vim-airline's ["base16" theme](https://github.com/vim-airline/vim-airline-themes/blob/master/autoload/airline/themes/base16.vim)

  " Warnings
  let s:WI = [ '<%=it.black.gui%>', '<%=it.yellow.gui%>', s:term_black, s:term_yellow ]
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
  let s:ER = [ '<%=it.black.gui%>', '<%=it.red.gui%>', s:term_black, s:term_red ]
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
