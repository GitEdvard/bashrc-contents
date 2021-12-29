#! /bin/bash
# Play an ansible playbook with local inventory file

if [[ $# -eq 0 ]]; then
	echo "Usage: play.sh <role> [options]"  
	exit 1
fi

ansible-playbook -i /home/edvard/sources/snpseq/miarka-provision/local_inventory.yml install.yml --e site=upps -t "$1" 

echo "$@"
