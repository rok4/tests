# Tests fonctionnels des outils de génération ROK4

## Compilation de l'image de test

`docker-compose build --build-arg TAG=<VERSION>`

## Exécution des tests

Dans ce dossier : `docker-compose up --abort-on-container-exit`. Le statut de cette commande est alors celui du conteneur de test. 0 si tous les tests se sont bien déroulés, un autre code sinon.

## Architecture de tests

* Conteneur de test (ROK4GENERATION + BATS)

## Contenu des tests

* cache2work
* checkWork
* composeNtiff
* decimtafeNtiff
* manageNodata
* merge4tiff
* mergeNtiff
* overlayNtiff
* pbf2cache
* work2cache