CREATE TABLE VILLE(
   Code_postal VARCHAR(10),
   Nom_de_la_ville VARCHAR(100) NOT NULL,
   PRIMARY KEY(Code_postal)
);

CREATE TABLE CONCESSION(
   Code_concession VARCHAR(20),
   Nom_concession VARCHAR(100) NOT NULL,
   Adresse_concession VARCHAR(255),
   Code_postal VARCHAR(10) NOT NULL,
   PRIMARY KEY(Code_concession),
   FOREIGN KEY(Code_postal) REFERENCES VILLE(Code_postal) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE COMMERCIAL(
   Matricule_commercial VARCHAR(20),
   Nom VARCHAR(50) NOT NULL,
   Prenom VARCHAR(50) NOT NULL,
   Date_embauche DATE,
   Matricule_superviseur VARCHAR(20),
   Code_concession VARCHAR(20) NOT NULL,
   PRIMARY KEY(Matricule_commercial),
   FOREIGN KEY(Matricule_superviseur) REFERENCES COMMERCIAL(Matricule_commercial) ON DELETE SET NULL ON UPDATE CASCADE,
   FOREIGN KEY(Code_concession) REFERENCES CONCESSION(Code_concession) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE CLIENT(
   Numero_client VARCHAR(20),
   Nom VARCHAR(50) NOT NULL,
   Prenom VARCHAR(50) NOT NULL,
   Telephone VARCHAR(20),
   Email VARCHAR(100),
   Adresse_rue VARCHAR(255),
   Code_postal VARCHAR(10) NOT NULL,
   PRIMARY KEY(Numero_client),
   FOREIGN KEY(Code_postal) REFERENCES VILLE(Code_postal) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE MARQUE(
   Identifiant_marque INT,
   Nom_marque VARCHAR(50) NOT NULL,
   Pays_origine VARCHAR(50),
   PRIMARY KEY(Identifiant_marque)
);

CREATE TABLE MODELE(
   Code_modele VARCHAR(20),
   Nom_modele VARCHAR(100) NOT NULL,
   Annee_lancement INT,
   Type_motorisation VARCHAR(50),
   Identifiant_marque INT NOT NULL,
   PRIMARY KEY(Code_modele),
   FOREIGN KEY(Identifiant_marque) REFERENCES MARQUE(Identifiant_marque) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE VEHICULE(
   Numero_chassis_VIN VARCHAR(17),
   Couleur VARCHAR(30),
   Kilometrage INT,
   Prix_catalogue DECIMAL(10,2),
   Annee_fabrication INT,
   Code_modele VARCHAR(20) NOT NULL,
   PRIMARY KEY(Numero_chassis_VIN),
   FOREIGN KEY(Code_modele) REFERENCES MODELE(Code_modele) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE PHOTO(
   Numero_chassis_VIN VARCHAR(17),
   Numero_ordre_photo INT,
   Chemin_du_fichier VARCHAR(255) NOT NULL,
   PRIMARY KEY(Numero_ordre_photo, Numero_chassis_VIN),
   FOREIGN KEY(Numero_chassis_VIN) REFERENCES VEHICULE(Numero_chassis_VIN) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE FAIRE_OFFRE(
   Numero_client VARCHAR(20),
   Matricule_commercial VARCHAR(20),
   Code_modele VARCHAR(20),
   Date_offre DATE,
   Prix_propose DECIMAL(10,2) NOT NULL,
   PRIMARY KEY(Numero_client, Matricule_commercial, Code_modele),
   FOREIGN KEY(Numero_client) REFERENCES CLIENT(Numero_client) ON DELETE CASCADE ON UPDATE CASCADE,
   FOREIGN KEY(Matricule_commercial) REFERENCES COMMERCIAL(Matricule_commercial) ON DELETE CASCADE ON UPDATE CASCADE,
   FOREIGN KEY(Code_modele) REFERENCES MODELE(Code_modele) ON DELETE CASCADE ON UPDATE CASCADE
);