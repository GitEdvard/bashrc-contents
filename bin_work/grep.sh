#! /bin/bash
# As grep, built in option for --exclude-dir=node_modules
grep -r --color --exclude-dir=node_modules "$@"
