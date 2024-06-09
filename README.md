# Configuration dans Linux d'une interface TAP pour GNS3
### Dans Linux en root pour l'utilisateur USER
```
1 : créer le fichier /root/Scripts/tap.sh :
    touch     /root/Scripts/tap.sh
    chmod 700 /root/Scripts/tap.sh

2 : ajouter dans /etc/sudoers en remplacant USER par le nom de votre utilisateur
    USER    ALL=(ALL)    NOPASSWD:   /root/Scripts/tap.sh
```
### Dans Linux en USER
```
1 : créer le fichier /home/$USER/GNS3/gns3.sh :
    touch     /home/$USER/GNS3/gns3.sh
    chmod 700 /home/$USER/GNS3/gns3.sh

2 : lancer GNS3 en donnant votre projet exemple "mynet" et les paramètres de l'interface
    /home/$USER/GNS3/gns3.sh /home/$USER/GNS3/projects/mynet/mynet.gns3 tap0 192.168.100.1/30 192.168.100.3 &
    l'interface tap est créée au démarrage de GNS3 et supprimée à la fermeture

3 : vérifier l'interface
    ifconfig
    tap0: flags=4099<UP,BROADCAST,MULTICAST>  mtu 1500
            inet 192.168.100.1  netmask 255.255.255.252  broadcast 192.168.100.3
```
### Dans GNS3
```
1 : ajouter un cloud :
    change hostname : ADMIN-SERVER
    change symbole  : classic - server
    configure       : Tap interfaces - tap0 - Add

2 : ajouter et configurer un routeur , exemple avec l'interface e0 :
    change hostname : ADMIN-ROUTER
    interface e0
     ip address 192.168.100.2 255.255.255.252

3 : ajouter un lien entre les 2 
    ADMIN-SERVER tap0 <-> ADMIN-ROUTER e0
    View - Show/Hide interface labels 

4 : ajouter un cadre entourant les 2 objets
    Annotate - Draw rectangle
    cliquer avec le bouton de droite sur le cadre 
    Lower one layer
    ajouter un nom en haut dans le cadre
    Annotate - Add note
    taper ADMIN

5 : démarrer les 2 objets
    start
```
### Dans Linux en USER
```
1 : le routeur devient joignable ( ping ) et administrable ( telnet , ssh , ... ) depuis Linux
2 : ping 192.168.100.2
```
