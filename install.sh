#!/bin/sh

# emacs
echo '===> emacs'
if [ ! -e $HOME/.emacs.d ]
then
    ln -s $PWD/emacs $HOME/.emacs.d
fi

# tmux
echo '===> tmux'
if [ ! -e $HOME/.tmux.conf ]
then
    ln -s $PWD/tmux.conf $HOME/.tmux.conf
fi
if [ ! -e $HOME/.tmux ]
then
    ln -s $PWD/tmux $HOME/.tmux
fi
if [ ! -e $HOME/.tmux/plugins/tpm ]
then
    git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
fi

# zsh
echo '===> zsh'
if [ ! -e $HOME/.zshrc ]
then
    ln -s $PWD/zshrc $HOME/.zshrc
fi
if [ ! -e $HOME/.zsh ]
then
    ln -s $PWD/zsh $HOME/.zsh
fi
export ZPLG_HOME="${HOME}/.zsh/zplugin"
if [ ! -e "${ZPLG_HOME}" ]
then
    export ZDOTDIR="$(mktemp -d -t zplugin)"
    touch ${ZDOTDIR}/.zshrc
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"
    rm -rf ${ZDOTDIR}
fi
