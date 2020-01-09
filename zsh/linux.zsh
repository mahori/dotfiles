export LD_LIBRARY_PATH="/usr/lib/oracle/19.5/client64/lib:/usr/local/lib${LD_LIBRARY_PATH+:}${LD_LIBRARY_PATH}"
export PERL5LIB="${HOME}/local/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"
export PERL_LOCAL_LIB_ROOT="${HOME}/local/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"
export PERL_MB_OPT="--install_base \"${HOME}/local/perl5\""
export PERL_MM_OPT="INSTALL_BASE=${HOME}/local/perl5"

case ${UID} in
    0)
        export LANG='en_US.UTF-8'
        export LOGNAME="$(id -u -n)"
        ;;
    *)
        export LANG='ja_JP.UTF-8'
        ;;
esac

alias ll='ls -Al'
