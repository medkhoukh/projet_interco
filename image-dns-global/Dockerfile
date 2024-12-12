FROM ubuntu/bind9:latest
COPY init.sh /init.sh
COPY db.exemple.com /etc/bind/db.exemple.com
COPY named.conf /etc/bind/named.conf
COPY named.conf.local /etc/bind/named.conf.local
COPY named.conf.options /etc/bind/named/named.conf.options
RUN chmod +x /init.sh
RUN /init.sh
CMD ["named", "-g"]