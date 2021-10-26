" $HOME/.vim/init/plugins.vimrc


"这个是安装字体后 必须设置此项" 
let g:airline_powerline_fonts = 1   
 
let g:airline_theme='tomorrow'
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers

" NERDTree config
map <F2> :NERDTreeMirror<CR>
map <F2> :NERDTreeToggle<CR>
map <leader>t :NERDTreeToggle<CR>
" Open Nerdtree when there's no file opened
autocmd vimenter * if !argc()|NERDTree|endif
" Or, auto-open Nerdtree
"  autocmd vimenter * NERDTree
" Close NERDTree when there's no other windowws
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeAutoCenter=1
let NERDTreeBookmarksFile=$VIM.'\Data\NerdBookmarks.txt'
let NERDTreeMouseMode=2
let NERDTreeShowBookmarks=1
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
let NERDTreeWinPos="right"
let NERDTreeWinSize=31
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
let NERDTreeChDirMode=2
let NERDTreeQuitOnOpen=1   " Close NERDtree when files was opened
let NERDTreeMinimalUI=0    " Start NERDTree in minimal UI mode (No help lines)
let NERDTreeAutoDeleteBuffer=1  " Auto delete buffer deleted with NerdTree
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }
