# Usage
Place .vimrc to $HOME
Copy .vim/init to $HOME/.vim/init

# VIM-Plug Installation
## Unix/Linux
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

## Windows (PowerShell)
```
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni $HOME/vimfiles/autoload/plug.vim -Force
```
# Plugins Installation
Run :PlugInstall in Vim.