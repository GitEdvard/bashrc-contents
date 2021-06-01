#! /bin/bash

if [[ $# -eq 0 ]]; then
    echo "Usage: docker-run-container.sh [options] <image name>"
    echo "example: docker-run-container -p 9999:80 -d checkqc"
    exit 1
fi

docker container run "$@"
