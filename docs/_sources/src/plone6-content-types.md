# Nouveau types de contenu

Dans _Plone 6_ le framework qui permet de créer des nouveaux types de contenus s'appelle _Dexterity_

## Créer un nouveau type de contenu

#### Créer un type nouveau type de contenu TTW (Through The Web)

- <https://training.plone.org/5/ttw/dexterity.html>

#### XML Dexterity Schema référence

- <https://docs.plone.org/external/plone.app.dexterity/docs/reference/dexterity-xml.html>

#### Exemple : Author

    <model xmlns:i18n="http://xml.zope.org/namespaces/i18n" xmlns:marshal="http://namespaces.plone.org/supermodel/marshal" xmlns:form="http://namespaces.plone.org/supermodel/form" xmlns:security="http://namespaces.plone.org/supermodel/security" xmlns:users="http://namespaces.plone.org/supermodel/users" xmlns:lingua="http://namespaces.plone.org/supermodel/lingua" xmlns:indexer="http://namespaces.plone.org/supermodel/indexer" xmlns:easyform="http://namespaces.plone.org/supermodel/easyform" xmlns="http://namespaces.plone.org/supermodel/schema">
      <schema>
        <field name="title" type="zope.schema.TextLine">
          <description/>
          <title>Nom complet</title>
        </field>
        <field name="birthday" type="zope.schema.Date">
          <description/>
          <required>False</required>
          <title>Date de naissance</title>
        </field>
      </schema>
    </model>

#### Exemple : Book

    <model xmlns:i18n="http://xml.zope.org/namespaces/i18n" xmlns:marshal="http://namespaces.plone.org/supermodel/marshal" xmlns:form="http://namespaces.plone.org/supermodel/form" xmlns:security="http://namespaces.plone.org/supermodel/security" xmlns:users="http://namespaces.plone.org/supermodel/users" xmlns:lingua="http://namespaces.plone.org/supermodel/lingua" xmlns:indexer="http://namespaces.plone.org/supermodel/indexer" xmlns:easyform="http://namespaces.plone.org/supermodel/easyform" xmlns="http://namespaces.plone.org/supermodel/schema" i18n:domain="plone">
      <schema>
        <field name="title" type="zope.schema.TextLine">
          <description/>
          <title>Titre du livre</title>
        </field>
        <field name="isbn" type="zope.schema.TextLine" indexer:searchable="true">
          <description/>
          <max_length>13</max_length>
          <min_length>13</min_length>
          <title>ISBN</title>
        </field>
        <field name="category" type="zope.schema.Choice">
          <description/>
          <required>False</required>
          <title>Cat&#233;gorie</title>
          <values>
            <element>Bande dessin&#233;e</element>
            <element>Livre de poche</element>
            <element>Manga</element>
            <element></element>
          </values>
        </field>
        <field name="topics" type="zope.schema.Set">
          <description/>
          <required>False</required>
          <title>Th&#232;mes</title>
          <value_type type="zope.schema.Choice">
            <values>
              <element>Cuisine</element>
              <element>Informatique</element>
              <element>Jardin</element>
              <element>Sport</element>
            </values>
          </value_type>
        </field>
        <field name="pages" type="zope.schema.Int">
          <description/>
          <required>False</required>
          <title>Nombre de pages</title>
        </field>
        <field name="publication_date" type="zope.schema.Date">
          <description/>
          <required>False</required>
          <title>Jour de publication</title>
        </field>
        <field name="price" type="zope.schema.Float" security:write-permission="cmf.ManagePortal">
          <description/>
          <min>0.0</min>
          <required>False</required>
          <title>Prix</title>
        </field>
        <field name="authors" type="z3c.relationfield.schema.RelationList">
          <description/>
          <required>False</required>
          <title>Auteurs</title>
          <value_type type="z3c.relationfield.schema.RelationChoice">
            <title i18n:translate="">Relation Choice</title>
            <portal_type>
              <element>author</element>
            </portal_type>
          </value_type>
        </field>
        <fieldset name="covers" label="Couvertures">
          <field name="image" type="plone.namedfile.field.NamedBlobImage">
            <description/>
            <required>False</required>
            <title>Couverture</title>
          </field>
          <field name="back" type="plone.app.textfield.RichText">
            <description/>
            <required>False</required>
            <title>4&#232;me de couverture</title>
          </field>
        </fieldset>
      </schema>
    </model>

## Limiter l'édition d'un champ de votre contenu aux administrateurs du site

Il n'existe pas encore d'interface graphique pour effectuer cette action. Il faut éditer directement la représentation xml du champ.

**Exemple de modification XML :**

    <field type="zope.schema.TextLine"
        name="my_admin_field"
        security:write-permission="cmf.ManagePortal">
            <title>My admin field</title>
    </field>

## Indexer un champ pour le moteur de recherche

- Installer le produit _collective.dexteritytextindexer_ : <https://pypi.org/project/collective.dexteritytextindexer/>
- Activer la behavior _Full-Text Indexingr_ : http://localhost:8080/Plone/dexterity-types/_MycontentType_/@@behaviors
- Activer la proprité _Searchable_ sur le champ : http://localhost:8080/Plone/dexterity-types/_MycontentType_/_MysearchableField_

**Résultat dans la représentation XML du champ :**

    <field type="zope.schema.TextLine"
        name="my_searchable_field"
        indexer:searchable="true">
            <title>My searchable field</title>
    </field>

## Comment créer une vue personnalisée de notre type de contenu ?

### Web template system

- <https://en.wikipedia.org/wiki/Web_template_system>

#### Zope Page Template (ZPT)

- Introduction : <https://training.plone.org/mastering-plone/zpt.html>
- Référence complète : <https://zope.readthedocs.io/en/latest/zopebook/AppendixC.html>
- Utilisations de base : <https://zope.readthedocs.io/en/latest/zopebook/ZPT.html>
- Utilisations avancées : <https://zope.readthedocs.io/en/latest/zopebook/AdvZPT.html>

#### Créer une _zope page template_ dans votre site Plone

- Plone -> Configuration du site -> Interface de maintenance -> portal_skins -> custom -> Select type to add -> Page template

#### Activer votre nouvelle vue sur votre type de contenu

- ZMI -> portal_types -> _MycontentType_ -> Default view method -> _NameOfMyTemplate_
- ZMI -> portal_types -> _MycontentType_ -> Available view methods -> _NameOfMyTemplate_

#### Utiliser les _slots_ de la _main_template_ de Plone

- <https://github.com/plone/Products.CMFPlone/blob/5.2.x/Products/CMFPlone/browser/templates/main_template.pt>

#### Exemple : Book view

    <metal:macro use-macro="context/main_template/macros/master">

        <metal:css fill-slot="style_slot">
            <style>
                .bookBuy {
                   float: right;
                   text-transform: uppercase;
                   background-color: orange;

                }
                .bookBuy a {
                   color: #FFF !important;
                }
                .bookCover {
                   float: right;
                }
                .bookDescription {
                   display: inline-block;
                   border: 1px solid #666;
                   padding: 10px;
                }
            </style>
        </metal:css>

        <metal:main metal:fill-slot="main">
          <button class="bookBuy"><a tal:define="amazon_url python:'https://www.amazon.fr/dp/' + context.isbn" tal:attributes="href amazon_url" target="_blank">Acheter</a></button>
          <h1 tal:content="context/title">Titre du livre</h1>
          <img class="bookCover" tal:attributes="src python:context.absolute_url() + '/@@images/image/preview'"/>
          <div class="bookAuthors">
              par
            <span tal:repeat="relation context/authors">
                <a tal:condition="not:relation/isBroken"
                    tal:attributes="href relation/to_object/absolute_url"
                    tal:content="relation/to_object/title">
                    Prénom Nom
                </a>
            </span>
          </div>
          <div class="bookDescription">
              <strong>ISBN</strong> : <span tal:replace="context/isbn">1234567890123</span>
              <div tal:condition="context/category">
                  <strong>Catégorie</strong> : <span tal:replace="context/category">category</span>
              </div>
              <div tal:condition="context/topics">
                  <strong>Thèmes</strong> : <span tal:define="topics python:', '.join(context.topics)" tal:replace="topics">un, deux, trois</span>
              </div>
              <div tal:condition="context/pages">
                  <strong>Pages</strong> : <span tal:content="context/pages">42</span>p
              </div>
              <div tal:condition="context/publication_date">
                  <strong>Date de publication</strong> : <span tal:replace="path:context/publication_date">1971/06/27</span>
              </div>
              <div tal:condition="context/price">
                  <strong>Prix</strong> : <span tal:replace="path:context/price">0.0</span>
              </div>
          </div>
          <h2>Quatrième de couverture</h2>
          <div tal:condition="context/back" tal:content="structure context/back/output">Texte du quatrième de couverture</div>
        </metal:main>

    </metal:macro>
