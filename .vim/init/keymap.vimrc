" $HOME/.vim/init/leader.vimrc
"
" 5 => Keymap {{{
let mapleader=","
let g:mapleader=","
" {{ 避免按键误操作
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
" }}
nnoremap <tab> %
vnoremap <tab> %
" nnoremap <leader><leader> <c-^>
"nnoremap <leader>w :set wrap!<cr>
" 快速保存
nmap <leader>w :w!<CR>
" ;等同于:
" nnoremap ; :
" 映射快捷键代替使用<Esc>退出插入模式
inoremap ,; <ESC>
inoremap jk <ESC>

"设置切换Buffer快捷键"
nnoremap <C-N> :bn<CR>
" Ctrl+p快捷键给了快速粘贴
" nnoremap <C-P> :bp<CR>

" {{ Wrapped lines goes down/up to next row, rather than next line in file.
noremap j gj
noremap k gk
" }}
" 快速编辑配置文件
" nmap <leader>s :source $MYVIMRC<CR>
" nnoremap <leader>e :e $MYVIMRC<cr>
" nnoremap <leader>e :vsplit! $MYVIMRC<CR>

nmap <leader>tn :tabnew<CR>
nmap <leader>tc :tabclose<CR>
nmap <leader>th :tabp<CR>
nmap <leader>tl :tabn<CR>
" {{ 窗口切换快捷键
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" }}
" 设分割的窗口等大小
map <Leader>= <C-w>=
" }}
" 普通模式下全选
nnoremap <C-a> <ESC>ggVG
" IDE like delete
inoremap <C-BS> <ESC>bdei
" 在单词上加上{}
map <leader>b wbi{<ESC>ea}<ESC>
" 普通模式下快速插入一个空行
" nnoremap <C-o> <ESC>o<ESC>0"_d$<ESC>
nnoremap <C-o> :split 
" 普通模式下，快速新粘贴一行
nnoremap <C-p> <ESC>o<ESC>0"_d$<ESC>p
" 转换当前词为大写
nnoremap <C-u> <ESC>mzgUiw
" {{ 命令模式下的行首尾
cnoremap <C-a> <HOME>
cnoremap <C-e> <END>
" }}
" {{ 取消高亮, 放弃c关键字，因为nerdcommenter使用<leader>c作为开始
" noremap <leader>c :nohl<cr>
" noremap <leader><space> :nohl<cr>
" noremap <leader><cr> :nohl<cr>
noremap <silent> <leader>/ :nohl<CR>
" }}
vnoremap <C-c> "+y
map <S-Insert> "+gP


" Function keymaps {{
" autocmd BufWritePre * call RemoveTrailingWhitespace()
nmap <leader>clsp :call RemoveTrailingWhitespace()<CR>

map <leader>vd :call ToggleThemeMode('dark')<CR>
map <leader>va :call ToggleThemeMode('')<CR>
" }}
" }}}
