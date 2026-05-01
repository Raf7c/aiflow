---
description: "Architecture infra modulaire et déclarative : composants réutilisables, configuration externalisée, indépendance d'environnement. Auto-activée sur les fichiers infra, conteneurs, k8s et CI/CD."
paths:
  - "**/infra/**"
  - "**/*.tf"
  - "**/*.tfvars"
  - "**/Dockerfile*"
  - "**/docker-compose*.y*ml"
  - "**/.github/workflows/**"
  - "**/.gitlab-ci.yml"
  - "**/Jenkinsfile"
  - "**/k8s/**"
  - "**/kubernetes/**"
  - "**/helm/**"
---

Objectif: Infra modulaire, déclarative, indépendante de l'environnement.
Portée: Tout artefact qui décrit, assemble ou exécute des composants d'infrastructure.

Règles:
- Un composant = une interface claire (inputs, outputs, effets observables).
- Décomposer en unités réutilisables; pas de copier-coller entre composants similaires.
- Préférer une description déclarative à une suite d'étapes impératives.
- Limiter la logique conditionnelle dans les définitions; sortir la variation en configuration.
- Une seule définition pour tous les environnements; seuls les paramètres d'entrée changent.
- Séparer la définition d'un composant de sa configuration par environnement.
- Externaliser configuration et secrets hors du code et des artefacts produits.
