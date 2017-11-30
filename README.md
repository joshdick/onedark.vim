# onedark.vim

A dark Vim/Neovim color scheme for the GUI and 16/256/true-color terminals, based on [FlatColor](https://github.com/MaxSt/FlatColor), with colors inspired by the excellent [One Dark syntax theme](https://github.com/atom/one-dark-syntax) for the [Atom text editor](https://atom.io).

![onedark.vim Preview](https://raw.githubusercontent.com/joshdick/onedark.vim/master/img/preview.png)

## Installation

1. Install the theme using your Vim plug-in manager of choice (or manually, by placing `colors/onedark.vim` in your `~/.vim/colors/` directory and `autoload/onedark.vim` in your `~/.vim/autoload/` directory.)

   The theme also supports being installed as a Vim 8 package. Simply clone this repository into `~/.vim/pack/*/opt/` (so that the local path to this README would end up being `~/.vim/pack/*/opt/onedark.vim/README.md`) and add `packadd! onedark.vim` to your `~/.vimrc`. (The `*` in the path can be any value; see `:help packages` for more information.)

2. If you use Vim in a terminal, do the following to test whether your terminal emulator supports [24-bit/"true" color](https://gist.github.com/XVilka/8346728), then add relevant `~/.vimrc` configuration if so:

   _Note: GUI (non-terminal) Vim will always display 24-bit color regardless of the configuration done in this step._

   Run the following snippet in your shell:

   ```shell
   printf "\x1b[38;2;255;100;0mTRUECOLOR\x1b[0m\n"
   ```

   If your terminal emulator **does NOT display the word `TRUECOLOR` in red**, it does not support 24-bit color. If you don't want to switch to a different terminal emulator that [supports 24-bit color](https://gist.github.com/XVilka/8346728), **proceed to step 3**. (After installation, the [`g:onedark_termcolors` option](#options) may interest you.)

   If your terminal emulator displays the word `TRUECOLOR` **in red**, it supports 24-bit color, and you should add the following lines to your `~/.vimrc` to enable 24-bit color terminal support inside Vim.

   (If you use [tmux](https://tmux.github.io/), be sure to view the tmux-related notes in the first few lines.)

   ```vim
   "Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
   "If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
   "(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
   if (empty($TMUX))
     if (has("nvim"))
       "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
       let $NVIM_TUI_ENABLE_TRUE_COLOR=1
     endif
     "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
     "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
     " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
     if (has("termguicolors"))
       set termguicolors
     endif
   endif
   ```

3. Add the following to your `~/.vimrc` (below any lines you may have added in steps 1 and 2):

   ```vim
   syntax on
   colorscheme onedark
   ```

4. Installing the [sheerun/vim-polyglot](https://github.com/sheerun/vim-polyglot) plug-in is recommended for improved syntax highlighting for various languages, but is not required.

## Options

**Note:** All options should be set **before** the `colorscheme onedark` line in your `~/.vimrc`.

* `g:onedark_termcolors` **(see [Troubleshooting](#troubleshooting) (below) for more information about this option)**: Set to `256` for 256-color terminals (the default), or set to `16` to use your terminal emulator's native 16 colors.

* `g:onedark_terminal_italics`: Set to `1` if your terminal emulator supports italics; `0` otherwise (the default).

## lightline.vim Colorscheme

![lightline-onedark.vim Preview](https://raw.github.com/joshdick/onedark.vim/master/img/preview_lightline.png)

This repository includes a companion [lightline.vim](https://github.com/itchyny/lightline.vim) colorscheme for use with onedark.vim.

The lightline.vim colorscheme:

* Depends on `autoload/onedark.vim` for its colors, and must therefore be used in conjunction with it.
* Works with both color modes available in onedark.vim (16 or 256 colors), as specified in the configuration for onedark.vim.

### Installation

(These instructions assume that lightline.vim and onedark.vim are already installed and configured to your liking.)

Place `onedark.vim/autoload/lightline/colorscheme/onedark.vim` in your `~/.vim/autoload/lightline/colorscheme/` directory either manually or by using your Vim plug-in manager of choice, then add the following lines to your `~/.vimrc` (or merge them into your existing lightline.vim configuration):

```vim
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ }
```

## vim-airline Theme

![airline-onedark.vim Preview](https://raw.github.com/joshdick/onedark.vim/master/img/preview_airline.png)

This repository includes a companion [vim-airline](https://github.com/vim-airline/vim-airline) theme for use with onedark.vim.

The vim-airline theme:

* Depends on `autoload/onedark.vim` for its colors, and must therefore be used in conjunction with it.
* Works with both color modes available in onedark.vim (16 or 256 colors), as specified in the configuration for onedark.vim.
* Is based on vim-airline's ["tomorrow" theme](https://github.com/vim-airline/vim-airline-themes/blob/master/autoload/airline/themes/tomorrow.vim).

### Installation

(These instructions assume that vim-airline and onedark.vim are already installed and configured to your liking.)

Place `onedark.vim/autoload/airline/themes/onedark.vim` in your `~/.vim/autoload/airline/themes/` directory either manually or by using your Vim plug-in manager of choice, then add the following line to your `~/.vimrc`:

```vim
let g:airline_theme='onedark'
```

## Troubleshooting

### Why do the colors in terminal Vim look totally crazy?

![Broken Colors](https://raw.githubusercontent.com/joshdick/onedark.vim/master/img/broken_colors.png)

If Vim looks similar to the screenshot above, you have enabled Vim's 24-bit color terminal support, but your terminal doesn't support 24 bit color. Remove the relevant `~/.vimrc` configuration for enabling 24-bit color support to get things looking better.

### Why do the colors in terminal Vim look slightly off/not like the preview image at the top of this README?

If your terminal doesn't support 24-bit color as described in the [Installation](#installation) section of this README, or 24-bit color support is not always available everywhere you use your Vim configuration, colors will not look like they do in the preview image.

However, you can use the `g:onedark_termcolors` option to control onedark.vim's fallback colors in situations where 24-bit color terminal support is not available.

`g:onedark_termcolors` can be set to one of two values, `256` for 256-color mode (the default), or `16` for 16-color mode (which uses your terminal emulator's native 16 colors.)

**When Vim/Neovim are configured to use use 24-bit color, the `g:onedark_termcolors` option is ignored. However, `g:onedark_termcolors` can still coexist with 24-bit color configuration.** For instance, when tmux 2.1 or earlier and/or older Vim/Neovim versions that don't support 24-bit color are used, the `g:onedark_termcolors` option will take effect.

* **256-color mode** is enabled by default with no additional configuration, but colors are less accurate since they are approximated using a 256-color palette. The background color will appear darker than in the preview image, and most other colors will appear brighter than in the preview image. If you don't want to change your terminal's color palette as described in the 16-color mode section below, and your terminal doesn't support 24-bit color, 256-color mode is your only option.

   Although 256-color mode is enabled by default (when not using 24-bit color as described above), you can explicitly enable it by adding the following line to your `~/.vimrc`:

   ```vim
   let g:onedark_termcolors=256
   ```

* **16-color mode** is the preferred option, since its colors are more accurate than those of 256-color mode. However, you'll need to set your terminal emulator's color palette to this color scheme's custom 16-color palette, since 16-color mode will cause the color scheme to use your terminal emulator's native 16 colors. If you don't use the custom 16-color palette in your terminal emulator when 16-color mode is enabled, onedark.vim's colors will not display correctly in Vim.

   The canonical version of the 16-color palette is an [Xresources](https://en.wikipedia.org/wiki/X_resources) file located in this repository at `term/One Dark.Xresources`. [iTerm2](https://iterm2.com) and Mac Terminal.app color schemes are also provided in `term/`. (The iTerm2 color scheme works with iTerm2 versions 2.9.x and later.) You should be able to easily convert the Xresources color scheme for use with your terminal emulator of choice either by hand, or automatically by using [termcolors](https://github.com/stayradiated/termcolors).

   Assuming your terminal emulator is configured to use the custom 16-color palette as described above, add the following line to your `~/.vimrc` to enable 16-color mode:

   ```vim
   let g:onedark_termcolors=16
   ```

### Why do all comments look like they're highlighted?

![Broken Italics](https://raw.githubusercontent.com/joshdick/onedark.vim/master/img/broken_italics.png)

If all comments look like the one in the screenshot above, you have enabled italics in onedark.vim by setting `g:onedark_terminal_italics=1` in your `~/.vimrc`, but your terminal isn't displaying italics correctly. You can either remove the option or [try to fix your terminal](https://github.com/joshdick/onedark.vim/issues/97#issuecomment-299719352). If you're using [iTerm2](http://iterm2.com) on macOS, you might need to [use a special TERMINFO](https://gist.github.com/sos4nt/3187620) to get italics working.

## Miscellaneous

### Customizing onedark.vim's look without forking the repository

onedark.vim exposes `onedark#extend_highlight` and `onedark#set_highlight` functions that you can call from within your `~/.vimrc` in order to customize the look of onedark.vim.

#### `onedark#extend_highlight`

`onedark#extend_highlight` allows you to customize individual aspects of onedark.vim's existing highlight groups, overriding only the keys you provide. (To completely redefine/override an existing highlight group, see `onedark#set_highlight` below.)

`onedark#extend_highlight`'s first argunment should be the name of a highlight group, and its second argument should be **partial** style data.

Place the following lines **before** the `colorscheme onedark` line in your `~/.vimrc`, then change the example overrides to suit your needs:

```vim
if (has("autocmd"))
  augroup colorextend
    autocmd!
    " Make `Function`s bold in GUI mode
    autocmd ColorScheme * call onedark#extend_highlight("Function", { "gui": "bold" })
    " Override the `Statement` foreground color in 256-color mode
    autocmd ColorScheme * call onedark#extend_highlight("Statement", { "fg": { "cterm": 128 } })
    " Override the `Identifier` background color in GUI mode
    autocmd ColorScheme * call onedark#extend_highlight("Identifier", { "bg": { "gui": "#333333" } })
  augroup END
endif
```

#### `onedark#set_highlight`

`onedark#set_highlight` allows you to completely redefine/override highlight groups of your choosing.

`onedark#set_highlight`'s first argument should be the name of a highlight group, and its second argument should be **complete** style data.

For example, to remove the background color only when running in terminals (outside GUI mode and for use in transparent terminals,) place the following lines **before** the `colorscheme onedark` line in your `~/.vimrc`:

```vim
" onedark.vim override: Don't set a background color when running in a terminal;
" just use the terminal's background color
" `gui` is the hex color code used in GUI mode/nvim true-color mode
" `cterm` is the color code used in 256-color mode
" `cterm16` is the color code used in 16-color mode
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif
```

#### Global color overrides

You can override colors across all highlights by adding color definitions to the `g:onedark_color_overrides` dictionary in your `~/.vimrc` like so:

```vim
let g:onedark_color_overrides = {
\ "black": {"gui": "#2F343F", "cterm": "235", "cterm16": "0" },
\ "purple": { "gui": "#C678DF", "cterm": "170", "cterm16": "5" }
\}
```

This also needs to be done **before** `colorscheme onedark`.

More examples of highlight group names and style data can be found in onedark.vim's source code (`colors/onedark.vim` inside this repository).

### tmux theme

If you'd like a tmux theme that complements onedark.vim, [@odedlaz has you covered](https://github.com/odedlaz/tmux-onedark-theme).

### Contributing

If you'd like to contribute to onedark.vim, check out the [contribution guidelines](./CONTRIBUTING.md).

### Relatives of onedark.vim

Several other themes and projects have reused code and/or colors from this project, or were otherwise inspired by it.

If onedark.vim isn't meeting your needs, try one of its relatives!

* [KeitaNakamura/neodark.vim](https://github.com/KeitaNakamura/neodark.vim)
* [base16-onedark.vim](https://github.com/chriskempson/base16-vim/blob/master/colors/base16-onedark.vim)
  * Associated base16 scheme: [tilal6991/base16-onedark-scheme](https://github.com/tilal6991/base16-onedark-scheme)
* [rakr/vim-one](https://github.com/rakr/vim-one)

### Preview images

Preview images were taken using:

* [iTerm2](https://iterm2.com) terminal emulator on macOS
* 13 pt. [PragmataPro Mono](http://www.fsd.it/fonts/pragmatapro.htm#.VlDa1q6rTOY) font
* [vim-polyglot](https://github.com/sheerun/vim-polyglot) plug-in
