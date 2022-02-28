#! /bin/bash

if [[ $# -ne 1 ]]; then
    echo "Usage: <script name>"
    exit 1
fi

cat $(type -P "$1")
