## NIVEAU 1
### Etape 1
#### Tables:
(nouveau) plat(**id_plat**, nom, prix) 

#### Reponses:
On choisi le type INTEGER pour le prix car les montants sont en ariary, sans centimes. On choisi "id" comme identifiant PRIMARY KEY pour pouvoir differencier les plats.

### Etape 2
#### Tables
(nouveau) categorie(**id**, nom)
(modifie) plat(**id_plat**, nom, prix, #id_categorie)

#### Reponses:
Une colonne categorie VARCHAR(50) dans la table PLAT entraînerait des redondances de données et des risques d'anomalies de saisie (ex: saisir "Plat malagasy" sur un plat et "Plats malagasy" sur un autre, rendant les regroupements erronés). De plus, elle empêche d'exister à une catégorie qui ne possède encore aucun plat.