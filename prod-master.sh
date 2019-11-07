#!/bin/bash
# set -ev

ENV_LOCATION=$PWD/.env
echo $ENV_LOCATION
source $ENV_LOCATION

ssh ubuntu@"$STORAGE_TORONTO_IP" 'bash -s' < install-docker.sh
ssh ubuntu@"$STORAGE_AMSTERDAM_IP" 'bash -s' < install-docker.sh
ssh ubuntu@"$STORAGE_BANGALORE_IP" 'bash -s' < install-docker.sh
ssh ubuntu@"$STORAGE_SINGAPORE_IP" 'bash -s' < install-docker.sh
ssh ubuntu@"$CENTRAL_NYC_IP" 'bash -s' < install-docker.sh


ssh ubuntu@"$STORAGE_TORONTO_IP" 'bash -s' < pull-docker.sh
ssh ubuntu@"$STORAGE_AMSTERDAM_IP" 'bash -s' < pull-docker.sh
ssh ubuntu@"$STORAGE_BANGALORE_IP" 'bash -s' < pull-docker.sh
ssh ubuntu@"$STORAGE_SINGAPORE_IP" 'bash -s' < pull-docker.sh
ssh ubuntu@"$CENTRAL_NYC_IP" 'bash -s' < pull-docker.sh

CMD="$(ssh ubuntu@$CENTRAL_NYC_IP 'bash -s' < create-network.sh | grep -P 'docker swarm join --token SWMTKN.*' -o)"

ssh ubuntu@"$STORAGE_TORONTO_IP" $CMD
ssh ubuntu@"$STORAGE_AMSTERDAM_IP" $CMD
ssh ubuntu@"$STORAGE_BANGALORE_IP" $CMD
ssh ubuntu@"$STORAGE_SINGAPORE_IP" $CMD





