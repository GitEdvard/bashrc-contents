#! /bin/bash
# Apply ansible playbook to the current computer. sudo must be activated in order for it to work.

if [[ $# -eq 0 ]]; then
	echo "Usage: play.sh [options] <path to playbook>"
	exit 1
fi

ansible-playbook -i /home/edvard/sources/admin/ansible/inventories/dev_inventory "$@"


