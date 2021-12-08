# Usage
## Clone
```
git clone https://github.com/wanggaolei/vimrc $HOME/vimrc
ln -sf $HOME/vimrc/.vim $HOME/.vim
ln -sf $HOME/vimrc/.vimrc $HOME/.vimrc
```

## VIM-Plug Installation
### Unix/Linux
```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### Windows (PowerShell)
```
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni $HOME/vimfiles/autoload/plug.vim -Force
```

## Plugins Installation
Luanch Vim, run :PlugInstall in Vim.

## Fonts Installation
### Powerline Fonts
```
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh ## install.ps1 for Windows
cd ..
rm -rf fonts
```
### Nerd Fonts

https://www.nerdfonts.com/font-downloads

