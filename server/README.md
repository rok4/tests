# Tests fonctionnels des APIs du serveur ROK4

## Jeu des tests en local

On considère que :

* le logiciel [bruno](https://www.usebruno.com/downloads) est installé
* le serveur rok4 est installé et qu'un serveur nginx aiguille les requêtes locale en `/data` vers le port 10000.

Dans ce dossier :

* Lancer le minio de données avec `docker run -d --rm -v $PWD/data/:/backup -p 9000:9000 -p 9001:9001 --name minio rok4/dataset:minio`
* Lancer le serveur : `ROK4_S3_SECRETKEY=rok4S3storage ROK4_S3_KEY=rok4 ROK4_S3_URL=http://localhost:9000 rok4 -f configurations/server.local.json`

Dans le dossier `bruno`, lancer la collection bruno avec `bru run -r --output results.json --format json --bail --env-var "endpoint=http://localhost/data"`

Entre deux lancements de tests, il faut arrêter le sreveur et le redémarrer, pour repartir d'un serveur vide.

## Jeu des tests sur l'image rok4/server

## Exécution des tests

Dans ce dossier : `TAG=<VERSION> docker compose up --abort-on-container-exit`. Le statut de cette commande est alors celui du conteneur de test. 0 si tous les tests se sont bien déroulés, un autre code sinon. Les résultats des tests sont au format JSON dans le dossier `results`.

## Architecture de tests

* Front NGINX
* Middle ROK4 SERVER
* Data MINIO
* Client de test [Bruno](https://www.usebruno.com/)

