#! /bin/bash
# Play an ansible playbook with local inventory file

if [[ $# -eq 0 ]]; then
	echo "Usage: play.sh [options] <path to playbook>"
	exit 1
fi

ansible-playbook -i /home/edvard/sources/system-management/snpseq/inventories/local_inventory "$@"


