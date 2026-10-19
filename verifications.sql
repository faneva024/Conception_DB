-- etape1
-- Plat du plus cher au moins cher
SELECT * FROM plat ORDER BY prix DESC;

-- etape2
-- Nb plats par categorie avec 
SELECT categorie.id_categorie, categorie.nom, COUNT(plat.id_plat) AS nb_plat 
FROM categorie LEFT JOIN plat ON plat.id_categorie = categorie.id_categorie 
GROUP BY categorie.id_categorie, categorie.nom ORDER BY nb_plat;

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

-- etape4
-- Liste des commandes avec le nom du client (ou 'client de passage')
SELECT
commande.id_commande,
commande.date_commande,
COALESCE(client.nom, 'client de passage') AS client
FROM commande
LEFT JOIN client ON commande.id_client = client.id_client;

-- etape5
-- Nombre de commandes et chiffre d'affaires par serveur
SELECT
serveur.id_serveur,
serveur.nom,
COUNT(DISTINCT commande.id_commande) AS nb_commandes,
COALESCE(SUM(ligne_commande.quantite * plat.prix), 0) AS chiffre_affaires
FROM serveur
LEFT JOIN commande ON serveur.id_serveur = commande.id_serveur
LEFT JOIN ligne_commande ON commande.id_commande = ligne_commande.id_commande
LEFT JOIN plat ON ligne_commande.id_plat = plat.id_plat
GROUP BY serveur.id_serveur, serveur.nom;

-- etape6
-- Liste des commandes non soldées avec montant dû, montant payé et reste à payer
SELECT
c.id_commande,
COALESCE(SUM(lc.quantite * lc.prix_unitaire), 0) AS montant_du,
COALESCE(p.total_paye, 0) AS montant_paye,
(COALESCE(SUM(lc.quantite * lc.prix_unitaire), 0) - COALESCE(p.total_paye, 0)) AS reste_a_payer
FROM commande c
JOIN ligne_commande lc ON c.id_commande = lc.id_commande
LEFT JOIN (
SELECT id_commande, SUM(montant) AS total_paye
FROM paiement
GROUP BY id_commande
) p ON c.id_commande = p.id_commande
GROUP BY c.id_commande, p.total_paye
HAVING COALESCE(SUM(lc.quantite * lc.prix_unitaire), 0) > COALESCE(p.total_paye, 0);

-- etape7
-- Vérification que le montant d'une commande ne change plus malgré l'augmentation du prix du plat
SELECT
c.id_commande,
SUM(lc.quantite * lc.prix_unitaire) AS montant_total_historique
FROM commande c
JOIN ligne_commande lc ON c.id_commande = lc.id_commande
GROUP BY c.id_commande;

-- etape8
-- Consommation théorique de chaque ingrédient
SELECT
i.nom AS ingredient,
SUM(lc.quantite * cp.quantite) AS quantite_totale_consommee,
i.unite
FROM commande c
JOIN ligne_commande lc ON c.id_commande = lc.id_commande
JOIN composition_plat cp ON lc.id_plat = cp.id_plat
JOIN ingredient i ON cp.id_ingredient = i.id_ingredient
GROUP BY i.id_ingredient, i.nom, i.unite;