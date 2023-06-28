#! /bin/bash

if [[ $# -eq 0 ]];then
    echo "Usage copy-vimfiles path"
    exit 1
fi
cp ~/sources/admin/VimFiles/"$1" .
