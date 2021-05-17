#! /bin/bash

if [[ $# -ne 1 ]];then
    echo "Usage: docker-run-interactive.sh <container name>"
    exit 1
fi

sudo docker exec -it "$1" /bin/bash
