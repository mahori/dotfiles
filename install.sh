#!/bin/sh

# emacs
echo 'emacs'
ln -s $PWD/emacs $HOME/.emacs.d

# tmux
echo 'tmux'
ln -s $PWD/tmux.conf $HOME/.tmux.conf

# zsh
echo 'zsh'
ln -s $PWD/zshrc $HOME/.zshrc
ln -s $PWD/zsh $HOME/.zsh
