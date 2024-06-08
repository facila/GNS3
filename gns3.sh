#!/bin/bash

PROJECT=$1
TAP=$2
ADDRESS=$3
BROADCAST=$4

sudo /root/Scripts/tap.sh add $TAP $ADDRESS $BROADCAST
/usr/bin/gns3 -q $PROJECT
sudo /root/Scripts/tap.sh del $TAP
