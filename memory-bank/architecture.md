# Architecture

> **TEMPLATE** — copier dans `memory-bank/architecture.md` de chaque nouveau projet et remplir.
> Ne décrit pas le repo aiflow lui-même.

<!--
But : décrire la structure technique du projet, sa stack, ses composants, ses flux.
Mis à jour à chaque changement structurel (nouveau service, changement de DB, refonte).
Mise à jour obligatoire dans la même PR que le changement de code (cf. rules/git-workflow.md).
Densité cible : ≤ 2 pages écran (≤ 150 lignes).
-->

## Stack

<!--
Lister les langages, frameworks, runtimes, outils principaux.
Versions précises (pas "Python récent", écrire "Python 3.12").
Exemple :
- Langage : Python 3.12
- Framework web : FastAPI 0.110
- Base de données : PostgreSQL 16
- ORM : SQLAlchemy 2.0
- Tests : pytest 8.x
- Conteneurisation : Docker + docker-compose
- Déploiement : Kubernetes (cluster OVH)
-->

## Structure des dossiers

<!--
Arbre commenté des dossiers top-level du projet.
Une ligne de description par dossier.
Pas besoin de descendre plus bas que le 2e niveau.
Exemple :
```
.
├── src/
│   ├── domain/          # Entités métier, règles pures, sans I/O
│   ├── usecases/        # Orchestration métier
│   ├── adapters/        # Implémentations DB, HTTP, etc.
│   └── api/             # Routes FastAPI, validation, sérialisation
├── tests/
│   ├── unit/
│   └── integration/
├── migrations/          # Migrations Alembic
├── deploy/              # Manifests K8s, charts Helm
└── scripts/             # Scripts ops (backup, seed, etc.)
```
-->

## Composants principaux

<!--
Lister 3 à 7 composants/modules majeurs.
Pour chacun : nom, rôle en 1-2 lignes, dépendances clés.
Exemple :
### domain.orders
Entités Order, OrderLine, et règles de validation pures (pas d'I/O).
Aucune dépendance externe.

### usecases.create_order
Orchestre la création d'une commande : validation, persistance, webhook.
Dépend de : domain.orders, adapters.persistence, adapters.notifications.

### adapters.persistence.postgres
Implémentation PostgreSQL des repositories. Utilise SQLAlchemy.
Dépend de : domain.orders (interfaces).
-->

## Flux de données

<!--
Décrire les principaux flux : qui appelle quoi, dans quel ordre, avec quelles données.
Texte clair ou ASCII art. Pas de Mermaid au MVP.
Exemple :

Création de commande :
  Client HTTP
    -> POST /orders (JSON validé par Pydantic)
      -> usecases.create_order
        -> domain.orders.validate()
        -> adapters.persistence.save()
        -> adapters.notifications.publish(OrderCreated)
      <- Order ID
    <- 201 Created
-->

## Intégrations externes

<!--
APIs tierces, bases de données, queues, services consommés.
Pour chaque intégration : nom, usage, mode d'auth, criticité.
Exemple :
- PostgreSQL (DB principale, conn pool 10, criticité haute)
- RabbitMQ (publish events, criticité moyenne)
- Service de paiement Stripe (HTTP, API key, criticité haute)
- Service email Mailjet (HTTP, API key, criticité basse)
-->

## Environnements

<!--
Lister les environnements et leurs spécificités.
Exemple :
- dev : local, docker-compose, DB locale, secrets dans .env
- staging : cluster K8s OVH, DB managée OVH, secrets via Vault
- prod : cluster K8s OVH (multi-zone), DB managée HA, secrets via Vault
-->

## Points d'attention

<!--
Pièges connus, dettes techniques identifiées, zones fragiles.
Section précieuse pour un agent IA (et pour toi dans 6 mois).
Exemple :
- Le module legacy `src/legacy/billing.py` ne respecte pas l'archi en couches,
  refonte planifiée Q3 2026.
- Le webhook de notification est best-effort : pas de retry, à renforcer.
- Migration vers SQLAlchemy 2.0 partielle : certains repos utilisent encore
  l'ancien style ORM.
-->
