CREATE TABLE client (
    id_client SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    telephone VARCHAR(20)
);

INSERT INTO client (nom, telephone) VALUES ('Rabe', '0340000001');
INSERT INTO client (nom, telephone) VALUES ('Rasoa', '0330000002');

ALTER TABLE commande ADD COLUMN id_client INTEGER REFERENCES client(id_client);

UPDATE commande SET id_client = 1 WHERE id_commande = 1;