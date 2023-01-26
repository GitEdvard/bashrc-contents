#!/usr/bin/env bash

ansible-playbook -i /home/edvard/sources/admin/ansible/inventories/local_inventory windows.yml "$@"
