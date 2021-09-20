#! /bin/bash

current=$(vbm-current.sh "lims-db")
sudo kill -9 $(ps -aux | grep $current | grep -v grep | awk '{print $2}')
echo "process for lims-db vm was killed"
current=$(vbm-current.sh "lims_lims_")
sudo kill -9 $(ps -aux | grep $current | grep -v grep | awk '{print $2}')
echo "process for lims-app vm was killed"
