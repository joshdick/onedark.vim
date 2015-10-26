# onedark.vim

A dark Vim colorscheme for the GUI and 256-color terminals, based on [FlatColor](https://github.com/MaxSt/FlatColor), with colors inspired by the excellent [One Dark syntax theme](https://github.com/atom/one-dark-syntax) for the [Atom text editor](https://atom.io).

## Installation

Place `onedark.vim` in your `~/.vim/colors/` directory either manually or by using your Vim plug-in manager of choice, then add the following lines to your `~/.vimrc`:

    syntax on
    colorscheme onedark

## Options

* `g:onedark_termcolors`: Set to `256` for 256-color terminals (the default), or set to `16` to use your terminal emulator's native colors. A 16-color palette for this theme is not available yet.

* `g:onedark_terminal_italics`: Set to `1` if your terminal emulator supports italics; `0` otherwise (the default).
