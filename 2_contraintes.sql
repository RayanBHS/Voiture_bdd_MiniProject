ALTER TABLE ville
ADD CONSTRAINT chk_code_postal CHECK (Code_postal < 96000);

ALTER TABLE modele
ADD CONSTRAINT chk_annee_lancement CHECK (Annee_lancement >= 1886);

ALTER TABLE vehicule
ADD CONSTRAINT chk_kilometrage CHECK (Kilometrage >= 0),
ADD CONSTRAINT chk_prix_catalogue CHECK (Prix_catalogue >= 0),
ADD CONSTRAINT chk_anne_fabrication CHECK (Annee_fabrication >= 1886);

ALTER TABLE faire_offre
ADD CONSTRAINT chk_prix_propose CHECK (Prix_propose >= 0);

ALTER TABLE CLIENT
ADD CONSTRAINT chk_email_format CHECK (Email LIKE '_%@_%._%');

