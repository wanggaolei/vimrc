" 999 => Filetype Setlocal {{{
" 根据不同的文件类型，大部分需要覆盖通用设置项，放在最后生效
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
" HTML文件, 标记嵌套比较多，缩进2个空格
autocmd FIletype html setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
" }}}
