export GIT_EDITOR='atom --wait'
export SVN_EDITOR='atom --wait'
export PERL5LIB="${HOME}/local/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"
export PERL_LOCAL_LIB_ROOT="${HOME}/local/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"
export PERL_MB_OPT="--install_base \"${HOME}/local/perl5\""
export PERL_MM_OPT="INSTALL_BASE=${HOME}/local/perl5"
export PATH="${HOME}/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/libexec:/opt/X11/bin"

case ${UID} in
    501)
        export LANG='en_US.UTF-8'
        export LOGNAME="$(id -u -n)"
        ;;
    10211)
        export LANG='en_US.UTF-8'
        export LOGNAME="$(id -u -n)"

        if (( ${+commands[rbenv]} ))
        then
            eval "$(rbenv init -)"
        fi
        ;;
    *)
        export LANG='ja_JP.UTF-8'
        ;;
esac

alias ll='ls -AlO'

source /usr/local/etc/profile.d/colorsvn-env.sh
if [[ -r ${HOME}/.zsh/GitHub.zsh ]]
then
    source ${HOME}/.zsh/GitHub.zsh
fi