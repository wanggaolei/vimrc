" $HOME/.vim/init/plugins.vimrc


"����ǰ�װ����� �������ô���" 
" let g:airline_powerline_fonts = 1   
 
 "�����л�Buffer��ݼ�"
 nnoremap <C-N> :bn<CR>
 nnoremap <C-P> :bp<CR>

" ��Gvim����������Ӣ����Hermit�� ����ʹ�� YaHei Mono "
if has('win32')
"  set guifont=Sauce_Code_Powerline:h13:cANSI
  set guifont=Inconsolata\ for\ Powerline:h13
"  set guifontwide=Microsoft_YaHei_Mono:h12
endif
 
let g:airline_theme='tomorrow'
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers

