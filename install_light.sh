#!/bin/bash

mv ~/.vimrc ~/.vimrc.backup
if [ $? -eq 0 ] ; then echo "Backed up existing vimrc at ~/.vimrc.backup" ; fi

cat ./vimrcs/base.vim > ~/.vimrc
if [ $? -eq 0 ] ; then echo "Installed basic vimrc" ; fi
