#!/bin/sh
set -x
ANSIBLE_TOWER_USERAME=$1
ANSIBLE_TOWER_PASSwORD=$2
ANSIBLE_TOWER_JOB=$3
echo "Lancement du deploiement"
echo "creation des credentials"
tower-cli config host 10.42.0.42
tower-cli config username $ANSIBLE_TOWER_USERAME
tower-cli config password $ANSIBLE_TOWER_PASSwORD
echo "lancement deploiemnt jar"
tower-cli job launch --job-template $ANSIBLE_TOWER_JOB
#tower-cli job launch --job-template $ANSIBLE_TOWER_JOB --extra-vars="app_version: $APP_VERSION"
