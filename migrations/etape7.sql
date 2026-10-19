ALTER TABLE ligne_commande ADD COLUMN prix_unitaire INTEGER;

UPDATE ligne_commande
SET prix_unitaire = plat.prix
FROM plat
WHERE ligne_commande.id_plat = plat.id_plat;

ALTER TABLE ligne_commande ALTER COLUMN prix_unitaire SET NOT NULL;

CREATE TABLE historique_prix (
id_historique SERIAL PRIMARY KEY,
id_plat INTEGER NOT NULL REFERENCES plat(id_plat),
prix INTEGER NOT NULL,
date_debut TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO historique_prix (id_plat, prix)
SELECT id_plat, prix FROM plat;

UPDATE plat SET prix = 7500 WHERE id_plat = 1;

INSERT INTO historique_prix (id_plat, prix) VALUES (1, 7500);