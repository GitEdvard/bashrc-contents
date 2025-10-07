#!/bin/bash
letter="$1"
lower_letter=$(echo "$letter" | awk '{print tolower($0)}')
# echo $lower_letter
cmd="sudo mount -t drvfs $letter: /mnt/$lower_letter"
# echo $cmd
$($cmd)
