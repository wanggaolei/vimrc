"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
" => 通用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 取消兼容Vi设置，避免命令冲突
set nocompatible

" Sets how many lines of history VIM has to remember
" 设置vim存储的历史命令记录的条数
set history=700

" 取消编辑文件备份
set nobackup

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

set autochdir

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Visual Setting
" => 显示相关
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 按编程语言的语法，对代码进行色彩标示，术语叫做语法高亮
" syntax enable
" 清除语法高亮, syntax clear
" set syntax=off
syntax on


" 设置为>-格式,用$结尾
set listchars=tab:>-,eol:$

colorscheme desert

" 显示行数标示
set number

" 打开状态栏的坐标信息
set ruler

" 设置gui界面
" 把gui的工具栏去掉
set guioptions-=T
" 把gui的菜单去掉
set guioptions-=m
" 把gui的右边的滑动条去掉
set guioptions-=r
" 把gui的左边的滑动条去掉
set guioptions-=L

" 取消底部状态栏显示。1为关闭，2为开启
" 0: never
" 1: only if there are at least two windows
" 2: always
set laststatus=2
set statusline=%.45F\ %m\%=\|%{&fileencoding?&fileencoding:&encoding}\|%{&fileformat}\|%{&filetype}\ %4l,%c

" 将输入的命令显示出来，便于查看当前输入的信息
set showcmd

" 设置魔术匹配控制，可以通过:h magic查看更详细的帮助信息
set magic

" 高亮显示坐标所在行
set cursorline

" 插入右括号时会短暂地跳转到匹配的左括号
set showmatch

" 不对匹配的括号进行高亮显示
let loaded_matchparen = 1

" 高亮显示搜索匹配到的字符串
set hlsearch
" 在搜索模式下，逐字匹配
set incsearch
" 搜索时忽略大小写
set ignorecase
" 搜索时如果输入大写字符，则忽略上面ignorecase的设置
set smartcase

" 文本显示时，一个tab对应4个空格
set tabstop=4
" Number of spaces to use for each step of (auto)indent.  Used for
" 'cindent', >>, <<, etc.
" 自动缩进时，每个缩进尺度
set shiftwidth=4
" smarttab on在行首输入tab时，插入的空格数以shiftwidth为准
" smarttab off在行首输入tab时，插入的空格数以tabstop或softtabstop数为准
set smarttab
" 在按退格键时，如果前面满足4个空格，则会一次性清除
set softtabstop=4
" 键盘上按tab键，实际输入tabstop个空格
set expandtab

" 在执行宏命令时，不进行实时重绘；
" 在宏命令执行完成后，一次性重绘，以便提高性能。
set lazyredraw

" 退格键可以删除行首缩进，前一行行末换行，插入模式之前已经存在的字符
set backspace=indent,eol,start

" 设置允许backspace，space，方向键跨行
set whichwrap=b,s,<,>,[,]

set encoding=utf-8
"source $VIMRUNTIME/delmenu.vim
let $LANG='en'
set langmenu=en
"source $VIMRUNTIME/menu.vim
" 消息语言受当前环境变量设置影响
"language message en_US.UTF-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set ambiwidth=double 

"关掉智能补全时的预览窗口，这样可以防止闪屏现象
set completeopt=longest,menu

"设置窗口大小和位置
" set lines=100
set columns=100
" winpos 0 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Shortcuts
" => 快捷键设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

map <leader>b wbi{<Esc>ea}<Esc>
" Fast saving
nmap <leader>w :w!<cr>

" 用来打开list功能，显示不可见字符
nmap <leader>l :set list!<CR>
" 使用pathogen自动安装插件，该插件需要autoload目录下的pathogen.vim提供，暂时屏蔽
" execute pathogen#infect()
" 自动加载NERDTree
" autocmd vimenter * NERDTree

"  使用Trinity模拟 Source Insight
" Open and close all the three plugins on the same time 
nmap <F8>  :TrinityToggleAll<CR> 
" Open and close the Source Explorer separately 
nmap <F9>  :TrinityToggleSourceExplorer<CR> 
" Open and close the Taglist separately 
nmap <F10> :TrinityToggleTagList<CR> 
" Open and close the NERD Tree separately 
nmap <F11> :TrinityToggleNERDTree<CR> 

let Tlist_Show_Menu = 1
" 这项必须设定，否则出错,配置taglist的ctags路径
"let Tlist_Ctags_Cmd = 'D:/Vim/vim71/ctags.exe'
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
" 使用F8打开Taglist
" nnoremap <silent> <F8>:TlistToggle<CR>
" 按下F5重新生成tag文件，并更新taglist
map <leader>cg :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>
" imap <F5> <ESC>:!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR> :TlistUpdate<CR>

" 设置tags文件路径，设置为可以向上级目录查找tags文件，直到找到为止
set tags=./tags;tags
" set tags=tags;
" set tags+=F:/code/tags

let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr> 

let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplMapWindowsNavVim=1
let g:miniBufExplMapWindowNavArrows=1 

nnoremap <silent> <F12> :A<CR>

nnoremap <silent> <F3> :Grep<CR> 

" 设置SuperTab，用tab键打开cppcomplet的自动补全功能。
let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType="<C-X><C-O>"

"====================Lookupfile 相关设置========================================
let g:LookupFile_MinPatLength = 2               "最少输入2个字符才开始查找
let g:LookupFile_PreserveLastPattern = 0        "不保存上次查找的字符串
let g:LookupFile_PreservePatternHistory = 1     "保存查找历史
let g:LookupFile_AlwaysAcceptFirst = 1          "回车打开第一个匹配项目
let g:LookupFile_AllowNewFiles = 0              "不允许创建不存在的文件
if filereadable("./filenametags")                "设置tag文件的名字
    let g:LookupFile_TagExpr = '"./filenametags"'
endif
"nmap <silent> <leader>lk <Plug>LookupFile<cr>   "映射LookupFile为,lk
"nmap <silent> <leader>ll :LUBufs<cr>            "映射LUBufs为,ll
"nmap <silent> <leader>lw :LUWalk<cr>            "映射LUWalk为,lw

"有了上面的定义，当我输入”,lk”时，就会在tag文件中查找指定的文件名；
"当输入”,ll”时，就会在当前已打开的buffer中查找指定名字的buffer；
"当输入”,lw”时，就会在指定目录结构中查找。

"在用lookupfile插件查找文件时，是区分文件名的大小写的，
"如果想进行忽略大小写的匹配，把下面这段代码加入你的vimrc中，
"就可以每次在查找文件时都忽略大小写查找了：

" lookup file with ignore case
function! LookupFile_IgnoreCaseFunc(pattern)
    let _tags = &tags
    try
        let &tags = eval(g:LookupFile_TagExpr)
        let newpattern = '/c' . a:pattern
        let tags = taglist(newpattern)
    catch
        echohl ErrorMsg | echo "Exception: " . v:exception | echohl NONE
        return ""
    finally
        let &tags = _tags
    endtry

    " Show the matches for what is typed so far.
    let files = map(tags, 'v:val["filename"]')
    return files
endfunction
let g:LookupFile_LookupFunc = 'LookupFile_IgnoreCaseFunc'

"====================Lookupfile 相关设置 end========================================

