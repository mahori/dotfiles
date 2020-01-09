export LD_LIBRARY_PATH="/usr/lib/oracle/19.5/client64/lib:/usr/local/lib${LD_LIBRARY_PATH+:}${LD_LIBRARY_PATH}"

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
