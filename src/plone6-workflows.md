Workflows
===================

- Plone utilise les workflows pour changer des permissions sur un objet.
- workflow = permissions + états + transitions

Documentation en ligne
----------------------

- **Introduction** : <https://docs.plone.org/working-with-content/collaboration-and-workflow>
- **Avancé** : <https://training.plone.org/5/workflow/index.html>

Analyse des Workflows existants
-------------------------------

### Interface Plone


- Plone -> Configuration du site -> Types
- un workflow par défaut (Défaut)
- un workflow par type de contenu
- **à utiliser** pour les changements de workflow

### Interface ZMI

- ZMI -> portal_workflows -> Workflows
- **ne pas utiliser ZMI pour changer de workflow** car un changement de workflow dans la ZMI met tous les objets dans l'état initial du nouveau workflow
- ZMI -> portal_workflows -> Contents

### Workflows existants

-  *comment_one_state_workflow* et *comment_review_workflow* sont des workflows utilisés pour les commentaires
- *folder_workflow* et *plone_workflow* sont encore présents pour des raisons historiques
- *intranet_workflow*" et *intranet_folder_workflow* ne sont pas très bien pensés mais peuvent servir de base pour un site avec intranet
- *simple_publication_workflow* est un bon workflow de base avec modération
- *one_state_workflow* est un workflow à état unique pratique pour "oublier" la notion de workflow dans Plone

**Conclusion** : la réalisation d'un workflow personnalisé est presque toujours indispensable dans vos sites Plone

### Permissions modifiées par le workflow

- ZMI -> portal_workflows -> Workflows -> Contents -> <my-workflow> -> Permissions
- Voir le contenu : Access contents information + View
- Modifier le contenu : Modify portal content

### Etats du workflow

- ZMI -> portal_workflows -> Workflows -> Contents -> <my-workflow> -> States
- l'étoile indique l'état initial
-  ZMI -> portal_workflows -> Workflows -> Contents -> <my-workflow> -> States -> <my-state> -> Permissions

### Transitions du workflow

- ZMI -> portal_workflows -> Workflows -> Contents -> <my-workflow> -> Transitions
- caractérisée par un état d'arrivée (pas de début) et protégée par une permission d'utilisation

Modifier un workflow
--------------------

- ne pas modifier les workflows fournis avec Plone (plutôt en faire une copie)
- *Update security settings* après modification d'un workflow pour mettre à jour les objets

Ajouter un workflow
-------------------

### Démarche

- ZMI -> portal_workflows -> Workflows -> Contents
- copier/coller le workflow le plus proche et le personnaliser

    1. Permissions
    2. States
    3. Transitions
    
- activer le nouveau workflow dans l'interface Plone (Plone -> Configuration du site -> Types)

### Exemple 1

#### Objectif

Les contenus sont soit publics, soit visibles par les membres, soit en cours de rédaction.

Des dossiers qui ne contiennent que des contenus internes doivent pouvoir être cachés pour les visiteurs anonymes.

#### Réalisation

Utiliser *simple_publication_workflow* comme base pour réaliser *eicvn_workflow*

**états**

- private : "View" et "Access contents information" uniquement pour "Contributor", "Editor", "Manager", "Owner"
- internal : "View" et "Access contents information" = état "private" + "Member"
- public : "View" et ""Access contents information" = état "private" + "Anonymous"

**transitions**

- make_internal
- make_private
- make_public

#### Membres avec cotisation

Comment faire si seul les utilisateurs qui ont payé leur cotisation peuvent avoir accès au contenu interne ?

-> il suffit de désactiver le rôle global "Membre" de l'utilisateur

### Exemple 2

La visibilité des contenus (pages, fichiers, images) est gérée par la visibilité des dossiers.

#### Réalisation

- Affecter *eicvn_workflow* au type de contenu *Folder*
- N'affecter aucun workflow aux contenus (pages, fichiers, images). Ils hériteront des droits du dossier parent.

### Ajustement

Une fois le workflow en production, si vous modifier les permissions d'un état,
il faut utiliser la fonction "Update security settings" de ZMI -> portal_workflows.

Workflows, Groupes et Rôles locaux
----------------------------------

- un workflow peut contrôler l'affectation d'un rôle local à un groupe 
- voir onglet "Groups" dans configuration du workflow et onglet "Groups" dans configuration de l'état
- il ne faut plus contrôler le rôle local géré par le workflow avec l'onglet "Partage" de l'objet

### Exemple

Intranet avec 3 groupes : membres, comité exécutif, direction

1. Créer les groupes "Membres", "Comité", "Direction" dans Plone
2. ZMI -> portal_workflows -> Workflows -> Contents -> <my-workflow> -> Groups

    - Add a managed group : "Membres", "Comité", "Direction"
    - Roles Mapped to Groups : "Reader"
    
3. ZMI -> portal_workflows -> Workflows -> Contents -> <my-workflow> -> States

    - private
    - internal_members
    - internal_committee
    - internal_direction
    
4. Configurer l'onglet "Permissions" et "Groups" pour chacun des états

    - l'onglet permission est identique pour les 3 états : internal_members, internal_committee, internal_direction
    - "Direction" a le rôle "Reader" dans l'état "internal_direction"
    - "Direction" et "Comité" ont le rôle "Reader" dans l'état "internal_committee"
    - "Direction", "Comité" et "Membres" ont le rôle "Reader" dans l'état "internal_members"
    
5. Ajouter les transitions

    - make_private
    - make_internal_members
    - make_internal_committee
    - make_internal_direction


Affecter localement des workflows différents
--------------------------------------------

- Utiliser le produit *Support des politiques documentaires locales (CMFPlacefulWorkflow)*
- Plone -> Configuration du site -> Modules -> Support des politiques documentaires locales -> Installer
