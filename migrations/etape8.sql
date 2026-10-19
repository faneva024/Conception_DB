CREATE TABLE ingredient (
id_ingredient SERIAL PRIMARY KEY,
nom VARCHAR(100) NOT NULL,
unite VARCHAR(20) NOT NULL,
stock_actuel NUMERIC(10,2) NOT NULL DEFAULT 0
);

CREATE TABLE composition_plat (
id_plat INTEGER REFERENCES plat(id_plat),
id_ingredient INTEGER REFERENCES ingredient(id_ingredient),
quantite NUMERIC(10,2) NOT NULL CHECK (quantite > 0),
PRIMARY KEY (id_plat, id_ingredient)
);

INSERT INTO ingredient (nom, unite, stock_actuel) VALUES ('Riz', 'g', 50000);
INSERT INTO ingredient (nom, unite, stock_actuel) VALUES ('Viande de zébu', 'g', 20000);
INSERT INTO ingredient (nom, unite, stock_actuel) VALUES ('Brèdes mafana', 'g', 10000);

INSERT INTO composition_plat (id_plat, id_ingredient, quantite) VALUES (1, 1, 250);
INSERT INTO composition_plat (id_plat, id_ingredient, quantite) VALUES (1, 2, 150);
INSERT INTO composition_plat (id_plat, id_ingredient, quantite) VALUES (1, 3, 100);