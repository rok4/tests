# Tests fonctionnels des APIs de ROK4SERVER

## Compilation de l'image de test

`docker-compose build`

## Exécution des tests

Dans ce dossier : `TAG=<VERSION> docker-compose up --abort-on-container-exit`. Le statut de cette commande est alors celui du conteneur de test. 0 si tous les tests se sont bien déroulés, un autre code sinon.

## Architecture de tests

* Front NGINX
* Middle ROK4SERVER
* Client de test (NodeJS)

## Contenu des tests

* Routes d'administrations
  * Création de couche
  * Modification de couche
  * Suppression de couche
* Routes WMS
  * Demande des capacités du service
  * Demande d'une image
  * Demande d'informations
* Routes WMTS
  * Demande des capacités du service
  * Demande d'une tuile
  * Demande d'informations
* Routes TMS
  * Demande des capacités du service
  * Demande d'informations sur une couche
  * Demande de métadonnées au format JSON
  * Demande du fichier de configuration GDAL (XML)
  * Demande d'une tuile
