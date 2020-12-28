#! /bin/bash

if [[ "$#" -ne 1 ]];then
    echo "Usage source clims-new-conda.sh <name>"
    exit 1
fi

if [[ ! -f .nvmrc ]];then
    echo "Can't find file .nvmrc, are you in the commonlims base direcotry?"
    exit 1
fi

if [[ $(conda info --envs | grep "$1" | wc -l) -eq 0 ]];then
    conda create --name "$1" python=2.7 -y
fi
conda activate "$1"
nvm use $(cat .nvmrc)
make develop
