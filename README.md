# onedark.vim

A dark Vim colorscheme for the GUI and 16/256-color terminals, based on [FlatColor](https://github.com/MaxSt/FlatColor), with colors inspired by the excellent [One Dark syntax theme](https://github.com/atom/one-dark-syntax) for the [Atom text editor](https://atom.io).

![onedark.vim Preview](https://raw.githubusercontent.com/joshdick/onedark.vim/master/preview.png)

Preview image taken using:

* [iTerm2](https://iterm2.com/) terminal emulator on Mac OS X
* 12 pt. [PragmataPro Mono](http://www.fsd.it/fonts/pragmatapro.htm#.VlDa1q6rTOY) font
* [airline-onedark.vim](https://github.com/joshdick/airline-onedark.vim) theme for [vim-airline](https://github.com/bling/vim-airline)

## Installation

Place `onedark.vim` in your `~/.vim/colors/` directory either manually or by using your Vim plug-in manager of choice, then add the following lines to your `~/.vimrc`:

    syntax on
    colorscheme onedark

## Options

**Note:** All options should be set **before** the `colorscheme onedark` line in your `~/.vimrc`.

* `g:onedark_termcolors`: Set to `256` for 256-color terminals (the default), or set to `16` to use your terminal emulator's native colors (see below).

* `g:onedark_terminal_italics`: Set to `1` if your terminal emulator supports italics; `0` otherwise (the default).

## 16-Color Mode

Adding `let g:onedark_termcolors=16` to your `~/.vimrc` will cause the theme to use your terminal emulator's native 16 colors. (Make sure this line appears **before** the `colorscheme onedark` line!)

This theme looks best in 16-color mode **when using its custom 16-color palette**. If you don't use the custom 16-color palette in your terminal emulator while 16-color mode is enabled, the theme's colors will not display correctly.

The canonical version of the 16-color palette is an [iTerm2](https://iterm2.com) color scheme called `One Dark.itermcolors`, which lives in the root of this repository. This theme only works with the test/beta releases of iTerm2 (versions 2.9.x and later.)

You should be able to easily convert the iTerm2 color scheme for use with your terminal emulator of choice by using a tool like [termcolors](https://github.com/stayradiated/termcolors).

### Neovim

If you're using [Neovim](http://neovim.io) and your terminal supports true colors, you may choose to use Neovim's [true color terminal support](https://github.com/neovim/neovim/pull/2198) **instead of** using this theme's 16-color mode and associated terminal color palette as described above.

This prevents you from needing to use this theme's 16-color terminal palette in order to see proper colors when using this theme in terminal Neovim. (When using this approach, if your terminal's background color doesn't match the theme's background color, you may see a border around Neovim.)

To use Neovim's true color terminal support, simply add the following lines to your `~/.vimrc` (or just add `let $NVIM_TUI_ENABLE_TRUE_COLOR=1` without the `if` statement if you're using Neovim-specific configuration):

```vim
if has("nvim")
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
```

## vim-airline Theme

A companion [vim-airline](https://github.com/bling/vim-airline) theme for this theme is available at [joshdick/airline-onedark.vim](https://github.com/joshdick/airline-onedark.vim).

