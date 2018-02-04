case ${OSTYPE} in
    darwin*)
        source ${HOME}/.zsh/darwin.zsh
        ;;
    freebsd*)
        source ${HOME}/.zsh/freebsd.zsh
        ;;
    *)
        ;;
esac

source ${HOME}/.zsh/local.zsh
