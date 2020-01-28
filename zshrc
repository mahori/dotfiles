case ${OSTYPE} in
    darwin*)
        source ${HOME}/.zsh/darwin.zsh
        ;;
    freebsd*)
        source ${HOME}/.zsh/freebsd.zsh
        ;;
    linux-gnu)
        source ${HOME}/.zsh/linux.zsh
        ;;
    *)
        ;;
esac

source ${HOME}/.zsh/local.zsh

if [[ -f ${HOME}/.zsh/private.zsh ]]
then
    source ${HOME}/.zsh/private.zsh
fi
