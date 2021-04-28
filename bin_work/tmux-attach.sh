#! /bin/bash

if [[ $# -ne 1 ]]; then
    echo " Usage: tmux-attach.sh <session name>"
    exit 1
fi

tmux attach -t"$1"
