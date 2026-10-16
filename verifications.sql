-- etape1
-- Plat du plus cher au moins cher
SELECT * FROM plat ORDER BY prix DESC;

-- etape2
-- Nb plats par categorie avec 
SELECT categorie.id, categorie.nom, COUNT(plat.id_plat) AS nb_plat FROM categorie LEFT JOIN plat ON plat.id_categorie = categorie.id GROUP BY categorie.id ORDER BY nb_plat;

-- etape3
-- Montant total de chaque commande
SELECT
commande.id_commande,
commande.date_commande,
SUM(ligne_commande.quantite * plat.prix) AS montant_total
FROM commande
JOIN ligne_commande ON commande.id_commande = ligne_commande.id_commande
JOIN plat ON ligne_commande.id_plat = plat.id_plat
GROUP BY commande.id_commande, commande.date_commande;