#!/bin/bash



#on choisit la route par defaut de la box et par la même occasion on active dhcp
docker exec -it box_particulier /bin/sh -c "ip route del default && ip route add default via 120.0.34.5 dev eth0 && mkdir -p /run/dhcp "

#activation de dhcp sur la box
docker exec -it box_particulier /bin/sh -c "dhcpd"
#NAT
docker exec -it box_particulier /bin/sh -c "apk update && apk add iptables"
docker exec -it box_particulier /bin/sh -c "iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE"
docker exec -it box_particulier /bin/sh -c "iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT"
docker exec -it box_particulier /bin/sh -c "iptables -A FORWARD -i eth0 -o eth1 -m state --state RELATED,ESTABLISHED -j ACCEPT"


docker exec -it Routeur_entreprise_site_2 /bin/sh -c "dhcpd"
#NAT
docker exec -it Routeur_entreprise_site_2 /bin/sh -c "apk update && apk add iptables"
docker exec -it Routeur_entreprise_site_2 /bin/sh -c "iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE"
docker exec -it Routeur_entreprise_site_2 /bin/sh -c "iptables -A FORWARD -i eth0 -o eth1 -j ACCEPT"
docker exec -it Routeur_entreprise_site_2 /bin/sh -c "iptables -A FORWARD -i eth1 -o eth0 -m state --state RELATED,ESTABLISHED -j ACCEPT"


echo " pour utiliser le dhcp : dhclient eth0 ----> sur le container particulier"

