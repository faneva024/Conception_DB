## NIVEAU 1
### Etape 1
#### Tables:
(nouveau) plat(id_plat, nom, prix) 

#### Reponses:
On choisi le type INTEGER pour le prix car les montants sont en ariary, sans centimes. On choisi "id_plat" comme identifiant PRIMARY KEY pour pouvoir differencier les plats.

### Etape 2
#### Tables
(nouveau) categorie(id_categorie, nom)
(modifie) plat(id_plat, nom, prix, #id_categorie)

#### Reponses:
Une colonne categorie VARCHAR(50) dans la table plat pourrait provoquer des probleme dans le saisie des donnees. (ex: saisir "Plat malagasy" sur un plat et "Plats malagasy" sur un autre, rendant les regroupements erronés). 

### Etapes 3
#### Tables
(nouveau) commande(id_commande, date_commande)
(nouveau) ligne_commande(#id_commande, #id_plat, quantite)  

#### Reponses:
La quantité se place dans la table d'association ligne_commande car elle dépend à la fois de la commande et du plat commandé . 

### Etape 4
#### Tables:
(nouveau) client(id_client, nom, telephone?)
(modifie) commande(id_commande, date_commande,#id_client?)   

#### Reponses:
La clé étrangère id_client doit être facultative Donc  peut etre NULL car la plupart des clients sont de passage et ne sont pas enregistrés dans la base. Il faut utiliser une jointure LEFT JOIN pour ne perdre aucune commande sans client attribué.

### Etape 5
#### Tables:
(nouveau) serveur(id_serveur, nom)
(nouveau) table_salle(id_table, numero)
(modifie) commande(id_commande, date_commande, #id_client?, #id_serveur, #id_table?)   

#### Reponses:
Une table de salle est un meuble physique alors qu'une commande est un événement temporaire d'un service. Le nom table pose problème en SQL car c'est un mot-clé réservé dans SQL.

### Etape 6
#### Tables:
(nouveau) mode_paiement(id_mode, nom)
(nouveau) paiement(id_paiement, #id_commande, #id_mode, montant, reference?, date_paiement)   

#### Reponses:
Une colonne montant_paye ne suffit pas car un client peut payer en plusieurs fois ou combiner plusieurs modes de paiement avec leurs références respectives. Utiliser une table de référence permet de modifier facilement la liste des modes acceptés sans changer le schéma, contrairement à une contrainte CHECK qui impose de modifier la structure de la base.  