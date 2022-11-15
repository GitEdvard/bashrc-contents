#!/bin/bash

# The following can be set as environment variables:
# UU_VPN_USERNAME - required
# SNPSEQ_WORKSTATION_HOSTNAME - required
# SNPSEQ_WORKSTATION_USERNAME - required


set -e

if [ "$SNPSEQ_WORKSTATION_HOSTNAME" == "" ];  then
	echo "Error: SNPSEQ_WORKSTATION_HOSTNAME must be set"
	exit 1;
fi

if [ "$SNPSEQ_WORKSTATION_USERNAME" == "" ];  then
	echo "Error: SNPSEQ_WORKSTATION_USERNAME must be set"
	exit 1;
fi


echo "SSHing to your workstation"
#ssh -R 19988:localhost:19988 $SNPSEQ_WORKSTATION_USERNAME@$SNPSEQ_WORKSTATION_HOSTNAME

#ssh $SNPSEQ_WORKSTATION_USERNAME@$SNPSEQ_WORKSTATION_HOSTNAME 'DISPLAY=:0 xsel -i'

ssh -E /dev/null -X -D 8123 $SNPSEQ_WORKSTATION_USERNAME@$SNPSEQ_WORKSTATION_HOSTNAME
