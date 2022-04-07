# Tests fonctionnels des génération complètes (PREGENERATION + GENERATION)

## Compilation des images de test

`docker-compose build --build-arg TAG=<VERSION>`


## Architecture de tests

* Serveur PostgreSQL / PostGIS
* 1 conteneur de test `pregeneration` (PREGENERATION + BATS)
* 1 conteneur de test `generation` (GENERATION + BATS)

## Contenu des tests

* Outil BE4
  * BDPARCELLAIRE : reprojection LAMB93 -> 4326, conversion 1 bit -> 1 canal 8 bits, compression PNG
  * RGEALTI : utilisation d'un TMS "MNT", compression ZIP
  * MONTAGNE : application d'un style de pente sur des données MNT, reprojection LAMB93 -> Web Mercator, compression PNG
  * SCAN1000 : ajout d'un canal alpha, reprojection LAMB93 -> Web Mercator, compression PNG
* Outil 4ALAMO
  * LIMADM : reprojection UTM20N -> Web Mercator, 2 compositions


## Exécution des tests

Pour lancer les tests : `docker-compose up --abort-on-container-exit`

Le statut de la commande est alors celui du conteneur de test. 0 si tous les tests se sont bien déroulés, un autre code sinon.

## Nettoyage

```
docker-compose down
docker volume rm pregeneration-generation_common pregeneration-generation_scripts pregeneration-generation_pyramids
```