#!/bin/bash

# Liste des noms des conteneurs
containers=(
  "Routeur_acces_particuliers"
  "Routeur_services_FAI" 
  "Routeur_acces_entreprises"
  "Routeur_entreprise_site_principal"
  "Routeur_interco"
)

# Commandes à exécuter dans chaque conteneur
commands="
chown frr:frr /etc/frr/frr.conf &&
chmod 640 /etc/frr/frr.conf &&
/usr/lib/frr/zebra -d &&
/usr/lib/frr/ospfd -d &&
/etc/init.d/frr start
"

# Executions des commandes sur chaque conteneur
for container in "${containers[@]}"; do
  echo "Configuration du conteneur: $container"
  # on ouvre un nouveau terminal shell sur le container et applique les commandes ( on donne tous les droits d'acces et on restart tous les daemons)
  docker exec -it "$container" /bin/sh -c "$commands"
  if [ $? -ne 0 ]; then
    echo "Erreur lors de la configuration du conteneur: $container"
  else
    echo "Configuration réussie pour le conteneur: $container"
  fi
done

echo "ospf est prêt"
