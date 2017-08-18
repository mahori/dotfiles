kc ()
{
    local key_file=${HOME}/.ssh/id_rsa
    local keychain_file=${HOME}/.keychain/${HOST}-sh

    pgrep -q ssh-agent || keychain --clear && keychain ${key_file}

    if [ -f ${keychain_file} ]
    then
       source ${keychain_file}
    fi
}
