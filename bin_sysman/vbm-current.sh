#! /bin/bash

if [[ $# -ne 1 ]]; then
    echo "Usage: vbm-current <search pattern for vm name>"
    exit 1
fi

vboxmanage list vms | grep "$1" | awk '{print $1}' | sed s/\"//g
