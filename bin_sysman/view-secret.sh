#! /bin/bash

if [[ $# -ne 1 ]];then
    echo "Usage: view-secret <path to secret.yml>"
    exit 1
fi

ansible-vault view --vault-password-file=/ansible/.vault_password.txt "$1"
