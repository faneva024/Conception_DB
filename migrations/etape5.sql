CREATE TABLE serveur (
id_serveur SERIAL PRIMARY KEY,
nom VARCHAR(100) NOT NULL
);

CREATE TABLE table_salle (
id_table SERIAL PRIMARY KEY,
numero INTEGER NOT NULL UNIQUE
);

INSERT INTO serveur (nom) VALUES ('Njaka Rakoto');
INSERT INTO serveur (nom) VALUES ('Lalao Rasoa');

INSERT INTO table_salle (numero) VALUES (1);
INSERT INTO table_salle (numero) VALUES (2);
INSERT INTO table_salle (numero) VALUES (3);
INSERT INTO table_salle (numero) VALUES (4);
INSERT INTO table_salle (numero) VALUES (5);
INSERT INTO table_salle (numero) VALUES (6);
INSERT INTO table_salle (numero) VALUES (7);
INSERT INTO table_salle (numero) VALUES (8);

ALTER TABLE commande ADD COLUMN id_serveur INTEGER;
ALTER TABLE commande ADD COLUMN id_table INTEGER REFERENCES table_salle(id_table);

UPDATE commande SET id_serveur = 1, id_table = 1 WHERE id_commande = 1;
UPDATE commande SET id_serveur = 2 WHERE id_commande = 2;

ALTER TABLE commande ALTER COLUMN id_serveur SET NOT NULL;