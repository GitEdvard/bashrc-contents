#! /bin/bash

if [[ $# -eq 0 ]];then
    echo "Usage ansible-vault.sh <view|edit> <secret file>"
    return 1
fi

ansible-vault "$1" --vault-password-file=/ansible/.vault_password.txt "$2"
