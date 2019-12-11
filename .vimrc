" --------------------------------------------------------------
" Name: Vimrc for Linux or Windows
" Location: ~/.vimrc
" Authoer: keelii <keeliizhou@gmail.com>
" Modified: wanggaolei <wanggaolei@gmail.com>
" Reference: http://www.btroot.org
" 注释说明：
" 1，注释必须放在命令在上一行，map命令会把同一行注释也包括进去
" 2, 注释+空格+命令超过100列，使用下面格式
" " {{ notes
" " -- notes(more)
" command
" " }}
" --------------------------------------------------------------

" 0 => Startup {{{
" {{ When started as "evim",
" -- evim.vim will already have done these settings.
if v:progname =~? "evim"
    finish
endif
" }}
" 载入ftplugin文件类型插件
filetype plugin on
" 为特定文件类型载入相关缩进文件
filetype indent on
" 使用vundle时需要设置off；等同于上述两条
" filetype plugin indent on
augroup vimrcEx
    au!
    autocmd FileType text setlocal textwidth=78
augroup END
" vim 文件折叠方式为 marker
augroup ft_vim
    au!
    autocmd FileType vim setlocal foldmethod=marker
" 打开文件总是定位到上次编辑的位置
    autocmd BufReadPost *
      \ if line("'\"") > 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif
augroup END
" }}}

" 1 => General {{{
" 取消兼容Vi设置，避免命令冲突
set nocompatible
" 遇到punctuation时,禁用J合并语句插入两个空格
set nojoinspaces
" 处理为保存或只读文件的时候弹出确定comfirm
set confirm
" {{ 设置undo操作
set undofile
" undo 记忆1000,即默认值
set undolevels=1000
" undo reload 保存buffer值10000,即默认值
set undoreload=10000
let g:data_dir = $HOME . '/.vim/'
let g:undo_dir = g:data_dir . 'undofile'
if finddir(g:data_dir) == ''
    silent call mkdir(g:data_dir)
endif
if finddir(g:undo_dir) == ''
    silent call mkdir(g:undo_dir)
endif
let &undodir=g:undo_dir
unlet g:undo_dir
unlet g:data_dir
"" }}
" 取消编辑文件备份；在设置了undofile情况下，备份可以省略
set nobackup
" 设置备份时的行为为覆盖autobackup cover "set nowritebackup
" set backupcopy=yes
" 可以在buffer的任何地方使用鼠标
set mouse=a
" 在GUI模式下隐藏鼠标
set mousehide
" 光标所在位置也属于被选中的范围
set selection=exclusive
" 鼠标键盘可用
set selectmode=mouse,key
" 关闭临时文件,不生成swap文件
set noswapfile
" 不让vim发出讨厌的滴滴声 set noeb
set noerrorbells
" 不使用unicode BOM
set nobomb
set history=1024
" 设置当文件被改动时自动载入
set autoread
" 设置打开文件后自动切换到文件所在目录
set autochdir
" {{ 在执行宏命令时，不进行实时重绘；
" -- 在宏命令执行完成后，一次性重绘，以便提高性能。
set lazyredraw
"}}
" 设置后，yy直接覆盖"*寄存器无需明显制定
set clipboard+=unnamed
" 设置 alt 键不映射到菜单栏
set winaltkeys=no
" }}}

" 2 => Lang & Encoding {{{
" 可读二进制文件,设置后,ffs和ff都失效
" set binary
" 自动识别Unix和MS-dos格式文件,未设置ff时，第一个即为ff值
set fileformats=unix,dos,mac
" 当ffs是空并且binary是off时,新建一个文件参考值
set fileformat=unix
" vim 支持中文 内部编码
set encoding=utf-8
" work in linux
set termencoding=utf-8
" {{ 文件解析猜测识别的编码顺序
set fileencodings=ucs-bom,utf-8,gbk2312,gbk,cp936,gb18030,big5,euc-jp,euc-kr,latin1
" }}
" Windows下有效
set fileencoding=utf-8
set imcmdline
" {{ 保存全局变量," 寄存器中保存几行文本 0不保存500上限
set viminfo+=!
set viminfo+='1000,f1,<500
" }}
set langmenu=en
let $LANG = 'en_US.UTF-8'
"language messages zh_CN.UTF-8
" 消息语言受当前环境变量设置影响
"language message en_US.UTF-8
" 把不明宽度字符设置为双倍字符宽度(中文字符宽度)
set ambiwidth=double
" }}}

" 3 => Display {{{
" 解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
" 禁止所有模式下光标闪烁
set guicursor=a:block-blinkon0
" 当buffer丢弃时隐藏它
set bufhidden=hide
" 字符间插入的像素行数目
set linespace=0
" 启动的时候不显示援助索马里儿童提示
" set shortmess=atI
" 设置配色方案
colorscheme murphy
" 设置背景为黑
set background=dark
" No mouseflash
set novisualbell
" 禁用自动换行
set nowrap
" 整词换行
set linebreak
" 每行显示多少字符
set textwidth=78
" 高亮显示当前行
set cursorline
" 高亮光标列
set cursorcolumn
" {{ 自动调整窗口高亮行和列
autocmd WinLeave * set nocursorline nocursorcolumn
autocmd WinEnter * set cursorline cursorcolumn
" }}
" 红色高亮第101行.
set colorcolumn=80
" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3
" 设置行号
set number
" 相对行号
set relativenumber
" 将输入的命令显示出来，便于查看当前输入的信息
set showcmd
" }}
" {{
" 高亮字符,让其不受100列限制
highlight OverLength ctermbg=darkgray ctermfg=lightblue guibg=#1C1D1E guifg=#DCDCDC
match OverLength '\%500v.*'
" }}
" {{
" 高亮显示普通txt文件(需要txt.vim脚本)" work in linux
autocmd BufRead,BufNewFile * setfiletype txt
" set syntax=txt                          " work in linux
autocmd BufRead,BufNewFile *.txt setlocal ft=txt
" }}
set hlsearch
" {{ 按编程语言的语法，对代码进行色彩标示，术语叫做语法高亮
" -- 清除语法高亮, syntax clear
" 启用语法高亮
syntax enable
" 设置语法高亮
syntax on
" set syntax=off
" }}
set number
" 窗口大小
set lines=35 columns=100
" 分割窗口在右侧
set splitright
" 分割窗口在下侧
set splitbelow
" 显示当前模式, 默认显示
set showmode
" 把gui的工具栏去掉
set guioptions-=T
" 把gui的菜单去掉
set guioptions-=m
" 把gui的右边的滑动条去掉
set guioptions-=r
" 把gui的左边的滑动条去掉
set guioptions-=L
" 把gui的下边的滑动条去掉
set guioptions-=b
" 使用内置标签页（tab）样式
set guioptions-=e
" 最大标签页（tab）个数
set tabpagemax=15
" 设置表现页标题显示内容
set guitablabel=%M\ %t
set nolist
" set listchars=tab:>-,eol:$,trail:·,extends:>,precedes:<,nbsp:.
set listchars=extends:>,precedes:<,eol:$
" set guifont=YaHei\ Consolas\ Hybrid:h11,Microsoft\ YaHei\ Mono:h11.5,Andale_Mono:h11,Menlo:h11,Consolas:h11,Courier_New:h12
set guifont=Inconsolata:h12:cANSI
" {{ 状态栏
" -- 底部状态栏显示。1为关闭，2为开启
" 0: never
" 1: only if there are at least two windows
" 2: always
" 命令行(在状态行下)的高度,默认为1,这里是2
set cmdheight=2
" 在状态行上显示光标所在位置的行号和列号
set ruler
" 总是显示状态栏,默认1无法显示
set laststatus=2
set statusline=%<%F\ %h%m%r%=\|%{&fileencoding?&fileencoding:&encoding}\|%{&fileformat}\|%y\ %-14.(%l,%c%V%)\ %P\ 0x%B
" }}
" 通过使用: commands命令,告诉我们文件的哪一行被改变过
set report=0
" }}}

" 4 => Format {{{
" 自动格式化
set formatoptions+=tcroqln
" 自动对齐,继承前一行的缩进
set autoindent
" 智能对齐
set smartindent
" 使用c样式的缩进
set cindent
set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s
" {{ smarttab on在行首输入tab时，插入的空格数以shiftidth为准
" -- smarttab off在行首输入tab时，插入的空格数以tabstop或softtabstop数为准
" 在行和段开始处使用制表符
set smarttab
" 自动缩进时，每个缩进尺度
set shiftwidth=4
" 在按退格键时，如果前面满足4个空格，则会一次性清除
set softtabstop=4
" 文本显示时，一个tab对应4个空格
set tabstop=4
" 键盘上按tab键，实际输入tabstop个空格
set expandtab
" {{ set backspace=2                     " 可以使用backspace键一次删2个
" -- 退格键可以删除行首缩进，前一行行末换行，插入模式之前已经存在的字符
set backspace=indent,eol,start
" }}
" 允许backspace, space和光标键跨越行边界,不允许h,l跨界
set whichwrap=b,s,<,>,[,]
"}}
" }}}

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
" {{ Wrapped lines goes down/up to next row, rather than next line in file.
noremap j gj
noremap k gk
" }}
nmap <leader>s :source $MYVIMRC<CR>
"nnoremap <leader>e :e $MYVIMRC<cr>
nnoremap <leader>e :vsplit! $MYVIMRC<CR>

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
" {{正常模式下 alt+j,k,h,l 调整分割窗口大小
nnoremap <M-j> :resize +5<CR>
nnoremap <M-k> :resize -5<CR>
nnoremap <M-h> :vertical resize -5<CR>
nnoremap <M-l> :vertical resize +5<CR>
" }}
" 设分割的窗口等大小
map <Leader>= <C-w>=
" {{ 插入模式移动光标 alt + 方向键
inoremap <M-j> <DOWN>
inoremap <M-k> <UP>
inoremap <M-h> <LEFT>
inoremap <M-l> <RIGHT>
" }}
" 普通模式下全选
nnoremap <C-a> <ESC>ggVG
" IDE like delete
inoremap <C-BS> <ESC>bdei
" 在单词上加上{}
map <leader>b wbi{<ESC>ea}<ESC>
" 普通模式下，空格即插入空格
nnoremap <SPACE> i<SPACE><ESC>l
" 普通模式下快速插入一个空行
nnoremap <C-o> <ESC>o<ESC>0"_d$<ESC>
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
imap <C-v> "+gP
vmap <C-c> "+y
vnoremap <BS> d
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y
imap <C-V> "+gP
map <S-Insert> "+gP
cmap <C-V> <C-R>+
cmap <S-Insert> <C-R>+
exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']
" 打开当前目录 windows
nmap <silent> <leader>ex :!start explorer %:p:h<CR>
" 打开当前目录CMD
nmap <silent> <leader>cmd :!start cmd /k cd %:p:h<CR>
" 复制当前文件/路径到 剪贴板
nmap ,fn :let @*=substitute(expand("%"), "/", "\\", "g")<CR>
nmap ,fp :let @*=substitute(expand("%:p"), "/", "\\", "g")<CR>
" }}}

" 6 => Search Match {{{
" 设置魔术匹配控制，可以通过:h magic查看更详细的帮助信息
set magic
" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间(单位是十分之一秒)
set matchtime=5
" 不对匹配的括号进行高亮显示
" let loaded_matchparen = 1
" 在搜索的时候忽略大小写
set ignorecase
" 搜索时如果输入大写字符，则忽略上面ignorecase的设置
set smartcase
" 高亮被搜索的句子(phrases)
set hlsearch
" 在搜索时,输入的词句的逐字符高亮(类似firefox的搜索)
set incsearch
" 禁止搜索到文件两端时重新搜索
" set nowrapscan
" 增强模式中的命令行自动完成操作,状态栏预览
set wildmenu
" <Tab> completion, list matches, then longest common part, then all.
set wildmode=list:longest,list:full
" 忽略一些补全文件
set wildignore=*.o,*.pyc
" 关掉智能补全时的预览窗口，这样可以防止闪屏现象
set completeopt=longest,menu
set matchpairs+=<:>
autocmd FileType c,cpp,java set matchpairs+==:;
" }}}

" 7 => Function {{{
" Remove trailing whitespace when writing a buffer, but not for diff files.
" From: Vigil
" @see http://blog.bs2.to/post/EdwardLee/17961
function! RemoveTrailingWhitespace()
    if &ft != "diff"
        let b:curcol = col(".")
        let b:curline = line(".")
        silent! %s/\s\+$//
        silent! %s/\(\s*\n\)\+\%$//
        call cursor(b:curline, b:curcol)
    endif
endfunction
autocmd BufWritePre * call RemoveTrailingWhitespace()
" }}}
