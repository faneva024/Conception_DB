CREATE TABLE mode_paiement (
id_mode SERIAL PRIMARY KEY,
nom VARCHAR(50) NOT NULL
);

INSERT INTO mode_paiement (nom) VALUES ('Espèces');
INSERT INTO mode_paiement (nom) VALUES ('MVola');
INSERT INTO mode_paiement (nom) VALUES ('Orange Money');
INSERT INTO mode_paiement (nom) VALUES ('Airtel Money');

CREATE TABLE paiement (
id_paiement SERIAL PRIMARY KEY,
id_commande INTEGER NOT NULL REFERENCES commande(id_commande),
id_mode INTEGER NOT NULL REFERENCES mode_paiement(id_mode),
montant INTEGER NOT NULL CHECK (montant > 0),
reference VARCHAR(100),
date_paiement TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO paiement (id_commande, id_mode, montant) VALUES (1, 1, 10000);
INSERT INTO paiement (id_commande, id_mode, montant, reference) VALUES (1, 2, 5000, 'MV261016.001');
INSERT INTO paiement (id_commande, id_mode, montant, reference) VALUES (2, 3, 6000, 'OM261016.002');