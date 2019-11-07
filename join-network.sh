#!/bin/bash
# set -ev

ENV_LOCATION=$PWD/.env
echo $ENV_LOCATION
source $ENV_LOCATION

ssh ubuntu@"$STORAGE_TORONTO_IP" 'bash -s' < token-command.sh
ssh ubuntu@"$STORAGE_AMSTERDAM_IP" 'bash -s' < token-command.sh
ssh ubuntu@"$STORAGE_BANGALORE_IP" 'bash -s' < token-command.sh
ssh ubuntu@"$STORAGE_SINGAPORE_IP" 'bash -s' < token-command.sh
