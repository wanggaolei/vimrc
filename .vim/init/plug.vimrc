" $HOME/.vim/init/plug.vimrc

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'  " display git status within Nerdtree
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " enhance devicons
call plug#end()

