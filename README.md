# dbt-elt-superstore


Ce projet implémente un pipeline ELT (Extract, Load, Transform) moderne pour transformer les données brutes d'un cas d'usage **Superstore** en un Data Warehouse performant modélisé en étoile (Star Schema). 

Le projet s'appuie sur **dbt (Data Build Tool)** pour l'orchestration, la transformation et la modélisation des données stockées dans une base de données PostgreSQL.

---

## Architecture du Data Warehouse

Le modèle cible convertit une table source plate (`public.superstore`) en un schéma en étoile optimisé pour les outils de Business Intelligence (Power BI, Tableau, Metabase) :

*   **Table de Fait :** `fact_sales` (Mesures de ventes, quantités, remises, profits)
*   **Tables de Dimensions :** 
    *   `dim_customer` (Données clients)
    *   `dim_product` (Catalogue produits)
    *   `dim_location` (Géographie des ventes)
    *   `dim_ship_mode` (Logistique et modes d'expédition)
    *   `dim_date` (Calendrier d'analyse généré automatiquement)

---

## Structure du Projet

```text
dbt-elt-superstore/
├── models/
│   ├── dim/
│   │   ├── dim_customer.sql   # Transformation de la dimension client
│   │   ├── dim_date.sql       # Génération dynamique du calendrier
│   │   ├── dim_location.sql   # Transformation de la géographie
│   │   ├── dim_product.sql    # Transformation de la dimension produit
│   │   └── dim_ship_mode.sql  # Transformation des modes de livraison
│   ├── fact/
│   │   └── fact_sales.sql     # Table de fait principale avec jointures
│   ├── source/
│   │   └── src_superstore.yml # Déclaration de la table source d'origine
│   ├── staging/
│   │   └── stg_superstore.sql # Nettoyage initial : renommages et alias
├── .gitignore                 # Exclusion des fichiers temporaires et profils
├── dbt_project.yml            # Configuration globale du projet dbt
└── README.md                  # Documentation du projet
```

---

## Installation et Déploiement

### 1. Prérequis
*   Python 3.9+ ou supérieur installé.
*   Une instance PostgreSQL avec la table source `public.superstore` alimentée.

### 2. Installation de dbt
Clonez le dépôt et installez l'adaptateur dbt pour PostgreSQL :
```bash
git clone https://github.com
cd dbt-elt-superstore
pip install dbt-postgres
```

### 3. Configuration du profil (`profiles.yml`)
Créez ou modifiez votre fichier `~/.dbt/profiles.yml` pour y ajouter les accès à votre base de données :
```yaml
angona_kalitao:
  target: dev
  outputs:
    dev:
      type: postgres
      host: localhost
      user: votre_utilisateur
      password: votre_mot_de_passe
      port: 5432
      dbname: votre_base_de_donnees
      schema: public # ou votre schéma de destination dwh
```

### 4. Exécution du Pipeline ELT
Vérifiez la connexion avec la base de données, puis lancez la construction des tables du Data Warehouse :
```bash
dbt debug
dbt run
```

---

## Contribution
Les contributions, rapports de bugs et suggestions d'amélioration sont les bienvenus. N'hésitez pas à ouvrir une *Issue* ou à soumettre une *Pull Request*.
