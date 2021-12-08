" $HOME/.vim/init/functions.vimrc

" Toggles the theme from light to dark
function! ToggleThemeMode(style)
    if a:style == "dark"
        set background=dark
        AirlineTheme tomorrow
        colorscheme Tomorrow-Night
    else
        set background=light
        colorscheme Tomorrow
        AirlineTheme tomorrow
    en
endfunction

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
