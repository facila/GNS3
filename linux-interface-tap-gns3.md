# Configuration dans Linux d'une interface TAP pour GNS3

### Dans Linux en root pour l'utilisateur USER

créer le fichier /root/Scripts/tap.sh :
touch     /root/Scripts/tap.sh
chmod 700 /root/Scripts/tap.sh

#!/bin/bash

#exemple : tap.sh add tap0 192.168.100.1/30 192.168.100.3

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

ajouter dans /etc/suders en remplacant USER par le nom de votre utilisateur

USER    ALL=(ALL)    NOPASSWD:   /root/Scripts/tap.sh
œ
