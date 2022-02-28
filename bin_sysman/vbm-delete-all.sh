#! /bin/bash

# Close running vms
vboxmanage list vms | awk '{print $1}' | sed s/\"//g | while read -r line ; do
    sudo kill -9 $(ps -aux | grep $line | grep -v grep | awk '{print $2}')
    echo "Process for $line vm was killed"
done

# Delete all vms
source ~/.bashrc
vboxmanage list vms | awk '{print $1}' | sed 's/\"//g' | while read -r vm ; do
    vboxmanage unregistervm "$vm" -delete
done

# Release vm entries in known hosts
cat /home/edvard/sources/snpseq/system-management/snpseq/vagrant_systems/vagrant/hosts.local | grep -v "^$" | while read line;
do
    ip=$(printf "$line" | awk '{print $1}')
    dns_name=$(printf "$line" | awk '{print $2}')
    # echo $ip
    # echo $dns_name
    ssh-keygen -f "/home/edvard/.ssh/known_hosts" -R "$ip" 2>/dev/null
    ssh-keygen -f "/home/edvard/.ssh/known_hosts" -R "$dns_name" 2>/dev/null
done

cat /home/edvard/sources/admin/ansible/vagrant_systems/vagrant/hosts.local | grep -v "^$" | while read line;
do
    ip=$(printf "$line" | awk '{print $1}')
    dns_name=$(printf "$line" | awk '{print $2}')
    # echo $ip
    # echo $dns_name
    ssh-keygen -f "/home/edvard/.ssh/known_hosts" -R "$ip" 2>/dev/null
    ssh-keygen -f "/home/edvard/.ssh/known_hosts" -R "$dns_name" 2>/dev/null
done
