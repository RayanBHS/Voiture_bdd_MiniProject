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

## Auteurs

Rayan BELHOUS

Cyril ROUSSELLE

Mathis GUICHERD-CALLIN
