# Créer un projet Plone

La recommandation de la communauté Plone pour créer un produit Plone est d'utiliser _plonecli_ (https://pypi.org/project/plonecli/). Le code généré par _plonecli_ peut cependant effrayer un intégrateur Plone débutant qui cherche juste à créer un petit projet Plone. Voici ci-dessous le code minimal nécessaire à la création d'un projet Plone 6 Classic avec buildout.

## Projet Plone avec buildout

Créer la structure suivante pour votre projet _achmed_

    achmed
    ├── Makefile
    └── buildout.cfg

avec le fichier _Makefile_ :

    .PHONY: help  # List phony targets
    help:
        @cat "Makefile" | grep '^.PHONY:' | sed -e "s/^.PHONY:/- make/"

    .PHONY: install   Install environment
    install: ./bin/pip
        ./bin/pip install -r https://dist.plone.org/release/6.0.2/requirements.txt
        ./bin/buildout -c buildout.cfg

    .PHONY: start  # Start instance in fg mode
    start:
        ./bin/instance fg

    .PHONY: clean  # Clean environment
    clean:
        rm -rf bin develop-eggs include lib parts pyvenv.cfg

    ./bin/pip:
        python3.11 -mvenv .

et le fichier _buildout.cfg_ :

    [buildout]
    extends = https://dist.plone.org/release/6.0.2/versions.cfg
    show-picked-versions = true
    parts =
        instance

    [instance]
    recipe = plone.recipe.zope2instance
    user = admin:admin
    http-address = 8080
    eggs =
        Plone

Pour installer et démarrer votre instance il suffit de lancer les commandes suivantes (si les dépendances de Plone sont installées sur votre machine) :

```shell
make install
make start
```

Votre instance Zope est accessible à l'adresse http://localhost:8080

## Egg Python pour add-on Plone

## Profiles pour l'installation du add-on
