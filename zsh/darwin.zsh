export GIT_EDITOR='code --wait'
export SVN_EDITOR='code --wait'
export CPAN_HOME="${HOME}/local/perl5"
export PERL5LIB="${CPAN_HOME}/lib/perl5${PERL5LIB+:}${PERL5LIB}"
export PERL_LOCAL_LIB_ROOT="${CPAN_HOME}${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"
export PERL_MB_OPT="--install_base \"${CPAN_HOME}\""
export PERL_MM_OPT="INSTALL_BASE=${CPAN_HOME}"
export PYTHONUSERBASE="${HOME}/local/python"
export GEM_HOME="${HOME}/local/ruby"
export ORACLE_HOME="${HOME}/local/oracle"
export DYLD_LIBRARY_PATH="${ORACLE_HOME}${DYLD_LIBRARY_PATH+:}${DYLD_LIBRARY_PATH}"
export PATH="${HOME}/bin:${CPAN_HOME}/bin:${GEM_HOME}/bin:${ORACLE_HOME}:/usr/local/opt/ruby@2.6/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/libexec"

case ${UID} in
    501)
        export LANG='en_US.UTF-8'
        export LOGNAME="$(id -u -n)"
        ;;
    *)
        export LANG='ja_JP.UTF-8'
        ;;
esac

alias ec='emacsclient -a "" -c -n'
alias et='emacsclient -a "" -t'
alias ek='emacsclient -e "(kill-emacs)"'
alias ll='ls -AlO'

source /usr/local/etc/profile.d/colorsvn-env.sh
