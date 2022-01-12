#!/bin/bash
cd
sudo pacman -Sy
sudo pacman -S --needed git neovim python python-pip cmake base-devel mono go nodejs jdk-openjdk npm zathura texlive-most zathura-pdf-mupdf gvim
git clone https://github.com/juansegaes/dotfiles.git
mkdir ~/.config/nvim
ln -s ~/dotfiles/vim/.vimrc  ~/.vimrc
rm .config/nvim/*
ln -s ~/dotfiles/vim/.vimrc  ~/.config/nvim/init.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
pip install neovim
vim +'PlugInstall --sync' +qa
nvim --headless +PlugInstall +qall
cd ~/.vim/plugged/YouCompleteMe
python3 install.py --all
mkdir ~/.vim/ultisnips
cp ~/dotfiles/ultisnips/* ~/.vim/ultisnips
cd
