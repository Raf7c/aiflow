---
description: "Architecture infra modulaire."
globs: ["**/infra/**", "**/*.tf", "**/*.tfvars", "**/Dockerfile*", "**/docker-compose*.y*ml", "**/.github/workflows/**", "**/.gitlab-ci.yml", "**/Jenkinsfile"]
alwaysApply: false
---

Objectif: Infra déclarative, idempotente, modulaire.
Portée: IaC, conteneurs, pipelines CI/CD, manifests d’orchestrateur.

Règles:
- Un composant infra = interface claire (inputs/outputs/effets).
- Préférer modules réutilisables au copier‑coller.
- Garantir l’idempotence des plans d’infra.
- Préférer déclaratif aux scripts impératifs ad‑hoc.
- Limiter la logique conditionnelle dans les templates.
- Séparer les environnements (dev/stage/prod) via config dédiée.
- Même code pour tous les environnements; seuls inputs changent.
- Workloads conteneurisés: stateless autant que possible, healthchecks définis.
- Fixer des limites de ressources (CPU, mémoire) par workload.
- Externaliser config et secrets hors code et images.