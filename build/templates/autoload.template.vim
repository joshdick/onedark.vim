" [onedark.vim](https://github.com/joshdick/onedark.vim/)

let s:overrides = get(g:, "onedark_color_overrides", {})

let s:colors = {
      \ "red": get(s:overrides, "red", { "gui": "<%=it.red.gui%>", "cterm": "<%=it.red.cterm%>", "cterm16": "<%=it.red.cterm16%>" }),
      \ "dark_red": get(s:overrides, "dark_red", { "gui": "<%=it.dark_red.gui%>", "cterm": "<%=it.dark_red.cterm%>", "cterm16": "<%=it.dark_red.cterm16%>" }),
      \ "green": get(s:overrides, "green", { "gui": "<%=it.green.gui%>", "cterm": "<%=it.green.cterm%>", "cterm16": "<%=it.green.cterm16%>" }),
      \ "yellow": get(s:overrides, "yellow", { "gui": "<%=it.yellow.gui%>", "cterm": "<%=it.yellow.cterm%>", "cterm16": "<%=it.yellow.cterm16%>" }),
      \ "dark_yellow": get(s:overrides, "dark_yellow", { "gui": "<%=it.dark_yellow.gui%>", "cterm": "<%=it.dark_yellow.cterm%>", "cterm16": "<%=it.dark_yellow.cterm16%>" }),
      \ "blue": get(s:overrides, "blue", { "gui": "<%=it.blue.gui%>", "cterm": "<%=it.blue.cterm%>", "cterm16": "<%=it.blue.cterm16%>" }),
      \ "purple": get(s:overrides, "purple", { "gui": "<%=it.purple.gui%>", "cterm": "<%=it.purple.cterm%>", "cterm16": "<%=it.purple.cterm16%>" }),
      \ "cyan": get(s:overrides, "cyan", { "gui": "<%=it.cyan.gui%>", "cterm": "<%=it.cyan.cterm%>", "cterm16": "<%=it.cyan.cterm16%>" }),
      \ "white": get(s:overrides, "white", { "gui": "<%=it.white.gui%>", "cterm": "<%=it.white.cterm%>", "cterm16": "<%=it.white.cterm16%>" }),
      \ "black": get(s:overrides, "black", { "gui": "<%=it.black.gui%>", "cterm": "<%=it.black.cterm%>", "cterm16": "<%=it.black.cterm16%>" }),
      \ "visual_black": get(s:overrides, "visual_black", { "gui": "NONE", "cterm": "NONE", "cterm16": "<%=it.black.cterm16%>" }),
      \ "comment_grey": get(s:overrides, "comment_grey", { "gui": "<%=it.comment_grey.gui%>", "cterm": "<%=it.comment_grey.cterm%>", "cterm16": "<%=it.comment_grey.cterm16%>" }),
      \ "gutter_fg_grey": get(s:overrides, "gutter_fg_grey", { "gui": "<%=it.gutter_fg_grey.gui%>", "cterm": "<%=it.gutter_fg_grey.cterm%>", "cterm16": "<%=it.gutter_fg_grey.cterm16%>" }),
      \ "cursor_grey": get(s:overrides, "cursor_grey", { "gui": "<%=it.cursor_grey.gui%>", "cterm": "<%=it.cursor_grey.cterm%>", "cterm16": "<%=it.cursor_grey.cterm16%>" }),
      \ "visual_grey": get(s:overrides, "visual_grey", { "gui": "<%=it.visual_grey.gui%>", "cterm": "<%=it.visual_grey.cterm%>", "cterm16": "<%=it.visual_grey.cterm16%>" }),
      \ "menu_grey": get(s:overrides, "menu_grey", { "gui": "<%=it.visual_grey.gui%>", "cterm": "<%=it.visual_grey.cterm%>", "cterm16": "<%=it.menu_grey.cterm16%>" }),
      \ "special_grey": get(s:overrides, "special_grey", { "gui": "<%=it.special_grey.gui%>", "cterm": "<%=it.special_grey.cterm%>", "cterm16": "<%=it.special_grey.cterm16%>" }),
      \ "vertsplit": get(s:overrides, "vertsplit", { "gui": "<%=it.vertsplit.gui%>", "cterm": "<%=it.vertsplit.cterm%>", "cterm16": "<%=it.vertsplit.cterm16%>" }),
      \}

function! onedark#GetColors()
  return s:colors
endfunction
