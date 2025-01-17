docker exec -it particulier /bin/bash -c "apt update && apt install isc-dhcp-client && apt install curl && apt install iputils-ping && dhclient eth0 && dhclient -r eth0"
docker exec -it particulier2 /bin/bash -c "apt update && apt install isc-dhcp-client && apt install curl && apt install iputils-ping && dhclient eth0 && dhclient -r eth0"
docker exec -it particulier2 /bin/bash -c "apt install firefox && apt install mumble"



#script pour routage statique de l'entreprise
docker exec -it employe_administratif /bin/bash -c "ip route del default && ip route add default via 192.168.2.2 dev eth0"
docker exec -it employe_technique /bin/bash -c "ip route del default && ip route add default via 192.168.3.2 dev eth0"

docker exec -it employe_technique /bin/bash -c "apt update && apt install isc-dhcp-client && apt install curl && apt install iputils-ping && dhclient eth0 && dhclient -r eth0"
docker exec -it employe_technique /bin/bash -c "apt install firefox && apt install mumble"
docker exec -it employe_administratif /bin/bash -c "apt update && apt install isc-dhcp-client && apt install curl && apt install iputils-ping && dhclient eth0 && dhclient -r eth0"
docker exec -it employe_administratif /bin/bash -c "apt install firefox && apt install mumble"

docker exec -it Routeur_bureau_administratif /bin/bash -c "ip route del default && ip route add default via 120.0.42.2 dev eth1"
docker exec -it Routeur_bureau_technique /bin/bash -c "ip route del default && ip route add default via 120.0.42.2 dev eth1"

#activation de dhcp sur les routeurs de l'entreprise
docker exec -it Routeur_bureau_administratif /bin/sh -c "dhcpd"
#NAT
docker exec -it Routeur_bureau_administratif /bin/sh -c "apk update && apk add iptables"
docker exec -it Routeur_bureau_administratif /bin/sh -c "iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE"
docker exec -it Routeur_bureau_administratif /bin/sh -c "iptables -A FORWARD -i eth0 -o eth1 -j ACCEPT"
docker exec -it Routeur_bureau_administratif /bin/sh -c "iptables -A FORWARD -i eth1 -o eth0 -m state --state RELATED,ESTABLISHED -j ACCEPT"

docker exec -it Routeur_bureau_technique /bin/sh -c "dhcpd"
#NAT
docker exec -it Routeur_bureau_technique /bin/sh -c "apk update && apk add iptables"
docker exec -it Routeur_bureau_technique /bin/sh -c "iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE"
docker exec -it Routeur_bureau_technique /bin/sh -c "iptables -A FORWARD -i eth0 -o eth1 -j ACCEPT"
docker exec -it Routeur_bureau_technique /bin/sh -c "iptables -A FORWARD -i eth1 -o eth0 -m state --state RELATED,ESTABLISHED -j ACCEPT"

