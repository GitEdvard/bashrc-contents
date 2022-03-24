#! /bin/bash

if [[ $# -eq 0 ]];then
    echo "Usage ansible-lint.sh <playbook or pattern>"
    exit 1
fi

ANSIBLE_ROLES_PATH="dependencies/roles/:dependencies/roles/ansible-st2/roles:miarka-provision/roles/:roles/:/etc/ansible/roles/:/etc/ansible/roles/ansible-st2/roles/" ansible-lint -p -x301,305,401,403,502,503,602,701,703 "$1"
