#! /bin/bash
sudo kill -9 $(ps -aux | grep openconnect | grep -v grep | awk '{print $2}')
sudo systemctl restart network-manager.service
