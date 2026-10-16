## NIVEAU 1
### Etape 1
#### Tables:
(nouveau) plat(id_plat, nom, prix) 

#### Reponses:
On choisi le type INTEGER pour le prix car les montants sont en ariary, sans centimes. On choisi "id" comme identifiant PRIMARY KEY pour pouvoir differencier les plats.

### Etape 2
#### Tables
(nouveau) categorie(id, nom)
(modifie) plat(id_plat, nom, prix, #id_categorie)

#### Reponses:
Une colonne categorie VARCHAR(50) dans la table PLAT pourrait provoquer des probleme dans le saisie des donnees. (ex: saisir "Plat malagasy" sur un plat et "Plats malagasy" sur un autre, rendant les regroupements erronés). 

### Etapes 3
#### Tables
(nouveau) commande(id_commande, date_commande)
(nouveau) ligne_commande(#id_commande, #id_plat, quantite)  

#### Reponses:
La quantité se place dans la table d'association ligne_commande car elle dépend à la fois de la commande et du plat commandé . 