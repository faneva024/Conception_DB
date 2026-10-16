-- etape1
-- Plat du plus cher au moins cher
SELECT * FROM plat ORDER BY prix DESC;

-- etape2
-- Nb plats par categorie avec 
SELECT categorie.id, categorie.nom, COUNT(plat.id_plat) AS nb_plat FROM categorie LEFT JOIN plat ON plat.id_categorie = categorie.id GROUP BY categorie.id ORDER BY nb_plat;