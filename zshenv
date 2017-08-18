typeset -U path
path=(/usr/local/bin $path)

if [[ -d ${HOME}/.rbenv ]]
then
    eval "$(rbenv init -)"
fi
