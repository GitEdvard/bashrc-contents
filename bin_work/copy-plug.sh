#! /bin/bash

if [[ $# -eq 0 ]];then
    echo "Usage copy-plug myplugfiles file.vim"
    exit 1
fi
cp ~/sources/admin/VimFiles/myplugfiles/"$1" .
