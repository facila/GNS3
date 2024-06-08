#!/bin/bash

# exemple : tap.sh add tap0 192.168.100.1/30 192.168.100.3

FONCTION=$1
TAP=$2
ADDRESS=$3
BROADCAST=$4

case $FONCTION in
add) ip tuntap add dev $TAP mode tap
     ip address add $ADDRESS broadcast $BROADCAST dev $TAP
     ip link set dev $TAP up ;;
del) ip tuntap del dev $TAP mode tap ;;
esac
