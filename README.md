# onedark.vim

A dark Vim colorscheme for the GUI and 256-color terminals, based on [FlatColor](https://github.com/MaxSt/FlatColor), with colors inspired by the excellent [One Dark syntax theme](https://github.com/atom/one-dark-syntax) for the [Atom text editor](https://atom.io).

![onedark.vim Preview](https://raw.github.com/joshdick/onedark.vim/master/preview.png)

Preview image taken using:

* [iTerm2](https://iterm2.com/) terminal emulator on Mac OS X
* 12 pt. [PragmataPro Mono](http://www.fsd.it/fonts/pragmatapro.htm#.VlDa1q6rTOY) font
* [airline-onedark.vim](https://github.com/joshdick/airline-onedark.vim) theme for [vim-airline](https://github.com/bling/vim-airline)

## Installation

Place `onedark.vim` in your `~/.vim/colors/` directory either manually or by using your Vim plug-in manager of choice, then add the following lines to your `~/.vimrc`:

    syntax on
    colorscheme onedark

## Options

* `g:onedark_termcolors`: Set to `256` for 256-color terminals (the default), or set to `16` to use your terminal emulator's native colors. A 16-color palette for this theme is not available yet.

* `g:onedark_terminal_italics`: Set to `1` if your terminal emulator supports italics; `0` otherwise (the default).

## vim-airline Theme

A companion [vim-airline](https://github.com/bling/vim-airline) theme for this theme is available at [joshdick/airline-onedark.vim](https://github.com/joshdick/airline-onedark.vim).

