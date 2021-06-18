#!/bin/bash
sudo pacman -S vim cmake gcc python3 mono go nodejs jdk-openjdk npm zathura zathura-pdf-mupdf python-pip nvim
cp .vimrc ~/
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +'PlugInstall --sync' +qa
python3 ~/.vim/plugged/YouCompleteMe/install.py --all
mkdir ~/.vim/ultisnips
mkdir ~/.config/zathura
mkdir ~/.config/nvim
cp zathurarc ~/.config/zathura
cp tex.snippets ~/.vim/plugged
cp init.vim ~/.config/nvim

