Utilisateurs et Groupes
===================================

Utilisateurs
------------

### Configuration du site

- Plone -> Configuration du site -> Sécurité -> Activer l'auto-inscription
- Plone -> Configuration du site -> Sécurité -> Laisser les utilisateurs choisir leur mot de passe
- Plone -> Configuration du site -> Sécurité -> Activer les dossiers d'utilisateur

### Ajouter un utilisateur dans Plone


- Plone -> Configuration du site -> Utilisateurs et Groupes -> Utilisateurs -> Ajouter

### Autres sources d'utilisateurs


- LDAP/Active Directory : utiliser le module https://pypi.org/project/pas.plugins.ldap
- Facebook/Google/SSO : utiliser le module https://pypi.org/project/pas.plugins.authomatic

**Remarque** : Plone fonctionne sans problème avec plusieurs sources d'utilisateurs actives en même temps.

Groupes
-------

### Ajouter un groupe dans Plone


- Plone -> Configuration du site -> Utilisateurs et Groupes -> Groupes -> Ajouter un nouveau groupe

### Ajouter un utilisateur dans un groupe


Sélectionner un utilisateur et utiliser l'onglet "Groupes de l'utilisateur" ou
sélectionner un groupe et utiliser l'onglet "Membres du groupe"

**Remarque** : Un groupe peut contenir d'autres groupes.

### Autres sources de groupes

- LDAP/Active Directory : utiliser le module <https://pypi.org/project/pas.plugins.ldap>

**Remarque** : Plone fonctionne sans problème avec plusieurs sources de groupes actives en même temps.