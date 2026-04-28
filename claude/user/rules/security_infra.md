---
description: "Sécurité infra (moindre privilège)."
globs: ["**/infra/**", "**/*.tf", "**/*.tfvars", "**/Dockerfile*", "**/docker-compose*.y*ml", "**/.github/workflows/**", "**/.gitlab-ci.yml", "**/Jenkinsfile"]
alwaysApply: false
---

Objectif: Limiter l’impact d’un incident infra.
Portée: Identités, réseau, conteneurs, IaC, pipelines.

Règles:
- Éviter les wildcards dans les politiques; définir ressources/actions/principaux précis.
- Utiliser des identités dédiées par workload, sans partage.
- Préférer droits temporaires assumables à des credentials long‑terme.
- Isoler les réseaux par défaut; n’ouvrir que ce qui est nécessaire.
- Ne pas exécuter les conteneurs en root; déclarer un user non‑privileged.
- Réduire les capabilités; interdire le mode privilégié.
- Minimiser l’accès à l’hôte et aux volumes sensibles.
- Chiffrer et verrouiller l’état d’infra; ne pas y stocker de secrets.
- Revoir les plans avant application en prod; appliquer depuis `main`.
- Limiter scope/durée des secrets CI; masquer les secrets dans les logs.