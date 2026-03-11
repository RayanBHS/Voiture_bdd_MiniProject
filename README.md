# Mini Projet de Concession - Système d'Information pour la Vente Automobile

## Contexte du projet
Ce projet vise à concevoir un système d'information pour concessionnaire automobile multimarques de type **ByMyCar**. L'objectif est d'appliquer la méthode **MERISE** pour modéliser et développer une base de données complète permettant de gérer l'ensemble du cycle commercial : véhicules, clients, devis, ventes, financement et reprises.

---

## Prompt utilisé

```Tu travailles dans le domaine de l'automobile. Ton entreprise a comme activité de vendre des voitures. C'est une entreprise comme ByMyCar, ou encore les concessionnaires classiques. Il faut des données sur les voitures vendues, les marques de voitures, les modèles de voiture, les clients. Inspire-toi de la marque suivante : ByMyCar.

Ton entreprise veut appliquer MERISE pour concevoir un système d'information. Tu es chargé de la partie analyse, c'est-à-dire de collecter les besoins auprès de l'entreprise. Elle a fait appel à un étudiant en ingénierie informatique pour réaliser ce projet, tu dois lui fournir les informations nécessaires pour qu'il applique ensuite lui-même les étapes suivantes de conception et développement de la base de données.

D'abord, établis les règles de gestions des données de ton entreprise, sous la forme d'une liste à puce. Elle doit correspondre aux informations que fournit quelqu'un qui connaît le fonctionnement de l'entreprise, mais pas comment se construit un système d'information.

Ensuite, à partir de ces règles, fournis un dictionnaire de données brutes avec les colonnes suivantes, regroupées dans un tableau : signification de la donnée, type, taille en nombre de caractères ou de chiffres. Il doit y avoir entre 25 et 35 données. Il sert à fournir des informations supplémentaires sur chaque donnée (taille et type) mais sans a priori sur comment les données vont être modélisées ensuite.

Fournis donc les règles de gestion et le dictionnaire de données.
```

---

## Règles de gestion métier

Ces règles décrivent le fonctionnement de notre réseau de concessionnaires avec un vocabulaire métier, permettant de tracer l'organisation de l'entreprise et son cycle de vente.

* Notre réseau est composé de plusieurs **concessions** physiques.
* Chaque concession emploie des **commerciaux**. Un commercial ne travaille que pour une seule concession à la fois.
* Au sein de nos équipes de vente, nous avons un système de mentorat : un commercial senior peut superviser plusieurs commerciaux juniors, mais un junior n'a qu'un seul superviseur.
* Nous enregistrons les coordonnées de nos **clients** (prospects ou acheteurs).
* Pour garantir l'exactitude de nos adresses, nous considérons qu'un code postal correspond à une **ville** (et inversement, pour simplifier). Les clients et les concessions sont rattachés à ces villes.
* Notre catalogue est structuré ainsi : nous vendons des **modèles** de voitures (ex: Golf, 208), et chaque modèle appartient à une seule **marque** (ex: Volkswagen, Peugeot).
* Nous gérons un stock de **véhicules** physiques. Un véhicule physique (identifié par son numéro de châssis unique) correspond à un seul modèle précis de notre catalogue.
* Pour alimenter notre site vitrine, nous prenons des **photos** de nos véhicules en stock. Une photo est spécifique à un véhicule physique unique ; elle n'a aucune existence ni aucun sens en dehors de ce véhicule.
* Nos commerciaux font des **offres commerciales**. Une offre relie un client, un commercial et un modèle de voiture spécifique à une date donnée, avec un prix proposé.
* Notre stock de véhicules physiques est totalement centralisé au niveau du réseau. Par conséquent, n'importe quel commercial, quelle que soit sa concession de rattachement, peut proposer ou vendre n'importe quel véhicule disponible dans notre stock global.

---

## Dictionnaire de données brutes

Ce dictionnaire liste les données « brutes » évoquées dans les règles ci-dessus, sans préjuger de la façon dont elles seront regroupées en entités ou clés dans le MCD/MLD MERISE.

| Signification de la donnée | Type | Taille (caractères / chiffres) |
| :--- | :--- | :--- |
| Code de la concession | Alphanumérique | 5 |
| Nom de la concession | Texte | 50 |
| Adresse de la concession (rue) | Texte | 100 |
| Matricule du commercial | Alphanumérique | 10 |
| Nom du commercial | Texte | 50 |
| Prénom du commercial | Texte | 50 |
| Date d'embauche du commercial | Date | 10 |
| Numéro unique du client | Numérique | 8 |
| Nom du client | Texte | 50 |
| Prénom du client | Texte | 50 |
| Numéro de téléphone du client | Alphanumérique | 15 |
| Adresse email du client | Texte | 100 |
| Adresse du client (rue) | Texte | 100 |
| Code postal | Alphanumérique | 5 |
| Nom de la ville | Texte | 50 |
| Identifiant de la marque | Numérique | 4 |
| Nom de la marque | Texte | 50 |
| Pays d'origine de la marque | Texte | 50 |
| Code du modèle de voiture | Alphanumérique | 10 |
| Nom du modèle | Texte | 50 |
| Année de lancement du modèle | Numérique | 4 |
| Type de motorisation (thermique, VE...) | Texte | 20 |
| Numéro de châssis (VIN) du véhicule | Alphanumérique | 17 |
| Couleur extérieure du véhicule | Texte | 30 |
| Kilométrage actuel du véhicule | Numérique | 6 |
| Prix de vente catalogue du véhicule | Numérique | 8 |
| Année de fabrication du véhicule | Numérique | 4 |
| Date de l'offre commerciale | Date | 10 |
| Prix proposé dans l'offre | Numérique | 8 |
| Numéro d'ordre de la photo (1, 2, 3...) | Numérique | 2 |
| Chemin du fichier de la photo | Texte | 255 |

**Total : 31 données**

---
**MCD**
<img width="1400" height="819" alt="image" src="https://github.com/user-attachments/assets/9e421749-19f1-4d00-ab95-f24caa0bc35f" />


---
**MLD**
```sql
VILLE = (Code_postal VARCHAR(10), Nom_de_la_ville VARCHAR(100));
CONCESSION = (Code_concession VARCHAR(20), Nom_concession VARCHAR(100), Adresse_concession VARCHAR(255), #Code_postal);
COMMERCIAL = (Matricule_commercial VARCHAR(20), Nom VARCHAR(50), Prenom VARCHAR(50), Date_embauche DATE, #Matricule_superviseur*, #Code_concession);
CLIENT = (Numero_client VARCHAR(20), Nom VARCHAR(50), Prenom VARCHAR(50), Telephone VARCHAR(20), Email VARCHAR(100), Adresse_rue VARCHAR(255), #Code_postal);
MARQUE = (Identifiant_marque INT, Nom_marque VARCHAR(50), Pays_origine VARCHAR(50));
MODELE = (Code_modele VARCHAR(20), Nom_modele VARCHAR(100), Annee_lancement INT, Type_motorisation VARCHAR(50), #Identifiant_marque);
VEHICULE = (Numero_chassis_VIN VARCHAR(17), Couleur VARCHAR(30), Kilometrage INT, Prix_catalogue DECIMAL(10,2), Annee_fabrication INT, #Code_modele);
PHOTO = (#Numero_chassis_VIN, Numero_ordre_photo INT, Chemin_du_fichier VARCHAR(255));
FAIRE_OFFRE = (#Numero_client, #Matricule_commercial, #Code_modele, Date_offre DATE, Prix_propose DECIMAL(10,2));
```


---
**Prompt pour insertion des données**
```
Donne les requêtes d’insertion permettant de remplir la base de données dont le modèle relationnel est le suivant : 
CREATE TABLE VILLE(
   Code_postal VARCHAR(10),
   Nom_de_la_ville VARCHAR(100) NOT NULL UNIQUE,
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
   -- Si un superviseur part, on ne supprime pas le commercial en dessous, on vide juste la case "superviseur" (SET NULL)
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
   Date_offre DATETIME,
   Prix_propose DECIMAL(10,2) NOT NULL,
   PRIMARY KEY(Numero_client, Matricule_commercial, Code_modele, Date_offre),
   FOREIGN KEY(Numero_client) REFERENCES CLIENT(Numero_client) ON DELETE CASCADE ON UPDATE CASCADE,
   FOREIGN KEY(Matricule_commercial) REFERENCES COMMERCIAL(Matricule_commercial) ON DELETE CASCADE ON UPDATE CASCADE,
   FOREIGN KEY(Code_modele) REFERENCES MODELE(Code_modele) ON DELETE CASCADE ON UPDATE CASCADE
);
Les clés primaires correspondent aux id, sauf si autre chose est précisé (quand c'est un attribut composé) les clés étrangères sont identifiées par les #, et ont le même nom que les clés primaires auxquelles elles font référence.
On veut 51 villes, 26 concessionnaires, 107 Commerciaux, 950 Clients, 30 Marques connus contenant au moins « Porsche », « Mercedes », « Peugeot », « Renault », « Citroen », « BYD », « Bugatti », « Koenigsegg « , « Tata », « Jaguar » et « Lynk&Co », Entre 2 et 8 modèles par marque, 2 pour les moins connues ou celle qui en ont moins, et 8 pour les plus grosses, Génère entre 30 et 50 véhicules par concession, véhicules correspondants aux marques que tu auras généré. Il y a 5 photos par voiture. Il y a entre 1 et 3 offres proposés par client.

Les clés étrangères doivent faire référence aux clés primaires existantes : donne les lignes en commençant par remplir les tables dans lesquelles il n'y a pas de clés étrangères, puis les tables dans lesquelles les clés étrangères font références à des clés primaires des tables déjà remplies. 

Fournis l'ensemble sous la forme d’un script SQL prêt à être exécuté.
```

---
**Scénario d'utilisation**

# Contexte d'Utilisation de la Base de Données "Concession Auto"

## Rôle et Contexte
**Utilisateur cible :** Commercial en concession automobile.

**Scénario d'utilisation :** 
Le commercial utilise la base de données au quotidien pour interagir avec les clients, vérifier les disponibilités de véhicules, proposer des offres et suivre son propre portefeuille client. Lorsqu'un client se présente en concession avec des critères précis (ex. une voiture électrique d'une certaine marque, ou un budget précis), le commercial doit pouvoir interroger rapidement le stock. De plus, il doit suivre les relances à effectuer, analyser ses précédentes offres pour ajuster son argumentaire, et s'assurer de la pertinence de ses propositions par rapport au marché local.

Ses objectifs principaux sont :
1. **Recherche de véhicules en stock** : Vérifier la disponibilité des modèles selon les critères des clients (marque, budget, énergie).
2. **Gestion de la relation client (CRM)** : Retrouver les coordonnées d'un profil client, consulter l'historique de ses offres.
3. **Suivi de performance personnelle** : Voir combien d'offres ont été faites ce mois-ci, ou vérifier celles de son équipe/superviseur pour se situer.

---

## Liste des données à extraire

### 1. Recherches simples pour le client (Projections, sélections, tri, masques)
* Objectif : Répondre rapidement à une demande client en face à face.
* Données nécessaires :
  * Les véhicules disponibles dans un budget précis donné par le client (ex: entre 15k€ et 25k€) triés du moins cher au plus cher.
  * Les clients dont le nom commence par "D" (pour retrouver rapidement une fiche lors d'un appel).
  * Les véhicules d'une couleur spécifique parmi un choix donné (ex: Noir, Blanc ou Gris) en utilisant `IN`.
  * Trouver tous les véhicules qui ont plus de 100 000 km, classés par le plus kilométré.
  * L'adresse d'un client spécifique dont on connaît le numéro de téléphone (utilisant un masque `LIKE`).

### 2. Statistiques et synthèses (Fonctions d'agrégation avec GROUP BY / HAVING)
* Objectif : Avoir une vue d'ensemble du stock et de l'activité.
* Données nécessaires :
  * Le nombre de véhicules en stock pour chaque type de motorisation, avec uniquement ceux ayant plus de 10 véhicules.
  * Le prix moyen, minimum et maximum des véhicules par marque en stock.
  * Le nombre total d'offres faites par ce commercial sur l'année en cours (groupé par année/mois).
  * Les clients ayant reçu plus d'une offre (afin de cesser de les relancer inutilement ou de conclure la vente).
  * Le kilométrage moyen des véhicules en stock, groupé par année de fabrication (uniquement pour les années récentes).

### 3. Fiches complètes et suivis (Jointures)
* Objectif : Obtenir des informations croisées, par exemple lier un client à l'offre et au véhicule proposé.
* Données nécessaires :
  * L'historique complet des offres d'un client (Nom du client, Nom du modèle, Prix proposé, Date).
  * La liste des véhicules en stock avec leur marque, modèle et couleur (Jointure interne 3 tables).
  * La fiche du commercial avec le nom de son superviseur pour les rapports (Auto-jointure externe).
  * Les clients qui habitent dans la même ville que la concession où travaille le commercial.
  * Les modèles du catalogue qui n'ont actuellement aucun véhicule physique en stock (Jointure externe des modèles vers le stock).

### 4. Analyses avancées (Requêtes imbriquées : IN, EXISTS, ANY, ALL)
* Objectif : Répondre à des demandes très spécifiques ou trouver des arguments de vente.
* Données nécessaires :
  * Les véhicules en stock dont le prix est inférieur au prix moyen de tous les véhicules de la même motorisation.
  * Les clients intéressés (qui ont reçu une offre) par des modèles de marque "Renault" ou "Peugeot".
  * Les modèles de véhicules pour lesquels aucun client n'a reçu d'offre récente (utiliser `NOT EXISTS`).
  * Trouver si le commercial a fait une offre qui est plus élevée que **toute** offre faite par son propre superviseur (`> ALL`).
  * Les véhicules (VIN, couleur) dont l'année de fabrication correspond à la plus récente possible de tout le stock.

---
## Auteurs

Rayan BELHOUS

Cyril ROUSSELLE

Mathis GUICHERD-CALLIN
