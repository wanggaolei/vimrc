" $HOME/.vim/init/general.vimrc

set nocompatible
filetype plugin on
syntax enable
set backspace=2             " Backspace behaves like other programs do
set hidden                  " Undo persists even when switching to different open buffers
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,latin1

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
if has('win32')
"  set guifont=Sauce_Code_Powerline:h13:cANSI
  set guifont=Inconsolata\ for\ Powerline:h13
"  set guifontwide=Microsoft_YaHei_Mono:h12
endif
