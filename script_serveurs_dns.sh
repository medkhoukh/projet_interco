docker exec -it serveur_dns /bin/sh -c "ip route del default && ip route add default via 120.0.38.3 dev eth0"
docker exec -it serveur_dns_entreprise /bin/sh -c "ip route del default && ip route add default via 120.0.33.18 dev eth0"
docker exec -it openvpn-as  /bin/sh -c "ip route del default && ip route add default via 120.0.33.18 dev eth0"
docker exec -it serveur-voip  /bin/sh -c "ip route del default && ip route add default via 120.0.33.18 dev eth0"