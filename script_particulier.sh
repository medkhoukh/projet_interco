docker exec -it particulier /bin/bash -c "apt update && apt install isc-dhcp-client && apt install curl && apt install iputils-ping && dhclient eth0 && dhclient -r eth0"





