lanccer docker sur votre machine


-- dans le dossier où se trouve le fichier docker-compose.yaml , lancez la commande : docker-compose build



-- et puis lancez la commande : docker-compose up -d  ( pour run le projet)


ajoutez les permissions pour lancer les scripts: chmod +x script_route_default.sh //  chmod +x script_ospf.sh


pour activer le routage ospf sur les routeurs il faut executer le script_ospf.sh avec : ./script_ospf.sh ( ps : si ospf fonctionne déja correctement sur l'un des routeurs et que le script bloque, appuyez sur ctrl+c)


pour activer les routes par defaut et start le dhcp sur la box il faut executer le script_route_default.sh 
