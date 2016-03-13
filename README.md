# onedark.vim

A dark Vim colorscheme for the GUI and 16/256-color terminals, based on [FlatColor](https://github.com/MaxSt/FlatColor), with colors inspired by the excellent [One Dark syntax theme](https://github.com/atom/one-dark-syntax) for the [Atom text editor](https://atom.io).

![onedark.vim Preview](https://raw.githubusercontent.com/joshdick/onedark.vim/master/preview.png)

Preview image taken using:

* [iTerm2 beta](https://iterm2.com/) terminal emulator on Mac OS X
* 12 pt. [PragmataPro Mono](http://www.fsd.it/fonts/pragmatapro.htm#.VlDa1q6rTOY) font
* [airline-onedark.vim](https://github.com/joshdick/airline-onedark.vim) theme for [vim-airline](https://github.com/bling/vim-airline)

## Installation

Place `onedark.vim` in your `~/.vim/colors/` directory either manually or by using your Vim plug-in manager of choice, then add the following lines to your `~/.vimrc`:

    syntax on
    colorscheme onedark

## Options

* `g:onedark_termcolors`: Set to `256` for 256-color terminals (the default), or set to `16` to use your terminal emulator's native colors (see below).

* `g:onedark_terminal_italics`: Set to `1` if your terminal emulator supports italics; `0` otherwise (the default).

## 16-Color Mode

Setting `g:onedark_termcolors=16` will cause the theme to use your terminal emulator's native 16 colors.

This theme looks best in 16-color mode **when using its custom 16-color palette**. If you don't use the custom 16-color palette in your terminal emulator while 16-color mode is enabled, the theme's colors will not display correctly.

The canonical version of the 16-color palette is an [iTerm2](https://iterm2.com) color scheme called `One Dark.itermcolors`, which lives in the root of this repository. This iTerm2 theme will only work on iTerm2 equal or greater than 2.9.* (currently the beta version).

You should be able to easily convert the iTerm2 color scheme for use with your terminal emulator of choice by using a tool like [termcolors](https://github.com/stayradiated/termcolors).

## vim-airline Theme

A companion [vim-airline](https://github.com/bling/vim-airline) theme for this theme is available at [joshdick/airline-onedark.vim](https://github.com/joshdick/airline-onedark.vim).

