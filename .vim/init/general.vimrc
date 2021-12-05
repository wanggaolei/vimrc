" $HOME/.vim/init/general.vimrc

set nocompatible
filetype plugin on
syntax enable
set backspace=2             " Backspace behaves like other programs do
set hidden                  " Undo persists even when switching to different open buffers
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,latin1
set encoding=utf8

" colors
colorscheme Tomorrow-Night

" searching
set incsearch               " search as characters are entered
set hlsearch                " highlight matches
set ignorecase              " be smart about case in search
set wildmenu                " visual autocomplete for command menu

"设置切换Buffer快捷键"
nnoremap <C-N> :bn<CR>
nnoremap <C-P> :bp<CR>
inoremap jk <ESC>

" 在Gvim中我设置了英文用Hermit， 中文使用 YaHei Mono "
if has("gui_running")
  if has("gui_gtk2") || has("gui_gtk3")
    set guifont=DroidSansMono\ Nerd\ Font\ Book\ 11
  elseif has("gui_photon")
    set guifont=DroidSansMono\ Nerd\ Font\ Book:s11
  elseif has("gui_kde")
    set guifont=DroidSansMono\ Nerd\ Font\ Book/11/-1/5/50/0/0/0/1/0
  elseif has("x11")
    set guifont=-*-courier-medium-r-normal-*-*-180-*-*-m-*-*
  else
    set guifont=DroidSansMono_Nerd_Font_Book:h11:cDEFAULT
  endif
endif

" 设置行号
set number
" 相对行号
set relativenumber
