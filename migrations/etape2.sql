CREATE TABLE categorie(
    id SERIAL PRIMARY KEY,
    nom VARCHAR(50) NOT NULL
);

INSERT INTO categorie(nom) VALUES('Plats malagasy');
INSERT INTO categorie(nom) VALUES('Plats chinois');
INSERT INTO categorie(nom) VALUES('Soupes');
INSERT INTO categorie(nom) VALUES('Desserts');
INSERT INTO categorie(nom) VALUES('Boissons');

ALTER TABLE plat ADD COLUMN id_categorie INTEGER REFERENCES categorie(id);

UPDATE plat SET id_categorie=1 WHERE id_plat=1;
UPDATE plat SET id_categorie=1 WHERE id_plat=2;
UPDATE plat SET id_categorie=1 WHERE id_plat=3;
UPDATE plat SET id_categorie=2 WHERE id_plat=4;
UPDATE plat SET id_categorie=3 WHERE id_plat=5;
UPDATE plat SET id_categorie=4 WHERE id_plat=6;
UPDATE plat SET id_categorie=5 WHERE id_plat=7;

ALTER TABLE plat ALTER COLUMN id_categorie SET NOT NULL;  