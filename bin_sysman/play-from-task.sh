#! /bin/bash

if [[ $# -eq 0 ]];then
    echo "Intended to run on orc. Usage play-from-task.sh <task name>"
    exit 1
fi

ansible-playbook -i /home/MOLMED/edeng655/sources/sysman-working/system-management/snpseq/inventories/dev_inventory --private-key /opt/snpseq/secrets/prod/orc/gitlab-root-key lims_c7.yml --start-at-task "$1" -vv
