
#! /bin/bash
# Play an ansible playbook and apply it on Miarka
# Requires to be called from Miarka deployment node

if [[ $# -eq 0 ]]; then
	echo "Usage: play.sh <role, not playbook> [options]"  
	exit 1
fi

ansible-playbook -i /home/edvard/sources/miarka-provision/inventory.yml install.yml --e site=upps --e deployment_remote_path=/vulpes/ngi/devel-edvard --e deployment_environment=devel deployment_version=0.1 -t "$@" 

