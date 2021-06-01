#! /bin/bash

if [[ $# -eq 0 ]];then
    echo "Usage: curl-lims-dev.sh <url to resource> <other curl flags>"
    exit 1
fi

curl -u "$@"
