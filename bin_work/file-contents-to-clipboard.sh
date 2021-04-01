#! /bin/bash

if [[ $# -ne 1 ]];then
    echo "Usage file-contents-to-clipboard.sh <file name>"
    exit 1
fi

cat "$1" | xclip -selection c

