CREATE TABLE commande (
    id_commande SERIAL PRIMARY KEY,
    date_commande TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE ligne_commande (
    id_commande INTEGER REFERENCES commande(id_commande),
    id_plat INTEGER REFERENCES plat(id_plat),
    quantite INTEGER NOT NULL CHECK (quantite > 0),
    PRIMARY KEY (id_commande, id_plat)
);

INSERT INTO commande (date_commande) VALUES (CURRENT_TIMESTAMP);
INSERT INTO commande (date_commande) VALUES (CURRENT_TIMESTAMP);

INSERT INTO ligne_commande (id_commande, id_plat, quantite) VALUES (1, 1, 2);
INSERT INTO ligne_commande (id_commande, id_plat, quantite) VALUES (1, 7, 2);
INSERT INTO ligne_commande (id_commande, id_plat, quantite) VALUES (2, 4, 1);