#!/bin/sh

# emacs
echo 'emacs'
ln -s $PWD/emacs $HOME/.emacs.d

# tmux
echo 'tmux'
ln -s $PWD/tmux.conf $HOME/.tmux.conf
case "$(uname -s)" in
    Darwin)
        mkdir $HOME/.tmux
        ln -s $PWD/tmux/darwin.conf $HOME/.tmux/darwin.conf
        ;;
    *)
        ;;
esac

# vim
echo 'vim'
ln -s $PWD/vimrc $HOME/.vimrc
case "$(uname -s)" in
    Darwin)
        ln -s $PWD/gvimrc $HOME/.gvimrc
        ;;
    *)
        ;;
esac

# zsh
echo 'zsh'
ln -s $PWD/zshenv $HOME/.zshenv
ln -s $PWD/zshrc $HOME/.zshrc
ln -s $PWD/zsh $HOME/.zsh
