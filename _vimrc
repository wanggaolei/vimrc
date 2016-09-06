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

