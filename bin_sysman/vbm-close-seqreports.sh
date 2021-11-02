#! /bin/bash

current=$(vbm-current.sh "seqreports")
sudo kill -9 $(ps -aux | grep $current | grep -v grep | awk '{print $2}')
echo "process for seqreport vm was killed"
