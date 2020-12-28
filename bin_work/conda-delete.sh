#! /bin/bash

if [[ "$#" -ne 1 ]];then
    echo "Usage conda-delete.sh <environment>"
    exit 1
fi

conda remove --name "$1" --all -y
