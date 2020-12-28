#! /bin/bash

if [[ "$#" -ne 1 ]];then
    echo "Usage, conda-create.sh <name>"
    exit 1
fi

conda create --name "$1" python=2.7 -y
