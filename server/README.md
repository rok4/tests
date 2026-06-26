# Tests fonctionnels des APIs du serveur ROK4

## Jeu des tests en local

On considère que :

* le logiciel [bruno](https://www.usebruno.com/downloads) est installé
* le serveur rok4 est installé 
* un serveur nginx aiguille les requêtes en `http://localhost/data` vers le port 10000 en retirant le `/data`

```
upstream rok4 { server localhost:10000; }

server {
    listen 80;
    root /var/www;
    server_name localhost;

    access_log /var/log/rok4_access.log;
    error_log /var/log/rok4_error.log;

    location /data {
        rewrite /data/?(.*) /$1 break;
        fastcgi_pass rok4;
        include fastcgi_params;
    }
}
```

Dans ce dossier :

* Lancer le minio de données avec `docker run -d --rm -v $PWD/data/:/backup -p 9000:9000 -p 9001:9001 --name minio rok4/dataset:minio`
* Lancer le serveur : `ROK4_S3_SECRETKEY=rok4S3storage ROK4_S3_KEY=rok4 ROK4_S3_URL=http://localhost:9000 rok4 -f configurations/server.local.json`. Afin de valider l'absence de fuite mémoire, le serveur peut être lancé avec valgrind : `ROK4_S3_SECRETKEY=rok4S3storage ROK4_S3_KEY=rok4 ROK4_S3_URL=http://localhost:9000 valgrind rok4 -f configurations/server.local.json`

Dans le dossier `bruno`, lancer la collection bruno avec `bru run -r --output ../results/local.json --format json --bail --env-var "endpoint=http://localhost/data"`

Entre deux lancements de tests, il faut arrêter le serveur et le redémarrer, pour repartir d'un serveur vide.

## Jeu des tests sur l'image rok4/server

## Exécution des tests

Dans ce dossier : `TAG=<VERSION> docker compose up --abort-on-container-exit`. Le statut de cette commande est alors celui du conteneur de test. 0 si tous les tests se sont bien déroulés, un autre code sinon. Les résultats des tests sont au format JSON dans le dossier `results`.

## Architecture de tests

* Front NGINX
* Middle ROK4 SERVER
* Data MINIO
* Client de test [Bruno](https://www.usebruno.com/)

