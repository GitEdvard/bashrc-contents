#! /bin/bash

if [[ $# -ne 3 ]];then
    echo "Usage find-replace.sh <directory> <oldword> <newword>"
    exit 1
fi

find $1 -type f -exec sed -i "s/$2/$3/g" {} \;
