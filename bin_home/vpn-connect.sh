#!/bin/bash

# The following can be set as environment variables:
# UU_VPN_USERNAME - required
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

workstation_username=${SNPSEQ_WORKSTATION_USERNAME-$username}
tmux_session=${1-$SNPSEQ_TMUX_SESSION}

echo "vpn username=$username"
echo "workstation hostname=$workstation"
echo "workstation username=$workstation_username"
echo "tmux_session=$tmux_session"

connect_vpn() {
	# TODO: If already connected, skip the following
	# echo -n "VPN password for $username: "
	# read -s password
	# echo
	password=$(<~/.myvpn)

	echo "Connecting vpn (NOTE: wrong passwords lead to an endless loop for some reason)..."
	# TODO: Handle wrong passwords more gracefully. Currently starts looping over error messages
	# for some reason. Could use expect to solve this. Or use open vpn.
	# TODO: support different vpn clients per platform, supporting both ubuntu and mac
	printf "$password\n" | eval "sudo openconnect vpn.uu.se --user=${username} --background"
}

echo "Connecting to vpn..."
connect_vpn
