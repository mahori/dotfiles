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
export ZINIT_HOME="${HOME}/.zsh/zinit"
if [ ! -e "${ZINIT_HOME}" ]
then
    export ZDOTDIR=$(mktemp -d -t 'zinit.XXXXXXXXXX')
    touch ${ZDOTDIR}/.zshrc
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
    rm -rf ${ZDOTDIR}
    if [ -d /tmp/zinit ]
    then
        rm -rf /tmp/zinit
    fi
fi
