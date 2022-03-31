#! /bin/bash

if [[ $# -eq 0 ]];then
    echo "Usage run-clarity.sh <script python name starting at clarity_ext_scripts>"
    exit 1
fi

python /home/edvard/sources/snpseq/clarity-snpseq/clarity-ext/clarity_ext/cli.py --level INFO extension --cache False clarity_ext_scripts."$1" test
