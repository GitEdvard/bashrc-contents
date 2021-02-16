#! /bin/bash

if [[ $# -ne 2 ]];then
    echo "Usage: view-secret <password-file> <path to secret.yml>"
    exit 1
fi

ansible-vault view --vault-password-file="$1" "$2"
