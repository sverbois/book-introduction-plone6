Permissions et Rôles
==============================

Documentation en ligne
----------------------

- <https://docs.plone.org/develop/plone/security/standard_permissions.html>

Permissions
-----------

ZMI -> security 

### Permissions sur le site

- http://localhost:8080/Plone/manage_access

##### Add portal member


- droit d'ajouter un nouveau membre à un site Plone
- Plone -> Configuration du site -> Securité -> Activer l'auto-inscription
- ZMI -> security -> Add portal member

##### Review portal content

- droit de publier un contenu

### Permissions sur un objet


- http://localhost:8080/Plone/*MyContent*/manage_access

##### View et Access contents information

- droit d'accéder et de voir l'objet
- donne accès à l'onglet *Voir*

##### Modify portal content

- droit de modifier l'objet
- donne accès à l'onglet *Modifier*

##### List folder contents

- droit de lister un dossier
- donne accès à l'onglet *Contenus*

##### Sharing page: Delegate roles

- droit de partager un objet
- donne accès à l'onglet *Partage*
- fonctionne en collaboration avec les autres permissions *Sharing page: Delegate ...*

##### Plone Site Setup

- permet d'accéder au différents panneaux de configuration (control panel)
- *Plone Site Setup: Users and Groups* : permet d'accéder à la configuration des utilisateurs et groupes
- *Plone Site Setup: Themes* : permet d'accéder à la gestion des thèmes

Rôles
-----

Rôle = ensemble de permissions

ZMI -> security

### Rôles créés par Zope

- Anonymous (Zope) : ce rôle est donné à toutes les requêtes (anonymes ou authentifiées)
- Authenticated (Zope) ce rôle est donné aux requêtes authentifiées
- Owner (Zope) : ce rôle est donné au créateur d'un contenu
- Manager (Zope) : root

### Rôles créés par Plone   

- Member (Plone) : ce rôle est donné à tous les utilisateurs ajoutés au site Plone
- Contributor (Plone) : les utilisateurs qui ont ce rôle peuvent ajouter du contenu
- Reviewer (Plone) : les utilisateurs qui ont ce rôle peuvent  modérer le contenu
- Reader (Plone) : les utilisateurs qui ont ce rôle peuvent  voir le contenu
- Editor (Plone)  : les utilisateurs qui ont ce rôle peuvent  modifier le contenu
- Site Administrator (Plone) : les utilisateurs qui ont ce rôle peuvent administrer le site Plone

### Rôle attribué globalement

##### Interface Plone


Utilisateur :
    Plone -> Configuration du site -> Utilisateurs et Groupes -> Utilisateurs -> Recherche d'un utilisateur -> Rôles

Groupe :
    Plone -> Configuration du site -> Utilisateurs et Groupes -> Groupes -> Rôles

- Contributeur (Contributor)
- Rédacteur (Editor)
- Membre (Member)
- Lecteur (Reader)
- Modérateur (Reviewer)
- Administrateur du site (Site Administrator)
- Administrateur (Manager)

Lorsqu'un rôle global est donné à un utilisateur ou un groupe, il est valable pour tout le site et ne peut pas être désactivé pour une sous-partie de celui-ci.

##### Interface ZMI

- ZMI -> acl_users -> portal_role_manager (ou http://localhost:8080/Plone/acl_users/portal_role_manager/manage_roles)

### Rôle attribué localement

##### Interface Plone

Contenu/Conteneur -> Partage ou http://localhost:8080/Plone/\<my-content\>/sharing

- Peut ajouter == Contributeur (Contributor) local
- Peut modifier == Rédacteur (Editor) local
- Peut voir == Lecteur (Reader) local
- Peut modérer == Modérateur (Reviewer) local

##### Interface ZMI

- ZMI -> <my-content> -> Security -> local roles (ou http://localhost:8080/Plone/\<my-content\>/manage_listLocalRoles)

**Remarque** : Il est possible de créer des rôles locaux dynamiques <https://docs.plone.org/develop/plone/security/dynamic_roles.html>

### Rôle hérité

##### Interface Plone

Contenu/Conteneur -> Partage

- Un rôle donné à un utilisateur/groupe sur un conteneur est par défaut hérité par ses contenus.
- Un rôle local sur un conteneur peut être désactivé sur un contenu de celui-ci.
- Un rôle global ne peut pas être désactivé !!!

##### Interface ZMI

- pas visible dans la ZMI

### Exercice

**Ajouter un rôle "Role administrator"**

- ZMI -> Security -> User defined roles <Role administrator> -> Add Role

**Configurer les permissions de gestion des "Rôles locaux"**

- ZMI -> Security -> Sharing page: Delegate roles
- ZMI -> Security -> Sharing page: Delegate Contributor role
- ZMI -> Security -> Sharing page: Delegate Editor role
- ZMI -> Security -> Sharing page: Delegate Reader role
- ZMI -> Security -> Sharing page: Delegate Reviewer role

**Tester votre nouveau rôle dans votre site**

- L'utilisateur doit être *Reader* pour accéder aux contenus privées.
- L'utilisateur doit être *Editor* pour modifier les droits sur le contenu.
