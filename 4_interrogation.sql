-- 1. Recherches simples

SELECT Numero_client, Nom, Prenom, Telephone, Email
FROM CLIENT
WHERE Nom LIKE 'D%'
ORDER BY Nom ASC, Prenom ASC;

SELECT Numero_chassis_VIN, Couleur, Kilometrage, Prix_catalogue
FROM VEHICULE
WHERE Prix_catalogue BETWEEN 15000 AND 25000
ORDER BY Prix_catalogue ASC;

SELECT Numero_chassis_VIN, Couleur, Annee_fabrication
FROM VEHICULE
WHERE Couleur IN ('Noir', 'Blanc', 'Gris');

SELECT Numero_chassis_VIN, Couleur, Kilometrage, Prix_catalogue
FROM VEHICULE
WHERE Kilometrage > 100000
ORDER BY Kilometrage DESC;

SELECT Nom, Prenom, Adresse_rue, Code_postal
FROM CLIENT
WHERE Telephone LIKE '0624%';

-- 2.Satistiques et synthèses

SELECT Type_motorisation, COUNT(Code_modele) AS Modeles_Disponibles
FROM MODELE
GROUP BY Type_motorisation
HAVING COUNT(Code_modele) > 10;

SELECT Annee_fabrication, 
       ROUND(AVG(Prix_catalogue), 2) AS Prix_Moyen,
       MIN(Prix_catalogue) AS Prix_Mini,
       MAX(Prix_catalogue) AS Prix_Maxi
FROM VEHICULE
GROUP BY Annee_fabrication
HAVING Annee_fabrication >= 2020
ORDER BY Annee_fabrication DESC;

SELECT MONTH(Date_offre) AS Mois_Offre, COUNT(*) AS Nombre_Offres
FROM FAIRE_OFFRE
WHERE Matricule_commercial = 'COM0001'
GROUP BY MONTH(Date_offre)
ORDER BY Mois_Offre;

SELECT Numero_client, COUNT(*) AS Nombre_Propositions_Recues
FROM FAIRE_OFFRE
GROUP BY Numero_client
HAVING COUNT(*) > 1;

SELECT Couleur, 
       ROUND(AVG(Kilometrage), 0) AS Km_Moyen, 
       SUM(Kilometrage) AS Km_Total
FROM VEHICULE
GROUP BY Couleur
HAVING AVG(Kilometrage) > 50000;

-- 3. Fiches complètes et suivis

SELECT c.Nom AS Client, m.Nom_modele AS Vehicule_Propose, o.Prix_propose, o.Date_offre
FROM FAIRE_OFFRE o
JOIN CLIENT c ON o.Numero_client = c.Numero_client
JOIN MODELE m ON o.Code_modele = m.Code_modele
WHERE c.Numero_client = 'CLI00001'
ORDER BY o.Date_offre DESC;

SELECT v.Numero_chassis_VIN, mq.Nom_marque, m.Nom_modele, v.Couleur, v.Prix_catalogue
FROM VEHICULE v
JOIN MODELE m ON v.Code_modele = m.Code_modele
JOIN MARQUE mq ON m.Identifiant_marque = mq.Identifiant_marque;

SELECT c1.Nom AS Mon_Nom, c1.Prenom AS Mon_Prenom, 
       c2.Nom AS Nom_Chef_Des_Ventes
FROM COMMERCIAL c1
LEFT JOIN COMMERCIAL c2 ON c1.Matricule_superviseur = c2.Matricule_commercial
WHERE c1.Matricule_commercial = 'COM0001';

SELECT m.Nom_modele, m.Type_motorisation
FROM MODELE m
LEFT JOIN VEHICULE v ON m.Code_modele = v.Code_modele
WHERE v.Numero_chassis_VIN IS NULL;

SELECT c.Nom, c.Prenom, v.Nom_de_la_ville AS Ville_Residence
FROM CLIENT c
JOIN VILLE v ON c.Code_postal = v.Code_postal
JOIN CONCESSION conc ON v.Code_postal = conc.Code_postal
WHERE conc.Code_concession = 'CONC001';

-- 4.Analyses avancées

SELECT v1.Numero_chassis_VIN, m1.Nom_modele, v1.Prix_catalogue
FROM VEHICULE v1
JOIN MODELE m1 ON v1.Code_modele = m1.Code_modele
WHERE v1.Prix_catalogue < (
    SELECT AVG(v2.Prix_catalogue)
    FROM VEHICULE v2
    JOIN MODELE m2 ON v2.Code_modele = m2.Code_modele
    WHERE m2.Type_motorisation = m1.Type_motorisation
);

SELECT Nom, Prenom, Email
FROM CLIENT
WHERE Numero_client IN (
    SELECT o.Numero_client
    FROM FAIRE_OFFRE o
    JOIN MODELE m ON o.Code_modele = m.Code_modele
    JOIN MARQUE mq ON m.Identifiant_marque = mq.Identifiant_marque
    WHERE mq.Nom_marque IN ('Renault', 'Peugeot')
);

SELECT m.Nom_modele, m.Type_motorisation
FROM MODELE m
WHERE NOT EXISTS (
    SELECT 1 FROM FAIRE_OFFRE o 
    WHERE o.Code_modele = m.Code_modele
);

SELECT Prix_propose, Date_offre
FROM FAIRE_OFFRE
WHERE Matricule_commercial = 'COM0001'
  AND Prix_propose > ALL (
      SELECT Prix_propose 
      FROM FAIRE_OFFRE 
      WHERE Matricule_commercial = 'COM0002'
  );

SELECT Numero_chassis_VIN, Couleur, Annee_fabrication, Prix_catalogue
FROM VEHICULE
WHERE Annee_fabrication >= ALL (
    SELECT Annee_fabrication FROM VEHICULE
);
