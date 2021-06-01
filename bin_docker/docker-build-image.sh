#! /bin/bash

if [[ $# -ne 1 ]];then
    echo "Usage: docker-build-image.sh <name>"
    exit 1
fi

docker image build -t "$1" .

