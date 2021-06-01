#! /bin/bash

if [[ $# -ne 2 ]]; then
       echo "Usage docker-create-secret.sh <name of secret> <path to file>"
       exit 1
fi

docker secret create "$1" "$2"
