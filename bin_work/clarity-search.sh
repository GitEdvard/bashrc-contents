#! /bin/bash

if [[ $# -ne 1 ]]; then
      echo "Usage: clarity-fetch.sh <path to resource>"
      exit 1
fi
      

source /home/edvard/sources/snpseq/clarity-snpseq/venv/bin/activate

python /home/edvard/sources/admin/bashrc-contents/python/clarity-fetch.py "$1"
