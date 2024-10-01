# Tests fonctionnels des APIs de ROK4SERVER

## Exécution des tests

Dans ce dossier : `TAG=<VERSION> docker-compose up --abort-on-container-exit`. Le statut de cette commande est alors celui du conteneur de test. 0 si tous les tests se sont bien déroulés, un autre code sinon. Les résultats des tests sont au format JSON dans le dossier `results`.

## Architecture de tests

* Front NGINX
* Middle ROK4SERVER
* Data MINIO
* Client de test [Bruno](https://www.usebruno.com/)

