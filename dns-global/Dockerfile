FROM ubuntu/bind9:latest

COPY named.conf.local /etc/bind/
COPY zones/forward.fournisseur2025.db /etc/bind/zones/forward.fournisseur2025.db
COPY zones/reverse.fournisseur2025.db /etc/bind/zones/reverse.fournisseur2025.db
COPY named.conf.options /etc/bind/



