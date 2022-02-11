#! /bin/bash

if [[ $# -ne 1 ]]; then
	echo "Usage: miarka-variable.sh <variable-name>, searches in ~/sources/snpseq/miarka-provision"
	exit 1
fi

ansible -i /home/edvard/sources/snpseq/miarka-provision/inventory.yml all -m debug -a "var=$1"
