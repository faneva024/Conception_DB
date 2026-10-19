ALTER TABLE plat ADD COLUMN est_menu BOOLEAN NOT NULL DEFAULT FALSE;

INSERT INTO plat (nom, prix, id_categorie, est_menu)
VALUES ('Menu Romazava', 8000, 1, TRUE);

CREATE TABLE composition_menu (
id_menu INTEGER REFERENCES plat(id_plat),
id_plat INTEGER REFERENCES plat(id_plat),
quantite INTEGER NOT NULL DEFAULT 1 CHECK (quantite > 0),
PRIMARY KEY (id_menu, id_plat),
CHECK (id_menu <> id_plat)
);

INSERT INTO composition_menu (id_menu, id_plat, quantite) VALUES (8, 1, 1);
INSERT INTO composition_menu (id_menu, id_plat, quantite) VALUES (8, 7, 1);
INSERT INTO composition_menu (id_menu, id_plat, quantite) VALUES (8, 6, 1);