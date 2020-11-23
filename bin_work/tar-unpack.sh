#! /bin/bash

if [[ "$#" -ne 1 ]]; then
   echo "Usage tar-unpack.sh <*.tar.gz>"
   echo "command: tar -xvf \$1"
   exit 1
fi
   

tar -xvf "$1"
