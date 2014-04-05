#! /bin/bash 
# *-* encoding: utf-8 *-*
#
# =============================================
#      Author   : Andy Scout
#    Homepage   : http://andyhuzhill.github.io
#    E-mail     : andyhuzhill@gmail.com
#
#  Description  : 在新系统上重新同步vim设置
#  Revision     :
#
# =============================================


cd ~/.vim

if [ -f "$HOME/.vimrc" ]; then
    mv ~/.vimrc ~/.vimrc.`date +%Y%m%d`
fi

ln -s ~/.vim/.vimrc ~/.vimrc

git submodule init
git submodule update

vi +BundleInstall! +qall

