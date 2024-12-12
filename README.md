lanccer docker sur votre machine


-- dans le dossier où se trouve le fichier docker-compose.yaml , lancez la commande : docker-compose build



-- et puis lancez la commande : docker-compose up -d  ( pour run le projet)



pour activer le routage ospf sur les routeurs il faut executer une commande en plus à l'interieur des containers de chaque routeur: 
chown frr:frr /etc/frr/frr.conf && chmod 640 /etc/frr/frr.conf && /usr/lib/frr/zebra -d && /usr/lib/frr/ospfd -d && /etc/init.d/frr start
