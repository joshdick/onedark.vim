" [onedark.vim](https://github.com/joshdick/onedark.vim/)

let s:overrides = get(g:, "onedark_color_overrides", {})

let s:colors = {
      \ "red": get(s:overrides, "red", { "gui": "<%=red.gui%>", "cterm": "<%=red.cterm%>", "cterm16": "<%=red.cterm16%>" }),
      \ "dark_red": get(s:overrides, "dark_red", { "gui": "<%=dark_red.gui%>", "cterm": "<%=dark_red.cterm%>", "cterm16": "<%=dark_red.cterm16%>" }),
      \ "green": get(s:overrides, "green", { "gui": "<%=green.gui%>", "cterm": "<%=green.cterm%>", "cterm16": "<%=green.cterm16%>" }),
      \ "yellow": get(s:overrides, "yellow", { "gui": "<%=yellow.gui%>", "cterm": "<%=yellow.cterm%>", "cterm16": "<%=yellow.cterm16%>" }),
      \ "dark_yellow": get(s:overrides, "dark_yellow", { "gui": "<%=dark_yellow.gui%>", "cterm": "<%=dark_yellow.cterm%>", "cterm16": "<%=dark_yellow.cterm16%>" }),
      \ "blue": get(s:overrides, "blue", { "gui": "<%=blue.gui%>", "cterm": "<%=blue.cterm%>", "cterm16": "<%=blue.cterm16%>" }),
      \ "purple": get(s:overrides, "purple", { "gui": "<%=purple.gui%>", "cterm": "<%=purple.cterm%>", "cterm16": "<%=purple.cterm16%>" }),
      \ "cyan": get(s:overrides, "cyan", { "gui": "<%=cyan.gui%>", "cterm": "<%=cyan.cterm%>", "cterm16": "<%=cyan.cterm16%>" }),
      \ "white": get(s:overrides, "white", { "gui": "<%=white.gui%>", "cterm": "<%=white.cterm%>", "cterm16": "<%=white.cterm16%>" }),
      \ "black": get(s:overrides, "black", { "gui": "<%=black.gui%>", "cterm": "<%=black.cterm%>", "cterm16": "<%=black.cterm16%>" }),
      \ "visual_black": get(s:overrides, "visual_black", { "gui": "NONE", "cterm": "NONE", "cterm16": "<%=black.cterm16%>" }),
      \ "comment_grey": get(s:overrides, "comment_grey", { "gui": "<%=comment_grey.gui%>", "cterm": "<%=comment_grey.cterm%>", "cterm16": "<%=comment_grey.cterm16%>" }),
      \ "gutter_fg_grey": get(s:overrides, "gutter_fg_grey", { "gui": "<%=gutter_fg_grey.gui%>", "cterm": "<%=gutter_fg_grey.cterm%>", "cterm16": "<%=gutter_fg_grey.cterm16%>" }),
      \ "cursor_grey": get(s:overrides, "cursor_grey", { "gui": "<%=cursor_grey.gui%>", "cterm": "<%=cursor_grey.cterm%>", "cterm16": "<%=cursor_grey.cterm16%>" }),
      \ "visual_grey": get(s:overrides, "visual_grey", { "gui": "<%=visual_grey.gui%>", "cterm": "<%=visual_grey.cterm%>", "cterm16": "<%=visual_grey.cterm16%>" }),
      \ "menu_grey": get(s:overrides, "menu_grey", { "gui": "<%=visual_grey.gui%>", "cterm": "<%=visual_grey.cterm%>", "cterm16": "<%=menu_grey.cterm16%>" }),
      \ "special_grey": get(s:overrides, "special_grey", { "gui": "<%=special_grey.gui%>", "cterm": "<%=special_grey.cterm%>", "cterm16": "<%=special_grey.cterm16%>" }),
      \ "vertsplit": get(s:overrides, "vertsplit", { "gui": "<%=vertsplit.gui%>", "cterm": "<%=vertsplit.cterm%>", "cterm16": "<%=vertsplit.cterm16%>" }),
      \}

function! onedark#GetColors()
  return s:colors
endfunction
