#! /bin/bash

if [[ $# -ne 2 ]]; then
    echo "Usage: tar-comress.sh <name of archive.tar.gz> <target>"
    exit 1
fi


tar -czvf "$1" "$2"
