" $HOME/.vim/init/plugins.vimrc


"这个是安装字体后 必须设置此项" 
let g:airline_powerline_fonts = 1   
 
 "设置切换Buffer快捷键"
 nnoremap <C-N> :bn<CR>
 nnoremap <C-P> :bp<CR>

" 在Gvim中我设置了英文用Hermit， 中文使用 YaHei Mono "
if has('win32')
"  set guifont=Sauce_Code_Powerline:h13:cANSI
  set guifont=Inconsolata\ for\ Powerline:h13
"  set guifontwide=Microsoft_YaHei_Mono:h12
endif
 
let g:airline_theme='tomorrow'
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers

