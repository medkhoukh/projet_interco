lanccer docker sur votre machine


-- dans le dossier où se trouve le fichier docker-compose.yaml , lancez la commande : docker-compose build



-- et puis lancez la commande : docker-compose up -d  ( pour run le projet)


ajoutez les permissions pour lancer les scripts: chmod +x script_route_default.sh //  chmod +x script_ospf.sh ......... ( pour tout les scripts : chmod +x script*.sh )

pour lancer le script principal : ./start.sh

(pour que le script .start ne prenne pas trop de temps, on a decider d'installer les services un à un lors de l'ouverture des containers : firefox, mumble et wireshark)

pour tester le serveur dns : il faut changer le fichier resolv.conf , et mettre l'adresse du serveur dns que vous souhaitiez utiliser,
par exemple " nameserver 120.0.33.21 " qui est le DNS de l'entreprise

on peut tester le bon fonctionnement à l'aide de " curl http://EntrepriseReseau2025.com "

si vous avez des problèmes, on peut en discuter sur messenger.
