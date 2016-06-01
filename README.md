# onedark.vim

A dark Vim color scheme for the GUI and 16/256-color terminals, based on [FlatColor](https://github.com/MaxSt/FlatColor), with colors inspired by the excellent [One Dark syntax theme](https://github.com/atom/one-dark-syntax) for the [Atom text editor](https://atom.io).

![onedark.vim Preview](https://raw.githubusercontent.com/joshdick/onedark.vim/master/preview.png)

Preview image taken using:

* [iTerm2](https://iterm2.com) terminal emulator on Mac OS X
* 12 pt. [PragmataPro Mono](http://www.fsd.it/fonts/pragmatapro.htm#.VlDa1q6rTOY) font
* [airline-onedark.vim](https://github.com/joshdick/airline-onedark.vim) theme for [vim-airline](https://github.com/bling/vim-airline)
* [vim-polyglot](https://github.com/sheerun/vim-polyglot) plug-in

## Installation

1. If you use Vim in the terminal, determine whether [your terminal emulator has 24-bit color ("true color") support](https://gist.github.com/XVilka/8346728).

  Note that proper colors will always be shown when using GUI Vim, regardless of the configuration done in this step.

  * If your terminal emulator **DOES** support 24-bit color, add the following lines to your `~/.vimrc` (this works for Vim patch 7.4.1799 and above, as well as Neovim version 0.1.3 and above; if you use [tmux](https://tmux.github.io/), see the tmux-related notes at the top):

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

  * If you [additionally] use older versions of Vim/Neovim than mentioned above, or your terminal emulator **DOES NOT** support 24-bit color, or you use tmux 2.1 or earlier:

      You have two options, 16-color mode (which is preferred) or 256-color mode. These modes are selected via the `g:onedark_termcolors` setting. **When Vim/Neovim are actively using true-color mode as configured above, the `g:onedark_termcolors` setting will be be ignored. However, `g:onedark_termcolors` can still coexist with the configuration above.** For instance, when tmux 2.1 or earlier and/or older Vim/Neovim versions are used with the configuration above, `g:onedark_termcolors` will be honored/not ignored.

      * **16-color mode** is the preferred option, since its colors are more accurate than those of 256-color mode. However, you'll need to set your terminal's color palette to this color scheme's custom 16-color palette, since 16-color mode will cause the color scheme to use your terminal emulator's native 16 colors. If you don't use the custom 16-color palette in your terminal emulator when 16-color mode is enabled, the color scheme's colors will not display correctly.

         The canonical version of the 16-color palette is an [iTerm2](https://iterm2.com) color scheme called `One Dark.itermcolors`, which lives in the root of this repository. `One Dark.itermcolors` only works with the test/beta releases of iTerm2 (versions 2.9.x and later.) You should be able to easily convert the iTerm2 color scheme for use with your terminal emulator of choice by using a tool like [termcolors](https://github.com/stayradiated/termcolors).

         Assuming you're using the custom 16-color palette as described above, add the following line to your `~/.vimrc` to enable 16-color mode:

         ```vim
         let g:onedark_termcolors=16
         ```

     * **256-color mode** is enabled by default with no additional configuration, but colors are less accurate since they are approximated using a 256-color palette. The background color will appear darker, and most other colors will appear brighter. If you don't want to change your terminal's color palette as described in the 16-color mode section above, and your terminal doesn't support 24-bit color, 256-color mode is your only option.

         Although 256-color mode is enabled by default (when not using 24-bit color as described above), you can explicitly enable it by adding the following line to your `~/.vimrc`:

         ```vim
         let g:onedark_termcolors=256
         ```

2. Place `onedark.vim` in your `~/.vim/colors/` directory either manually or by using your Vim plug-in manager of choice, then add the following lines to your `~/.vimrc` **below the lines you added during step 1**:

    ```vim
    syntax on
    colorscheme onedark
    ```

3. Installing the [sheerun/vim-polyglot](https://github.com/sheerun/vim-polyglot) plug-in is recommended for improved syntax highlighting for various languages, but is not required.

## Options

**Note:** All options should be set **before** the `colorscheme onedark` line in your `~/.vimrc`.

* `g:onedark_termcolors` **(see [Installation](#installation) (above) before using this setting)**: Set to `256` for 256-color terminals (the default), or set to `16` to use your terminal emulator's native colors.

* `g:onedark_terminal_italics`: Set to `1` if your terminal emulator supports italics; `0` otherwise (the default).

## vim-airline Theme

A companion [vim-airline](https://github.com/bling/vim-airline) theme for this color scheme is available at [joshdick/airline-onedark.vim](https://github.com/joshdick/airline-onedark.vim).

