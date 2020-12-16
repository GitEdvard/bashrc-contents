#! /bin/bash

if [[ $# -ne 1 ]];then
    echo "usage vbm-close-current.sh <vm name search pattern>"
    exit 1
fi
current=$(vbm-current.sh "$1")
sudo kill -9 $(ps -aux | grep $current | grep -v grep | awk '{print $2}')
echo "process for vm was killed"
