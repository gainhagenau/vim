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

cat ~/vim/vimrcs/base.vim > ~/.vimrc
if [ $? -eq 0 ] ; then 
    echo "Installed basic vimrc!"
else 
    echo "There was an error installing your vimrc"
fi

