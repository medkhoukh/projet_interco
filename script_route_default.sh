#!/bin/bash
docker exec -it dns-dmz /bin/sh -c "ip route add default via 120.0.38.3 dev eth0"

#on choisit la route par defaut de la box et par la même occasion on active dhcp
docker exec -it box-particulier /bin/sh -c "ip route del default && ip route add default via 120.0.34.5 dev eth1 && mkdir -p /run/dhcp && dhcpd"

#on installe dhclient sur le container du particulier

docker exec -it clientparticulier /bin/sh -c "apk add dhclient  && dhclient eth0 && dhclient -r eth0"
echo " pour utiliser le dhcp : dhclient eth0 ----> sur le container clientparticulier"