#!/bin/bash

# The following can be set as environment variables:
# UU_VPN_USERNAME - required
# SNPSEQ_WORKSTATION_HOSTNAME - required
# SNPSEQ_WORKSTATION_USERNAME - default is UU_VPN_USERNAME

set -e

if [ "$UU_VPN_USERNAME" == "" ];  then
	echo "Error: UU_VPN_USERNAME must be set"
	exit 1;
else
	username=$UU_VPN_USERNAME
fi

if [ "$SNPSEQ_WORKSTATION_HOSTNAME" == "" ];  then
	echo "Error: SNPSEQ_WORKSTATION_HOSTNAME must be set"
	exit 1;
else
	workstation=$SNPSEQ_WORKSTATION_HOSTNAME
fi

workstation_username=${SNPSEQ_WORKSTATION_USERNAME-$username}

echo "vpn username=$username"
echo "workstation hostname=$workstation"
echo "workstation username=$workstation_username"

echo "tunnel to internal resources, gitlab, canea, tableau"

echo "Killing old port binds instances..."
set +e
kill -9 $(lsof -i:5001 -t) 2> /dev/null
kill -9 $(lsof -i:5002 -t) 2> /dev/null
kill -9 $(lsof -i:5003 -t) 2> /dev/null
kill -9 $(lsof -i:8123 -t) 2> /dev/null
set -e

echo "ssh:ing to workstation and tunnel internal resources..."
ssh -L 5001:gitlab.snpseq.medsci.uu.se:443 -L 5002:lims-dev.snpseq.medsci.uu.se:443 -L 5003:reporting.snpseq.medsci.uu.se:443 -L 5004:lims-db.snpseq.medsci.uu.se:5432 -L 5005:lims-db-dev.snpseq.medsci.uu.se:5432 -L 5006:lims-db-staging.snpseq.medsci.uu.se:5432 -f -C -N $workstation_username@$workstation

echo "SSHing using SOCKS protocol on port 8123..."
echo "Setup a SOCKS profile in your webbrowser using this port for accessing internal websites"
echo "ssh statement:"
echo "ssh -D 8123 -f -C -N $workstation_username@$workstation"
ssh -D 8123 -f -C -N $workstation_username@$workstation
