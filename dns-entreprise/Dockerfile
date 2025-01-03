FROM ubuntu/bind9:latest

COPY named.conf.local /etc/bind/
COPY zones/forward.EntrepriseReseau2025.db /etc/bind/zones/forward.EntrepriseReseau2025.db
COPY zones/reverse.EntrepriseReseau2025.db /etc/bind/zones/reverse.EntrepriseReseau2025.db
COPY named.conf.options /etc/bind/



