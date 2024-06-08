# Configuration dans Linux d'une interface TAP pour GNS3

### Dans Linux en root pour l'utilisateur USER
```
1 : créer le fichier /root/Scripts/tap.sh :
touch     /root/Scripts/tap.sh
chmod 700 /root/Scripts/tap.sh

2 : ajouter dans /etc/sudoers en remplacant USER par le nom de votre utilisateur

USER    ALL=(ALL)    NOPASSWD:   /root/Scripts/tap.sh
```
