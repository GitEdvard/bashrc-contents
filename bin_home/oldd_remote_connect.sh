#!/bin/bash

# The following can be set as environment variables:
# UU_VPN_USERNAME - required
# UU_VPN_CLIENT_PATH - default is /opt/cisco/anyconnect/bin/vpn
# SNPSEQ_WORKSTATION_HOSTNAME - required
# SNPSEQ_WORKSTATION_USERNAME - default is UU_VPN_USERNAME
# SNPSEQ_TMUX_SESSION - the tmux session id on your workstation

# Usage: ./connect-snpseq <tmux-session>

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

anyconnect_path=${UU_VPN_CLIENT_PATH-"/opt/cisco/anyconnect/bin/vpn"}
workstation_username=${SNPSEQ_WORKSTATION_USERNAME-$username}
tmux_session=${1-$SNPSEQ_TMUX_SESSION}

echo "vpn username=$username"
echo "vpn client path=$anyconnect_path"
echo "workstation hostname=$workstation"
echo "workstation username=$workstation_username"
echo "tmux_session=$tmux_session"

connect_vpn() {
	# TODO: If already connected, skip the following
	# echo -n "VPN password for $username: "
	# read -s password
	# echo
	password=$(<~/.myvpn)

	echo "Disconnecting vpn..."
	eval "${anyconnect_path} -s disconnect"

	echo "Connecting vpn (NOTE: wrong passwords lead to an endless loop for some reason)..."
	# TODO: Handle wrong passwords more gracefully. Currently starts looping over error messages
	# for some reason. Could use expect to solve this. Or use open vpn.
	# TODO: support different vpn clients per platform, supporting both ubuntu and mac
	printf "$username\n$password\n" | eval "${anyconnect_path} -s connect vpn.uu.se"
}

if /opt/cisco/anyconnect/bin/vpn -s state | grep "Disconnected" > /dev/null
then
    echo "Connecting to vpn..."
    connect_vpn
else
    echo "Vpn connection already active"
fi

echo "tunnel to internal resources, gitlab, canea, tableau"

echo "Killing old port binds instances..."
set +e
kill -9 $(lsof -i:5001 -t) 2> /dev/null
kill -9 $(lsof -i:5002 -t) 2> /dev/null
kill -9 $(lsof -i:5003 -t) 2> /dev/null
kill -9 $(lsof -i:8123 -t) 2> /dev/null
set -e


ssh -L 5001:gitlab.snpseq.medsci.uu.se:443 -L 5002:lims-dev.snpseq.medsci.uu.se:443 -L 5003:reporting.snpseq.medsci.uu.se:443 -f -C -N $SNPSEQ_WORKSTATION_USERNAME@$SNPSEQ_WORKSTATION_HOSTNAME

echo "SSHing using SOCKS protocol on port 8123..."
echo "Setup a SOCKS profile in your webbrowser using this port for accessing internal websites"
echo "ssh statement:"
echo "ssh -D 8123 -f -C -N $workstation_username@$workstation"
ssh -D 8123 -f -C -N $workstation_username@$workstation
