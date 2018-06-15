export EDITOR='emacs'
export GIT_EDITOR='emacs'
export SVN_EDITOR='emacs'
export PATH="${HOME}/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/games"

case ${UID} in
    0)
        export LANG='en_US.UTF-8'
        export LOGNAME="$(id -u -n)"
        ;;
    *)
        export LANG='ja_JP.UTF-8'
        ;;
esac

alias ll='ls -Alo'

source ${HOME}/.zsh/kc.zsh
