# Tests fonctionnels des outils de génération ROK4

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

## Jeu des tests en local

On considère que les exécutables du dépôt `generation` sont installés et accessibles.

* Se mettre dans le dossier `suite`
* Installer l'utilitaire `bats` (une seule fois)

```bash
git clone https://github.com/bats-core/bats-core.git bats
mkdir test_helper
git clone https://github.com/bats-core/bats-support.git test_helper/bats-support
git clone https://github.com/bats-core/bats-assert.git test_helper/bats-assert
git clone https://github.com/bats-core/bats-file.git test_helper/bats-file
```

* Lancer la commande `./bats/bin/bats -T --print-output-on-failure .`

## Jeu des tests sur l'image rok4/generation

### Compilation de l'image de test

Exemple pour la version 5.0.0 : `docker build --build-arg TAG=5.0.0 -t rok4/generation-tests .`

### Exécution des tests

Dans ce dossier : `docker compose up --abort-on-container-exit`. Le statut de cette commande est alors celui du conteneur de test. 0 si tous les tests se sont bien déroulés, un autre code sinon.

### Architecture de tests

* Conteneur de test (ROK4GENERATION + BATS)