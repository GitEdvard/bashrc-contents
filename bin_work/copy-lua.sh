#! /bin/bash

if [[ $# -eq 0 ]];then
    echo "Usage copy-lua file.lua"
    exit 1
fi
cp ~/sources/admin/VimFiles/lua/"$1" .
