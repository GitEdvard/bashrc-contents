#! /bin/bash
# Usage: <source> <target>
# copy direcoties and exclude the .git file
if [[ $# -ne 2 ]]; then
    echo "Usage: <source> <target>"
    echo "copy direcoties and exclude the .git file"
    exit 1	
fi
rsync -av "$1" "$2" --exclude=.git
