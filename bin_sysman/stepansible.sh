#! /bin/bash

if [[ $# -eq 0 ]];then
    echo "Usage: stepansible <path to inventory file> <playbook> <step name to start from>"
    exit 1
fi

ansible-playbook -i "$1" "$2" --start-at-task="$3" --step
