# Créer un projet Plone

La recommandation de la communauté Plone pour créer un produit Plone est d'utiliser _plonecli_ (https://pypi.org/project/plonecli/). Le code généré par _plonecli_ peut cependant effrayer un intégrateur Plone débutant qui cherche juste à créer un petit projet Plone. Voici ci-dessous le code minimal nécessaire à la création d'un projet Plone 6 Classic avec buildout.

## Projet Plone avec buildout

Créer la structure suivante pour votre projet _achmed_

    achmed
    ├── buildout.cfg
    └── Makefile

avec le fichier _Makefile_ :

    .PHONY: help  # List phony targets
    help:
        @cat "Makefile" | grep '^.PHONY:' | sed -e "s/^.PHONY:/- make/"

    .PHONY: install  # Install environment
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

Ajouter le fichier _setup.py_ :

    from setuptools import find_packages
    from setuptools import setup

    setup(
        name="achmed",
        packages=find_packages("src"),
        package_dir={"": "src"},
        install_requires=[
            "Products.CMFPlone",
        ],
        entry_points="""
            [plone.autoinclude.plugin]
            target = plone
        """,
    )

modifié le buildout.cfg en ajoutant la ligne _develop = ._ dans la section _buildout_ et _achmed_ dans la section _eggs_.

    [buildout]
    extends = https://dist.plone.org/release/6.0.2/versions.cfg
    show-picked-versions = true
    develop = .
    parts =
        instance

    [instance]
    recipe = plone.recipe.zope2instance
    user = admin:admin
    http-address = 8080
    eggs =
        Plone
        achmed

et créer un fichier _\_\_init\_\_.py_ vide dans le sous-dossier _src/achmed_.

    achmed
    ├── buildout.cfg
    ├── Makefile
    ├── setup.py
    └── src
        └── achmed
            └── __init__.py

Terminer par exécuter la commande _./bin/builout_ pour enregistrer votre nouveau egg _achmed_ dans le path de l'instance.
Votre produit est maintenant reconnu par Python. Il faut encore le rendre visible par Plone.

## Profiles pour l'installation du add-on
