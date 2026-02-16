# Projet MERISE - Système d'Information pour la Vente Automobile

## Contexte du projet

Ce projet vise à concevoir un système d'information pour une entreprise de distribution automobile multimarques de type **ByMyCar**. L'objectif est d'appliquer la méthode **MERISE** pour modéliser et développer une base de données complète permettant de gérer l'ensemble du cycle commercial : véhicules, clients, devis, ventes, financement et reprises.

---

## Prompt utilisé

```
Tu travailles dans le domaine de l'automobile. Ton entreprise a comme activité de vendre des voitures. C'est une entreprise comme ByMyCar, ou encore les concessionnaires classiques. Il faut des données sur les voitures vendues, les marques de voitures, les modèles de voiture, les clients. Inspire-toi de la marque suivante : ByMyCar.

Ton entreprise veut appliquer MERISE pour concevoir un système d'information. Tu es chargé de la partie analyse, c'est-à-dire de collecter les besoins auprès de l'entreprise. Elle a fait appel à un étudiant en ingénierie informatique pour réaliser ce projet, tu dois lui fournir les informations nécessaires pour qu'il applique ensuite lui-même les étapes suivantes de conception et développement de la base de données.

D'abord, établis les règles de gestions des données de ton entreprise, sous la forme d'une liste à puce. Elle doit correspondre aux informations que fournit quelqu'un qui connaît le fonctionnement de l'entreprise, mais pas comment se construit un système d'information.

Ensuite, à partir de ces règles, fournis un dictionnaire de données brutes avec les colonnes suivantes, regroupées dans un tableau : signification de la donnée, type, taille en nombre de caractères ou de chiffres. Il doit y avoir entre 25 et 35 données. Il sert à fournir des informations supplémentaires sur chaque donnée (taille et type) mais sans a priori sur comment les données vont être modélisées ensuite.

Fournis donc les règles de gestion et le dictionnaire de données.
```

---

## Règles de gestion métier

L'entreprise vend des véhicules neufs, d'occasion et de démonstration pour le compte de plusieurs marques constructeurs. Elle souhaite tracer tout le cycle commercial : mise en stock, devis, commande, livraison, financement, reprise éventuelle et suivi client.

- L'entreprise distribue plusieurs marques de véhicules, chaque véhicule est toujours rattaché à une unique marque (Peugeot, Renault, Volkswagen, BMW, etc.).
- Chaque véhicule proposé à la vente est décrit par sa marque, son modèle, sa version/finition, son type de carburant, sa boîte de vitesses, sa puissance, son kilométrage, sa couleur et son type (citadine, SUV, utilitaire, etc.).
- L'entreprise gère des véhicules neufs, d'occasion ou de démonstration, l'« état » du véhicule doit être connu à tout moment.
- Pour chaque véhicule, l'entreprise enregistre son numéro de série (VIN) et, lorsqu'il est immatriculé, son numéro d'immatriculation.
- Chaque véhicule entre dans le stock à une date d'entrée, et quitte le stock à une date de sortie lorsqu'il est vendu ou sorti du parc.
- Le stock distingue les véhicules « en stock », « réservés » (dossier en cours) et « vendus ».
- Chaque client est identifié par un numéro de client et l'entreprise conserve ses informations d'identité : civilité, nom, prénom, date de naissance.
- Pour chaque client, l'entreprise enregistre des coordonnées complètes : adresse postale (rue, code postal, ville), adresse email et au moins un numéro de téléphone portable.
- Un même client peut demander plusieurs devis et acheter plusieurs véhicules au fil du temps.
- Lorsqu'un client est intéressé par un véhicule, un devis est établi avec un numéro de devis, la date de création, le véhicule concerné, le prix proposé, l'éventuelle remise et les conditions commerciales.
- Un devis peut donner lieu à une commande (dossier de vente) ou être abandonné, mais l'entreprise souhaite conserver l'historique des devis réalisés.
- Toute vente de véhicule donne lieu à un dossier de vente identifié par un numéro de commande/dossier, associé à un seul client et un seul véhicule.
- Chaque dossier de vente comporte une date de commande, une date de livraison prévue, une date de livraison réelle (le cas échéant) et le prix de vente final TTC.
- L'entreprise peut accorder des remises commerciales ; pour chaque vente, le montant de la remise ou le pourcentage de remise est conservé.
- Les clients peuvent payer comptant ou recourir à des solutions de financement (crédit classique, LOA, LLD, etc.).
- Lorsqu'il y a financement, l'entreprise enregistre le type de financement retenu, le montant financé, la durée du financement en mois et, le cas échéant, le montant de l'apport du client.
- Pour certaines ventes, l'entreprise reprend l'ancien véhicule du client ; dans ce cas, le montant de reprise est saisi et lié au dossier de vente.
- Chaque vente est réalisée par un vendeur identifié, rattaché à une concession (site) de l'entreprise.
- Chaque concession dispose d'un code, d'un nom et d'une adresse, et peut stocker plusieurs véhicules et gérer plusieurs vendeurs.
- L'entreprise propose des extensions de garantie ; pour chaque vente, on indique si une extension est souscrite et, le cas échéant, la durée de l'extension.
- L'entreprise souhaite pouvoir contacter les clients après la vente (relances, opérations commerciales, entretiens) ; les données de contact doivent donc être fiables et à jour.
- L'entreprise souhaite pouvoir analyser ses ventes par marque, modèle, type de carburant, type de véhicule, concession et vendeur.
- L'entreprise souhaite suivre les délais entre l'entrée en stock et la vente de chaque véhicule afin d'optimiser la rotation du stock.

---

## Dictionnaire de données brutes

Ce dictionnaire liste les données « brutes » évoquées dans les règles ci-dessus, sans préjuger de la façon dont elles seront regroupées en entités ou clés dans le MCD/MLD MERISE.

| Signification de la donnée                              | Type      | Taille (caractères / chiffres) |
|---------------------------------------------------------|-----------|---------------------------------|
| Numéro de client                                        | Entier    | 10                              |
| Civilité du client (M., Mme, etc.)                      | Texte     | 5                               |
| Nom de famille du client                                | Texte     | 50                              |
| Prénom du client                                        | Texte     | 50                              |
| Date de naissance du client                             | Date      | 10                              |
| Adresse postale (ligne de rue) du client                | Texte     | 100                             |
| Code postal du client                                   | Texte     | 5                               |
| Ville du client                                         | Texte     | 50                              |
| Adresse email du client                                 | Texte     | 100                             |
| Téléphone portable du client                            | Texte     | 15                              |
| Numéro interne du véhicule                              | Entier    | 10                              |
| Numéro de série (VIN) du véhicule                       | Texte     | 17                              |
| Immatriculation du véhicule                             | Texte     | 10                              |
| Marque du véhicule                                      | Texte     | 30                              |
| Modèle du véhicule                                      | Texte     | 50                              |
| Version / finition du véhicule                          | Texte     | 50                              |
| Type de carburant (essence, diesel, électrique, etc.)   | Texte     | 15                              |
| Type de boîte de vitesses (manuelle, auto, etc.)        | Texte     | 15                              |
| Puissance fiscale du véhicule                           | Entier    | 2                               |
| Kilométrage du véhicule                                 | Entier    | 7                               |
| Date de première mise en circulation                    | Date      | 10                              |
| Couleur extérieure du véhicule                          | Texte     | 30                              |
| Type de véhicule (citadine, SUV, utilitaire, etc.)      | Texte     | 20                              |
| État du véhicule (neuf, occasion, démonstration)        | Texte     | 15                              |
| Date d'entrée en stock du véhicule                      | Date      | 10                              |
| Date de sortie de stock du véhicule                     | Date      | 10                              |
| Statut de stock du véhicule (en stock, réservé, vendu)  | Texte     | 15                              |
| Prix catalogue TTC du véhicule                          | Décimal   | 10,2                            |
| Prix de vente TTC du véhicule                           | Décimal   | 10,2                            |
| Montant de la remise (en euros)                         | Décimal   | 10,2                            |
| Pourcentage de remise                                   | Décimal   | 5,2                             |
| Numéro de devis                                         | Texte     | 10                              |
| Date de création du devis                               | Date      | 10                              |
| Numéro de dossier / commande de vente                   | Texte     | 10                              |
| Date de commande du véhicule                            | Date      | 10                              |
| Date de livraison prévue                                | Date      | 10                              |
| Date de livraison réelle                                | Date      | 10                              |
| Mode de paiement (comptant, chèque, virement, etc.)     | Texte     | 20                              |
| Type de financement (crédit, LOA, LLD, etc.)            | Texte     | 20                              |
| Montant financé                                         | Décimal   | 10,2                            |
| Durée du financement (en mois)                          | Entier    | 3                               |
| Montant de l'apport du client                           | Décimal   | 10,2                            |
| Montant de reprise du véhicule du client                | Décimal   | 10,2                            |
| Code de la concession                                   | Texte     | 10                              |
| Nom de la concession                                    | Texte     | 50                              |
| Code du vendeur                                         | Texte     | 10                              |
| Nom et prénom du vendeur                                | Texte     | 50                              |
| Présence d'une extension de garantie (oui/non)          | Booléen   | 1                               |
| Durée de l'extension de garantie (en mois)              | Entier    | 3                               |

**Total : 48 données**

---

## Étapes suivantes

À partir de ces règles de gestion et du dictionnaire de données, les prochaines étapes de la méthode MERISE seront :

1. **Modèle Conceptuel de Données (MCD)** : identification des entités, associations et cardinalités
2. **Modèle Logique de Données (MLD)** : transformation du MCD en schéma relationnel
3. **Modèle Physique de Données (MPD)** : implémentation dans un SGBD (MySQL, PostgreSQL, etc.)
4. **Développement de l'application** : création des interfaces et requêtes SQL

---

## Auteur

Étudiant en ingénierie informatique - Projet MERISE 2026
