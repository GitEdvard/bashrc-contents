#! /bin/bash

if [[ $# -ne 1 ]]; then
    echo "Usage: touch-exe.sh <filename>"
    exit 1
fi

touch "$1"
chmod u+x "$1"
