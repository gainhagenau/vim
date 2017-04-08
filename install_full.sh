#!/bin/bash

#Check if the current vimrc should be backed up
line=$(head -1 ~/.vimrc)
if [ "$line" != '" Author: Gain Hagenau' ] ; then
    mv ~/.vimrc ~/.vimrc.backup
    if [ $? -eq 0 ] ; then echo "Backed up existing vimrc at ~/.vimrc.backup" ; fi
fi

mkdir ~/.vim
mkdir ~/.vim/undodir
if [ $? -eq 0 ] ; then echo "Created undo directory" ; fi
mkdir ~/.vim/bundle
if [ $? -eq 0 ] ; then echo "Created plugin directory" ; fi

echo '" Author: Gain Hagenau

source ~/vim/vimrcs/base.vim
source ~/vim/vimrcs/plugins.vim' > ~/.vimrc

echo "Installing Vundle (Vim Package Manager)..."
$(git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim)
if [ $? -eq 0 -o $? -eq 128 ] ; 
then 
    echo "Success!" 
    echo "Installing Plugins..."
    $(vim +PluginInstall +qall > /dev/null)
fi

echo "Install Complete!"
