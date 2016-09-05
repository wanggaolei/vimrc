" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Modified: Wang Gaolei <wanggaolei@hotmail.com>
" Last change:	2016 Sep 5
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc
" 注释说明：
" 1，注释尽量和命令在同一行
" 2, 注释+空格+命令超过100列，使用下面格式
" "{{ notes
" command 
" }} 
" 3, 相同块区命令，复杂格式的注释命令都放在最后
" 4, 配置文件的最后是复杂命令帮助区：如折叠，diff，mark等
" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 1 =>  Behavior
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible                        " 取消兼容Vi设置，避免命令冲突
set history=1000                        " 设置vim存储的历史命令记录的条数
set confirm                             " 处理为保存或只读文件的时候弹出确定comfirm
filetype off                            " 检测文件的类型,vundle 关闭,其它on
filetype plugin on                      " 载入ftplugin文件类型插件
filetype indent on                      " 为特定文件类型载入相关缩进文件
filetype plugin indent off
set binary                              " 可读二进制文件
set backupcopy=yes                      " 设置备份时的行为为覆盖autobackup cover "set nowritebackup
set mouse=a                             " 可以在buffer的任何地方使用鼠标
set selection=exclusive                 " 光标所在位置也属于被选中的范围
set selectmode=mouse,key                " 鼠标键盘可用
setlocal noswapfile                     " 关闭临时文件,不生成swap文件,
set noerrorbells                        " 不让vim发出讨厌的滴滴声 set noeb
set nobomb                              " 不使用unicode BOM

set nobackup                            " 不进行文件备份
set undofile
set undolevels=1000                     " undo 记忆1000
let g:data_dir = $HOME . '/.vim/'
let g:undo_dir = g:data_dir . 'undofile'
if finddir(g:data_dir) == ''
    silent call mkdir(g:data_dir)
endif
if finddir(g:undo_dir) == ''
    silent call mkdir(g:undo_dir)
endif
unlet g:undo_dir
unlet g:data_dir
set undodir=$HOME/.vim/undofile

" set formatoptions=tcrqn                     " 自动格式化
set autoindent                          " 自动对齐,继承前一行的缩进
set smartindent                         " 智能对齐
set tabstop=4                           " 设置tab为4个空格
" set backspace=2                         " 可以使用backspace键一次删2个
set whichwrap+=<,>,[,]                  " 允许backspace和光标键跨越行边界
set shiftwidth=4                        " 设置行间交错为4个空格
set softtabstop=4                       " 统一缩进为4个空格
set smarttab                            " 在行和段开始处使用制表符
set autoread                            " 设置当文件被改动时自动载入
set autochdir                           " 设置打开文件后自动切换到文件所在目录
set cindent                             " 使用c样式的缩进
set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s
"{{ 用空格来代替制表符tab noexpandtab是不用空格代替制表符tab
set expandtab                               
"}}

noremap <space> i<space><esc>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  2 => Encoding Configure {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set enc=utf-8                               " vim 支持中文 内部编码
set termencoding=utf-8                      " work in linux
set fenc=utf-8                              " work in linux 解析出来的当前文件编码(可能解析错误)
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936    " 文件解析猜测识别的编码顺序
set langmenu=zh_CN.UTF-8                    " Console output coding
" language message zh_CN.UTF-8                " 控制台console编码
set ambiwidth=double                        " 把不明宽度字符设置为双倍字符宽度(中文字符宽度)
set fileencoding=utf-8                      " 当前编辑的文件编码(新文件的编码)
set fileencodings=usc-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin-1

                                            " 当前编辑的文件自动判断依次尝试编码, 打开时可以指定编码
set encoding=utf-8                          " work in linux
set imcmdline
"{{                                         " work in linux
if has("win32")
    set fileencoding=chinese
else
    set fileencoding=utf-8
endif
"}}
set fileformat=unix                         " windows 下会导致编码失败
source $VIMRUNTIME/delmenu.vim              " 解决菜单乱码
source $VIMRUNTIME/menu.vim
set nocompatible                            " 不要使用vi的键盘模式
"set clipboard+=unnamed                     " 与windows共享剪贴板share clipboard with windows
"set iskeyword+=_,$,@,%,#,-                 " 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-                  " 带有如下符号的单词不要被换行分割
nmap <f7> :set iskeyword-=_,$,@,%,#,-,<CR>
                                            " 设置以上面符号为分割, 可以set iskeyword查看当前换行的,
                                            " -是删除掉, +是添加.
nmap <s-f7> :set iskeyword+=_,$,@,%,#,-,<CR>
                                            " 设置不以上面符号为分割
"{{                                         " 保存全局变量," 寄存器中保存几行文本 0不保存500上限
set viminfo+=!
set viminfo='1000,f1,<500
"}}
"}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 3 => Text Pattern {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wrap                                " 自动换行
set linebreak                           " 整词换行
set textwidth=100                       " 每行显示多少字符
set relativenumber                      " 相对行号
set colorcolumn=101                     " 红色高亮第101行.
set scrolloff=3                         " 光标移动到buffer的顶部和底部时保持3行距离
set foldenable                          " 开始折叠
set foldcolumn=0                        " 设置折叠区域的宽度
setlocal foldlevel=1                    " 设置折叠层数为
" set foldclose=all                       " 设置为自动关闭折叠
"{{折叠
"  marker  语法定义折叠
"  manual  手工定义折叠
"  indent  更多的缩进表示更高级别的折叠,相同的缩进中代码会被折叠
"  expr    用表达式来定义折叠
"  syntax  用语法高亮来定义折叠
"  diff    对没有更改的文本进行折叠
"  marker  对文中的标志折叠,标记折叠方法
set foldmethod=marker              
"}}
"{{ 用空格键来开关折叠
" nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
"}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  4 => Display {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set bufhidden=hide                      " 当buffer丢弃时隐藏它
set linespace=0                         " 字符间插入的像素行数目
" set wildmenu                             " 增强模式中的命令行自动完成操作,状态栏预览
" set shortmess=atI                        " 启动的时候不显示援助索马里儿童提示
colorscheme desert                          " 设置配色方案
set background=dark                         " 设置背景为黑
set novisualbell                            " No mouseflash
set number                                  " 设置行号
set showcmd                                 " display incomplete commands
set cursorline                              " 高亮显示当前行
set cursorcolumn                            " 高亮光标列
syntax enable                               " 启用语法高亮
syntax on                                   " 设置语法高亮
"{{                                         " 高亮字符,让其不受100列限制
highlight OverLength ctermbg=darkgray ctermfg=lightblue guibg=#1C1D1E guifg=#DCDCDC
match OverLength '\%500v.*'
"}}
"{{                                         " 高亮显示普通txt文件(需要txt.vim脚本)
au BufRead,BufNewFile * setfiletype txt     " work in linux
set syntax=txt                              " work in linux
au BufRead,BufNewFile *.txt setlocal ft=txt
"                                           " 高亮显示普通txt文件(需要txt.vim脚本)
"                                           " 自动.c .h .sh .java自动插入文件头
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java,*.lua,*.py,*.php exec ":call SetTitle()" 
"                                           " 定义函数SetTitle,自动插入文件头 
set guioptions-=m                           " 去除vim的GUI版本中的toolbar
set guioptions-=T
map <silent> <F2> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>
"{{                                         " 状态栏
set laststatus=2                            " 总是显示状态栏,默认1无法显示
"                                           " 我的状态行显示的内容(包括文件类型和解码)
set ruler                                   " 在状态行上显示光标所在位置的行号和列号
set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%)
set cmdheight=2                             " 命令行(在状态行下)的高度,默认为1,这里是2
"set report=0                               " 通过使用: commands命令,告诉我们文件的哪一行被改变过
"}}
"{{                                         " 空格的缩进颜色
"indent color
hi 4spa guibg = #771144
hi 8spa guibg = #22464A
hi 12spa guibg = #344333
hi 16spa guibg = #777444
hi 20spa guibg = #555777
hi 24spa guibg = #cc9966
hi 80spa guibg = #ff1111

"style 2
syn match 4spa /\(\s\|\n\)\&\%4v.*\%5v/
syn match 8spa /\s\&\%8v.*\%9v/
syn match 12spa /\s\&\%12v.*\%13v/
syn match 16spa /\s\&\%16v.*\%17v/
syn match 20spa /\s\&\%20v.*\%21v/
syn match 24spa /\s\&\%24v.*\%25v/
syn match 80spa /.\&\%80v.*\%81v/
set list                                    " 缩进线
"set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$
" 制表符显示方式定义: trail为拖尾空白显示字符,extends和precedes分别是wrap关闭时,所在行在屏幕右边和左边显示的指示字符
" set listchars=tab:▸\ ,eol:¬ 
" ¬	U+00AC	not sign
" ▸	U+25B8	black right-pointing small triangle
" ☠	U+2620	skull and crossbones
" ❤	U+2764	heavy black heart
" ‽	U+203d	interobang
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<
"}}
"{{
set virtualedit=block                       " block 允许可视列块模式的虚拟编辑
                                            " insert 允许插入模式的虚拟编辑
                                            " all 允许所有模式的虚拟编辑
                                            " onemore 允许光标移动到刚刚超过行尾的位置
"}}
"}}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  5 => Search Match {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showmatch                               " 高亮显示匹配的括号
set matchtime=5                             " 匹配括号高亮的时间(单位是十分之一秒)
set ignorecase                              " 在搜索的时候忽略大小写
set hlsearch                                " 高亮被搜索的句子(phrases)
set incsearch                               " 在 搜索时,输入的词句的逐字符高亮(类似firefox的搜索)
set nowrapscan                              " 禁止搜索到文件两端时重新搜索
"}}}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Appendix => Help {{{ 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"{{折叠相关的说明
"    zf 创建折叠
"      zf\`a   折叠当前光标处到标记a的文本
"      zf3j    向下折叠3行
"      zf%     在括号光标处折叠括号内文本
"    zd 删除光标下的折叠.  
"    zD 删除光标下的折叠,以及嵌套的折叠.  
"    zE 删除窗口内的所有折叠.仅当 manual 和 marker 折叠方法下有效.  
"    zF 在当前行创建折叠.当一开始就计划要折叠所写代码的时候,可以用该命令创建一对折叠符号,然后再往里面填写内容
"    zR 打开所有的折叠
"    za Open/Close (toggle) a folded group of lines.
"    zA Open a Closed fold or close and open fold recursively.
"    zi 全部 展开/关闭 折叠
"    zo 打开 (open) 在光标下的折叠,
"    zO 打开光标下的折叠,以及嵌套的折叠.
"    zc 关闭 (close) 在光标下的折叠
"    zC 循环关闭 (Close) 在光标下的所有折叠
"    zM 关闭所有可折叠区域
"    zj 移动到下一个折叠的开始
"    zk 移动到上一个折叠的结束
"    zv 打开当前光标所在折叠,仅打开足够的折叠使光标所在的行不被折叠
"    [z 到当前打开折叠的开始.如果已在开始处,移到包含这个折叠的折叠开始处.  
"    ]z 到当前打开折叠的结束.如果已在结束处,移到包含这个折叠的折叠结束处.  
"    在开始的花括号前添加介绍,花括号后添加级别号,级别号不能为0.如: /*折叠介绍###1*/ code... /*###*/ (用###代替了折叠符号) 
"}}

"{{mark相关的说明
"    `跳转到标记位置，'跳转到标记所在行首,说明中使用`的地方都可以用'
"    :marks 取得所有标记 
"    :jumps可在多文件跳转 
"    :delmarks 删除指定标记 
"    :delmarks!删除所有
"    ma 用a标记当前光标位置,可以用a~zA~Z
"    `a 跳转到标记('a 转到标记所在行首) 
"    `' 跳转前的位置 Ctrl+O (older)跳转到较老的地方
"    `. 最近编辑的位置
"    `0-9 最近使用的文件
"    `∧ 最近插入的位置
"    `" 最后编辑的位置Ctrl+I 跳转到较新的地方,上一次退出文件时的位置
"    `[ 最后修改的位置的开头
"    `] 最后修改的位置的结尾
"}}
"}}}

"{{                                         " all shortcuts
" :s/^/#                                    " 用'#'注释当前行
" :2,50s/^ /#                               " 在2~50行首添加'#'注释
" :2,50s/$/#                                " 在2~50末加'#'
" :.,+3s/^/#                                " 用'#'注释当前行和当前行后面的三行
" :%s/^/#                                   " 用'#'注释所有行
" :n1,n2s/^/#/g                             " 用'#'注释n1~n2行,下面为删除
" :n1,n2s/#/^/g                             " :n1,n2s/^/#/g   :n1,n2s/#^//g
" :n1,n2s/\\$//g                            " 删除行末 \ 
" :n1,n2s/^/\/\//g                          " 用//注释n1~n2
" :n1,n2s/\/\///g                           " 删除//的注释
" :g/keywords/d                             " 删除所有含有keywords的行
" :v/error\|warn\|fail/d                    " 删除不含有error,warn,fail的行, v=g!, :%g!/error\|warn\|fail/d
" :n1,n2s/^I/','/g                          " 把tab替换成','
" :%s/^\s\+//g                              " 删除行首空格
" :%s/\s\+$//g                              " 删除行末空格 要转义斜杠等, 用\,而+ |转义用\\
" :g/^$/d                                   " 删除没有内容的空行
" :g/^\s*$/d                                " 删除有空格组成的空格
" :%s///g                                 " 删除行末^M的符号
" :%s/^\n\+/\r/                             " 压缩多行空行为一行 2013-11-26 15:42:58
" :%s/keywords//n                           " 统计关键字出现的次数
" :                                         " 把正则用\( \) 扩起来后, 后面替换的时候可以用\1 \2来引用对应的正则
" : 将 Doe, John 修改为 John Doe   :%s/\(\w\+\), \(\w\+\)/\2 \1/
" :s/替换字符串/\=函数式                    " 函数式可以有多个,返回值可以用字符串连接符.连接起来,如line('.') 返回匹配行号(:help line()  ),submatch(n)可以引用\1,\2的内容,其中submatch(0)引用匹配的整个内容;
"                                           " 函数式也可以是字符串常量,用双引号引起来.函数式也可以是任意表达式,需要用小括号引起来,如(3+2*6);
"                                           " 函数式还可以是寄存器中的内容,通过'@寄存器名'访问,如@a(不需要加引号,但是还是需要用.来连接)
":%s/\(.*\) \(.*\)/\1+\2/                   " 把行尾的空格替换成+号
" :noh                                      " 取消搜索高亮
" :%!nl -ba                                 " 对包含空行的所有行进行编号.
" gf                                        " 在鼠标下打开当前路径的文件
" <c-w>f                                    " open in a new window
" <c-w>gf                                   " open in a new tab
" :n1,n2 co n3                              " copy n1~n2 to under the n3
" :n1,n2 m n3                               " move n1~n2 to under the n3
" :n1,n2 w filename                         " save n1~n2 to filename
" n+   n-                                   " 光标移动多少行
" n$                                        " 光标移至第n行尾
" 0 $                                       " 光标移至当前行首 当前行尾
" H M L                                     " 光标移至 屏幕顶行 中间行 屏幕最后行
" ctrl+u ctrl+d                             " 向文件首(尾) 翻半屏
" ctrl+f ctrl+b                             " 向文件首(尾) 翻一屏
" nz                                        " 将第n行滚至屏幕顶部,不指定n时将当前行滚至屏幕顶
" :g/^/exe ":s/^/".line(".")                " 每行插入行号
" :g/<input|<form/p                         " 显示含<input或<form的行
" :bufdo /searchstr                         " 在多个buff中搜索
" :argdo /searchstr
" xp   ddp                                  " 交换前后两个字符的位置 上下两行的位置交换
" `,<C-O> <C-I>                             " 跳转足迹 回跳(从最近的一次开始) 向前跳
" :gg=G                                     " 格式化, ggVG =
"reg                                        " /d      digit                   [0-9]
"reg                                        " /D      non-digit               [^0-9]
"reg                                        " /x      hex digit               [0-9a-fA-F]
"reg                                        " /X      non-hex digit           [^0-9a-fA-F]
"reg                                        " /s      white space             [       ]     (<Tab> and <Space>)
"reg                                        " /S      non-white characters    [^      ]     (not <Tab> and <Space>)
"reg                                        " /l      lowercase alpha         [a-z]
"reg                                        " /L      non-lowercase alpha     [^a-z]
"reg                                        " /u      uppercase alpha         [A-Z]
"reg                                        " /U      non-uppercase alpha     [^A-Z]
" m a   (MARK)                              " 把这个地方标示成a    a can replace from (a~z)
" 'a    (quote character)                   " jump to aaa
" ''    (press ' twice)                     " 移动光标到上一个标记
" {                                         " jump to  跳到上一段的开头
" }                                         " jump to  跳到下一段的的开头.
" (                                         " 移到这个句子的开头
" )                                         " 移到下一个句子的开头
" [[                                        " 跳往上一个函式, [{ Jump to block start.
" ]]                                        " 跳往下一个函式
" `.                                        " 移动光标到上一次的修改点
" '.                                        " 移动光标到上一次的修改行
" <shift-c>                                 " 删除到行末并直接进入插入模式
" %                                         " 跳到匹配的左/右括号上
" zz                                        " 移动当前行到屏幕中央
" zt                                        " 移动当前行到屏幕顶部
" zb                                        " 移动当前行到屏幕底部
" <shift- ↓/↑>                            " 整屏翻,光标位置在屏幕位置不变
" *                                         " 读取光标处的字符串,并且移动光标到它再次出现的地方, n下一个匹配,N反方向
" #                                         " 和上面的类似,但是是往反方向寻找
" g*(g#)                                    " 此命令与上条命令相似, 只不过它不完全匹配光标所在处的单词, 而是匹配包含该单词的所有字符串
" guu                                       " 行小写
" gUU                                       " 行大写
" g~~                                       " 行翻转(大小写)
" guw gUw g~w                               " 字*写
" ]p                                        " 类似p, 但是会自动调整被粘贴的文本适应缩进
" gd                                        " 到达光标所在处函数或者变量的定义处
" \'.                                       " 跳到最后修改的那一行
" `.                                        " 跳到最后修改的那一行,定位到修改点
" :ju(mps)                                  " 列出跳转足迹
" !!date                                    " 读取date的输出 (但是会替换当前行的内容) :r!date 输出系统时间. :r!date \+\%F\ \%T 格式化输出
" :bn                                       " 跳转到下一个buffer
" :bp                                       " 跳转到上一个buffer
" :wn                                       " 存盘当前文件并跳转到下一个
" :wp                                       " 存盘当前文件并跳转到上一个
" :bd                                       " 把这个文件从buffer列表中做掉
" :b 3                                      " 跳到第3个buffer
" :b main                                   " 跳到一个名字中包含main的buffer,例如main.c
" :sav php.html                             " 把当前文件存为php.html并打开php.html
" :sav! %<.bak                              " 换一个后缀保存
" :e!                                       " 返回到修改之前的文件(修改之后没有存盘)
" :w !sudo tee > /dev/null %                " save as root
" :w /path/%                                " 把文件存到一个地儿
" :rew                                      " 回到第一个可编辑的文件
" :brew                                     " 回到第一个buffer
" :ls                                       " 显示所有buffer :help :buffers
" buffer其他                                " :bdelete filename 删除指定buffer;  有:b 和:sb 组合first,rewind,next,prvious,Next,last 例如:bfirst,:sbfirst
"                                           "     还可以组合all, unhide, modified, bdelete
"                                           " :bwipeout 清除所有buffer
" gvim -o file1 file2                       " 以分割窗口打开两个文件\r\n# 指出打开之后执行的命令
" gvim -d file1 file2                       " vimdiff (比较不同)
"                                           "    ]c 跳转下一个差异点 :diffget 把另外一个文件的差异点的内容复制过来  :diffput 把当前差异点的内容复制过去. :diffupdate 更多比较文件
"                                           "    前面加行号表示多少行开始  :2,30diffget 把2~30行的差异取过来
" c{ motion }                               " 删除motion命令跨过的,并且进入插入 c$删到行尾的并进入插入,ct! 删除从光标位到下一个!位置
" dp                                        " 把光标处的不同放到另一个文件
" do                                        " 在光标处从另一个文件取得不同
" diw                                       " 删除光标上的单词 (不包括空白字符)
" daw                                       " 删除光标上的单词 (包括空白字符)
" dl                                        " delete character (alias: x)
" diw                                       " delete inner word
" daw                                       " delete a word
" diW                                       " delete inner WORD (see |WORD|)
" daW                                       " delete a WORD (see |WORD|会删除掉单词和其后的空格)
" dd                                        " delete one line
" dis                                       " delete inner sentence
" das                                       " delete a sentence
" dib                                       " delete inner '(' ')'
" dab                                       " delete a '(' ')'
" dip                                       " delete inner paragraph
" dap                                       " delete a paragraph  p是段落
" diB                                       " delete inner '{' '}'
" daB                                       " delete a '{' '}'
" d ↓                                      " delete 完整的一个语句
" di[ di( di大括号 di< di' di" di`          " 删除一对()[]大括号 '' "" ``的内容
" ci[ ci( ci大括号 ci< ci' ci" ci`          " 删除并插入一对()[]大括号 '' "" ``的内容
" vi[ vi( vi大括号 vi< vi' vi" vi`          " 编辑一对()[]大括号 '' "" ``的内容
" :1,20s/^/#/g                              " 添加注释  :1,20s/^/\/\//g
" 0                                         " 至本行第一个字符=<Home>
" ^                                         " 至本行第一个非空白字符
" N $                                       " 至本行最后一个字符
" gm                                        " 至屏幕行中点(当前行中点)
" N |                                       " 至第 N 列 (缺省: 1)
" N  f{char}                                " 至右边第 N 次出现 {char} 之处 (find)
" N  F{char}                                " 至左边第 N 次出现 {char} 之处 (Find)
" N  t{char}                                " 至右边第 N 次出现 {char} 之前 (till)
" N  T{char}                                " 至左边第 N 次出现 {char} 之前 (Till)
" N  ;                                      " 重复上次 f,F,t 或 T 命令 N 次
" N  ,                                      " 以相反方向重复上次 f,F,T 或 t 命令 N
" N  -                                      " 上移 N 行,至第一个非空白字符
" N  +                                      " 下移 N 行,至第一个非空白字符 (亦: CTRL-M 和 <CR>)
" N  _                                      " 下移 N - 1 行,至第一个非空白字符
" N  G                                      " 至第 N 行 (缺省: 末行) 第一个非空白字符
" N  gg                                     " 至第 N 行 (缺省: 首行) 第一个非空白字符
" N  %                                      " 至全文件行数百分之 N 处;必须给出 N,否则是 |%| 命令
" N  gk                                     " 上移 N 屏幕行 (回绕行时不同于 k)
" N  gj                                     " 下移 N 屏幕行 (回绕行时不同于 j)
" N  w                                      " 向前 (正向,下同) N 个单词(word)
" N  W                                      " 向前 N 个空白隔开的字串 |WORD|            (WORD)
" N  e                                      " 向后至第 N 个单词词尾/ ge是前跳词尾                     (end)
" N  E                                      " 向前至第 N 个空白隔开的字串 |WORD| 的词尾 (End)
" N  b                                      " 向后 (反向,下同) N 个单词                (backward)
" N  B                                      " 向后至第 N 个空白隔开的字串 |WORD| 的词尾 (Backward)
" N  ge                                     " 向后至第 N 个单词词尾
" N  gE                                     " 向后至第 N 个空白隔开的字串 |WORD| 的词尾
" N  )                                      " 向前 N 个句子
" N  (                                      " 向后 N 个句子
" N  }                                      " 向前 N 个段落
" N  {                                      " 向后 N 个段落
" N  ]]                                     " 向前 N 个小节,置于小节的开始
" N  [[                                     " 向后 N 个小节,置于小节的开始
" N  ][                                     " 向前 N 个小节,置于小节的末尾
" N  []                                     " 向后 N 个小节,置于小节的末尾
" N  [(                                     " 向后至第 N 个未闭合的 '('
" N  [{                                     " 向后至第 N 个未闭合的 '{'
" N  [m                                     " 向后至第 N 个方法 (method) 的开始 (用于 Java)
" N  [M                                     " 向后至第 N 个方法的结束 (Method)  (用于 Java)
" N  ])                                     " 向前至第 N 个未闭合的 ')'
" N  ]}                                     " 向前至第 N 个未闭合的 '}'
" N  ]m                                     " 向前至第 N 个方法 (method) 的开始 (用于 Java)
" N  ]M                                     " 向前至第 N 个方法的结束 (Method)  (用于 Java)
" N  [#                                     " 向后至第 N 个未闭合的 #if 或 #else
" N  ]#                                     " 向前至第 N 个未闭合的 #else 或 #endif
" N  [*                                     " 向后至第 N 个注释的开始 /*
" N  ]*                                     " 向前至第 N 个注释的结束 */
" a
" N  ]*                                     " 向前至第 N 个注释的结束 */
" .                                         " 匹配任意单个字符
" ^                                         " 匹配行首
" $                                         " 匹配<EOL>
" \<                                        " 匹配单词开始 /\<aaa/ 只匹配aaa开头的,
" \>                                        " 匹配单词结束 /\<aaa\>/ 只匹配aaa开头,结尾的.
" [a-z]  \[a-z]                             " 匹配单个设定范围的字符
" [^a-z] \[^a-z]                            " 同上..不匹配
" \s                                        " 匹配一个空白字符
" \S                                        " 匹配一个非空字符
" \e                                        " 匹配<Esc>
" \t                                        " 匹配<Tab>
" \r                                        " 匹配<CR>
" \b                                        " 匹配<BS> backspace
" * \*                                      " 匹配0或者多个前面的匹配原
" \+                                        " 匹配1或者多个前面的匹配原
" \=                                        " 匹配0或者1个前面的匹配原
" \{2,5}                                    " 匹配2至5个前面的匹配原
" \|                                        " 隔开两种可替换的匹配
" \(\)                                      " 组合模式为当匹配原
" ;{search-command}                         " 接着执行 {search-command} 查找命令
" m{a-zA-Z}                                 " 用标记 {a-zA-Z} 记录当前位置
" `{a-z}                                    " 至当前文件中的标记 {a-z}
" `{A-Z}                                    " 至任何文件中的标记 {A-Z}
" `{0-9}                                    " 至 Vim 上次退出的位置
" ``                                        " 至上次跳转之前的位置
" `"                                        " 至上次编辑此文件的位置
" `[                                        " 至上次被操作或放置的文本的开始
" `]                                        " 至上次被操作或放置的文本的结尾
" `<                                        " 至 (前次) 可视区域的开始
" `>                                        " 至 (前次) 可视区域的结尾
" `.                                        " 至当前文件最后被改动的位置
" '{a-zA-Z0-9[]'"<>.}                       " 同 `,但同时移动至该行的第一个非空白字符
" :marks                                    " 列出活动的标记
" N  ctrl+O                                 " 跳转到跳转表中第 N 个较早的位置
" N  ctrl+I                                 " 跳转到跳转表中第 N 个较晚的位置
" :ju[mps]                                  " 列出跳转表
" R                                         " 覆盖插入.批量.
" r                                         " 单次覆盖插入,gr
" i ctrl+E                                  " 插入光标下方的字符
" i ctrl+Y                                  " 插入光标上方的字符
" i ctrl+A                                  " 插入上次插入的文本
" i ctrl+@                                  " 插入上次插入的文本并结束插入模式
" i ctrl+R {0-9a-z%#:.-="}                  " 插入寄存器的内容
" i ctrl+N                                  " 将下一个匹配的标识符插入光标前
" i ctrl+P                                  " 将上一个匹配的标识符插入光标前
" i ctrl+H                                  " 删除光标前的一个字符 = <BS>
" i <Del>                                   " 删除光标下的一个字符
" i ctrl+W                                  " 删除光标前的一个单词
" i ctrl+U                                  " 删除当前行的所有字符
" i ctrl+T                                  " 在当前行首插入一个移位宽度的缩进
" i ctrl+D                                  " 在当前行首删除一个移位宽度的缩进
" i 0 ctrl+D                                " 删除当前行的所有缩进
" i ^ ctrl+D                                " 删除当前行的所有缩进,恢复下一行的缩进
" :dig                                      " 显示当前二合字母列表
" i ctrl+k {char1} {char2}                  " 键入二合字母
" N D                                       " 删除至行尾
" N J                                       " 连接N-1行
" N gJ                                      " 同J,但不插入空格
" N ~                                       " 翻转N个字符的大小写并前进光标
" N ctrk+A                                  " 将光标之上或之后的数值增加 N
" N ctrl+X                                  " 将光标之上或之后的数值减少 N
" v o                                       " 交换高亮区域(可视)的开始处的光标位置
" N  aw                                     " 选择 一个单词
" N  iw                                     " 选择 内含单词
" N  aW                                     " 选择 一个字串
" N  iW                                     " 选择 内含字串
" :ciw                                      " 修改一个单词
" N  as                                     " 选择 一个句子
" N  is                                     " 选择 内含句子
" N  ap                                     " 选择 一个段落
" N  ip                                     " 选择 内含段落
" N  ab                                     " 选择 一个块 (从 [( 至 ]))
" N  ib                                     " 选择 内含块 (从 [( 到 ]))
" N  aB                                     " 选择 一个大块 (从 [{ 到 ]})
" N  iB                                     " 选择 内含大块 (从 [{ 到 ]})
" N  a>                                     " 选择 一个 <> 块
" N  i>                                     " 选择 内含 <> 块
" N  at                                     " 选择 一个标签块 (从 <aaa> 到 </aaa>)
" N  it                                     " 选择 内含标签块 (从 <aaa> 到 </aaa>)
" N  a'                                     " 选择 一个单引号字符串
" N  i'                                     " 选择 内含单引号字符串
" N  a"                                     " 选择 一个双引号字符串
" N  i"                                     " 选择 内含双引号字符串
" N  a`                                     " 选择 一个反引号字符串
" N  i`                                     " 选择 内含反引号字符串
" N .                                       " 重复最近一次改动
" q{a-z}                                    " 记录键入的字符,存入寄存器{a-z}
" q{A-Z}                                    " 记录键入的字符,添加进寄存器{a-z}
" q                                         " 终止记录
" N @{a-z}                                  " 执行寄存器{a-z}的内容N次
" N @@                                      " 重复上次的@{a-z}的操作N次
" N gs                                      " 睡N秒
" sl[eep][sec]                              " 在[sec]秒任何事都不做
" :%!xxd                                    " 转换成十六进制
" :%!xxd -r                                 " 转回来
" ga                                        " 以十进制,十六进制,八进制显示当前光标下的字符的ASCII值
" g8                                        " 对 utf-8 编码: 显示光标所在字符的十六进制字节序列
" g CTRL-G                                  " 显示当前光标的列,行,以及字符位置
" g;                                        " 在修改记录中向后选择
" g,                                        " 在修改记录中向前选择
" :ve[rsion]                                " 显示版本信息
" :vimgrep /test/ *                         " 查找当前目录下所有包含test关键字  ** 代表的是递归查找大于100层目录
" :vimgrep /test/ **                        " 递归查找当前目录下所有包含test关键字
" :vimgrep /\<test\>/ **                    " 递归查找当前目录下所有包含只有test关键字,不包括testabc,abctest,abctestabc等等,如果一行有多个test的话,只搜索一个test结果
" :vimgrep /\<test\>/g **                   " 递归查找当前目录下所有包含只有test关键字,不包括testabc,abctest,abctestabc等等,如果一行有多个test的话,搜索多个test结果
" :vimgrep /\<test\>/ *.html                " 查找当前目录下所有的html文件包含只有test关键字,不包括testabc,abctest,abctestabc等等,如果一行有多个test的话,搜索多个test结果
"                                           "  :cnext (:cn) 当前页下一个结果
"                                           "  :cprevious (:cp) 当前页上一个结果
"                                           "  :clist (:cl) 打开quickfix窗口,列出所有结果,不能直接用鼠标点击打开,只能看
"                                           "  :copen (:cope) 打开quickfix窗口,列出所有结果,可以直接用鼠标点击打开
"                                           "  :ccl[ose] 关闭 quickfix 窗口
"                                           "   ctrl + ww 切换编辑窗口和quickfix窗口,在quickfix里面和编辑窗口一样jk表示上下移动,回车选中进入编辑窗口
" vim启动参数
"     -v                                    " vi模式
"     -d                                    " diff模式
"     -b                                    " 二进制模式
"     -l                                    " lisp模式
"     -A                                    " 阿拉伯模式
"     -F                                    " 波斯模式
"     -H                                    " 希伯来模式
"     --noplugin                            " 不加载,无插件模式
"     --startuptime {fname}                 " 启动时把计时信息写入文件 {fname}.可用于分析载入 .vimrc,插件和打开首个文件的过程中时哪一步最耗时
"     -V9debugVimLog                        " 启动时加入debug信息, 可以跟踪vim crash, 
"     :messages                             "  show all crash log, 
"     :echo                                 "  errmsg print recent msg 
" /\Cxxx                                    " 大小写敏感 /\cxxx 搜索xxx不敏感
" vsp                                       " 垂直分割窗口
" sp                                        " 竖向分割窗口
" ctrl w +                                  " 扩大分割窗口
" ctrl w -                                  " 缩小分割窗口
" res no                                    " 让分割的窗口只显示多少行
" ctrl-v I ESC                              " 列插入,选列,I,输入要插入的内容,ESC
" :%norm jkdd                               " 删除基数行 或用global命令 :g/^/d|m
" :%norm jdd                                " 删除偶数行 或:g/^/+1 d
" :%s/0/=eval(line(".")-1)/g                " 生成连续的数字
" :e ++enc=utf-8 filename.txt               " 以指定编码打开文本.
" 其他                                      " :r!pwd 插入当前文本路径 :Ex 开启目录浏览 :ls 显示当前buffer :ju 列出跳转足迹 :his c 命令行历史 :his s 搜索历史 q/ 搜索历史窗口 q:命令历史窗口 :<C-F>历史命令窗口
" ,m                                        " mark
"                                           "  :%!sort -u 使用sort程序排序整个文件  qq录制到q,输入指令,q再次按q停止录制,@q执行q存储的指令,@@重复执行.
"                                           " 修改register  \"ap 把register a的内容粘贴到当前位置,然后修改它, \"add 删除并且重新存入register a, @a 执行寄存器a的指令.
"                                           " \"a5yy 复制5行到register a中, \"A5yy 再添加5行到a中.
"                                           " [I 显示光标处的关键字匹配的行 :g/^/pu 把文中空行扩1倍 :g/^/m0 按行翻转文章 :g/关键字/t$ 拷贝行,从关键字到文件末尾
"                                           " :let @a=@_ 清除寄存器a :let @*=@a 寄存器赋值 :scriptnames 列出所有加载的插件,_vimrcs :verbose set history 显示设置history值并指出设置文件的位置
"                                           " :verbose map<Tab> 可以查看tab键是绑定到什么动作上的, 
"                                           "  Command     Normal      Visual  Operator    Insert      Command_Line
"                                           "  映射命令    常规模式    可视化  运算符模式  插入模式    命令行
"                                           "  :map        y           y       y
"                                           "  :nmap       y
"                                           "  :vmap                   y
"                                           "  :omap                           y
"                                           "  :map!                                       y           y
"                                           "  :imap                                       y
"                                           "  :cmap                                                   y
"                                           "  查看键盘符号:h key-notation
"                                           "  <Esc>=Escape, <CR>=Enter, <S-F1>=Shift+F1,<C>=<Ctrl> Mac:<D>=Command, <M-key>=<A-key>=Alt
"                                           "  :map 查看所有, 第一列内容显示如下, 取消:umap, 取消所有:mapclear
"                                           "      <space> 常规模式,可视化模式,运算符模式
"                                           "      n       常规模式
"                                           "      v       可视化模式
"                                           "      o       运算符模式
"                                           "      !       插入模式,命令行模式
"                                           "      i       插入模式
"                                           "      c       命令模式
"                                           " i<c-r>/ 把最后一个搜索指令贴到当前位置 i<c-r>把最后一个命令贴到当前位置 :X 加密文件
" advanced tips                             " vit 选中a标签里面的文本,高亮选中标签内部的内容.visually select inside the tag
"                                           " A 当前行尾插入,=$a  ;   C是删除当前行尾并插入,=$c    .是重复上一次插入的所有操作
"                                           " s 删除当前字符串并进入插入,=cl; S删除该行有内容的内容,=^c; I=^i;o=A<CR> O=ko
"                                           " 在符号前后加空格 f+ 搜索+号,s<space>+<spance><Esc>这里完成一次添加, ;查找下一次f查找的符号, .重复, ;.重复   ,反查f的符号
"                                           " 修改时, 重复. 回退u ;  行内查找f/t/F/T 重复;回退, ; /?<CR>文档查找 重复n 回退N;  :s/pattern/replacement 执行替换 重复& 回退u ; 执行一系列修改qx{}q
"                                           " <C-a><C-x>对数字执行加和减操作.比如光标在5上,执行10<C-a> 会变成15.如果改行光标不在数字上,直接输入数字<C-a/x>会自动跳在第一个数字上进行对应加减操作.
"                                           "    上面的加减以0开头的数字会默认以八进制来计算,如果需要以十进制,需要set nrformats=    如果要查找设置的参数值,用set xxx?来获取设置值 set xxx&为设置为默认值
"                                           "  插入模式下 <C-h>删除前一个字符(等于退格键);<C-w>删除前一个单词;<C-u>删至行首; 该命令也可在bash中使用.
"                                           "  Esc退出等于<C-[>  ; <C-o> 切换到插入-普通模式.
"                                           "    所以在插入的时候可以执行普通模式的命令并且返回插入模式.比如插入后<C-o>zz可以执行后回到插入模式.让屏幕居中.
"                                           " gv 重选上次的高亮选区, 包括v,V,<C-v> ; <C-g>可以在可视模式和选择模式切换.要退出高亮选择,用Esc 或者<C-[>; o是在高亮选择后来切换高亮选区的活动端(前后位置)
"                                           " gU 是U的等效命令,it是文本对象,gUit就是操作文本对象大写.
"                                           " gv 重选后,r| 用管道符替换选区内的字符; Vr-用连字符替换该行的所有字
"                                           " $ 移到模块选择的行尾,A在行尾添加内容,并且进入插入模式,输入内容,Esc保证修改的内容会扩散到其余选中的行上. (I 是行首.i是字符前,a是字符后.)
"                                           " <C-r> 在插入的时候按<C-r>= 后面跟需要运算的内容<CR>会执行这个计算.<C-r>=10%2<CR>
"                                           " 插入非常用字符.插入模式下<C-v>{code} 例:<C-v>065 插入十进制,可以指定字符集<C-v>u{1234}插入十六进制,  ga显示光标处的字符的编码.(十进制,十六进制)
"                                           "        :h i_CTRL-V-digit ,<C-v>跟非数字会插入按键本身的字符, <C-v><TAB>会插入真正的制表符而忽略expandtab是否开启.
"                                           "        <C-k>{char1}{char2}插入二合字母表示的字符. :h digraph-table
"                                           " :h vi-differences 查看vi 和vim差异.
"                                           " ex命令 
"                                           " :[range]delete [x]          删除指定范围内的行.[到寄存器x中]
"                                           " :[range]yank [x]            复制指定范围内的行.[到寄存器x中]
"                                           " :[range]put [x]             在指定行后粘贴寄存器x中的内容
"                                           " :[range]copy {address}      把指定范围内的行copy到地址所指定的行之下
"                                           " :[range]move {address}      把指定范围内的行move到地址所指定的行之下
"                                           " :[range]join               连接指定范围的行.
"                                           " :[range]normal {commands}   对指定范围中的每一行执行普通模式命令{commands}
"                                           " :[range]substitute/{pattern}/{string}/[flags]  把指定范围内出现{pattern}的地方替换为{string} 
"                                           " :[range]global/{pattern}/[cmd]     对指定范围内匹配{pattern}的所有行,在其上执行ex命令{cmd}
"                                           " :$: 等于gg 跳到文件末尾    .代表当前行的地址  %代表当前文件的所有行.
"                                           " :.,$p 打印当前行到文件末尾行的所有.
"                                           " 2G VG 会选中一个选区,按: 进入ex模式,命令行上会预先填充:'<,>'  其中'<代表高亮选取的首行位置标记 '>最后一行. 这个标记会在退出可视模式后一直存在.
"                                           " :/<html>/,/<\/html>/p  ex接受模式地址.还可以接受偏移量{address}    :/<html>/+1,/<\/html>/-1p
"                                           " ex 的地址  1文件第一行 $文件最后一行   0虚拟行,位于文件第一行上方  .光标所在行 'm包含位置标记m的行 '<高亮选区的起始行 >'高亮选区的结束行 %整个文件(:1,$的简写形式)
"}}
