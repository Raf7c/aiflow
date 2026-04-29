---
description: "Sécurité infra (transverse, moindre privilège)."
globs: ["**/infra/**", "**/*.tf", "**/*.tfvars", "**/Dockerfile*", "**/docker-compose*.y*ml", "**/.github/workflows/**", "**/.gitlab-ci.yml", "**/Jenkinsfile"]
alwaysApply: false
---

Objectif: Réduire la surface d'attaque et l'impact d'un incident.
Portée: Tout artefact qui définit ou exécute un composant avec des privilèges, du réseau ou des secrets.

Règles:
- Identités dédiées par composant; pas de partage d'identité entre rôles distincts.
- Privilèges au strict nécessaire; portée et durée minimales.
- Préférer des credentials éphémères ou révocables aux credentials long-terme.
- Isoler par défaut (réseau, exécution, données); n'ouvrir que ce qui est explicitement requis.
- Données sensibles externalisées hors du code, des artefacts et des journaux.
- Toute exécution privilégiée doit être traçable (qui, quand, sur quoi).

Interdits:
- Pas de définition de privilèges par caractères jokers.
- Pas de secrets persistés dans les artefacts livrés ou dans l'état d'infra.
- Pas de canal de communication non chiffré pour des données sensibles.