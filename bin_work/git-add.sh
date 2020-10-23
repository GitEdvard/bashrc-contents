#! /bin/bash
# Usage: <repository name> 
if [[ $# -ne 1 ]]; then
	echo "Usage:  git-add.sh <file path>"
	exit 1	
fi
git add  "$1"

