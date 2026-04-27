---
description: "Sécurité infrastructure : moindre privilège, isolation, conteneurs non-root, état d'infrastructure protégé, opérations sur production."
globs: ["**/infra/**", "**/*.tf", "**/*.tfvars", "**/Dockerfile*", "**/docker-compose*.y*ml", "**/.github/workflows/**", "**/.gitlab-ci.yml", "**/Jenkinsfile"]
alwaysApply: false
---

- Pas de wildcard dans les politiques d'accès (resource, action, principal) ; une politique = un usage précis.
- Privilèges assumables et temporaires plutôt que credentials long-terme.
- Identité dédiée par workload, jamais d'identité par défaut ou partagée.
- Pas de privilèges d'administration globale sauf opération exceptionnelle tracée.
- Isolation réseau par défaut : trafic entre composants explicitement autorisé, pas implicitement.
- Politiques de sécurité strictes appliquées par défaut au niveau plateforme.
- Conteneurs : pas de processus en root ; utilisateur non privilégié déclaré.
- Capabilités système réduites au strict nécessaire (drop tout puis ajout ciblé).
- Pas de privilèges étendus (mode privilégié, accès aux ressources de l'hôte, partage du contexte d'exécution de l'hôte).
- Filesystem en lecture seule quand possible.
- Images de base minimales ; build multi-étape pour exclure les outils de build de l'artefact final.
- Tags d'image immuables en production ; pas de tag mouvant.
- Secrets injectés au build via un mécanisme dédié, jamais via arguments ou variables d'environnement exposés.
- État d'infrastructure chiffré, distant, versionné, avec verrouillage concurrent.
- Pas de credentials stockés dans l'état d'infrastructure ; lookup au runtime.
- Plan d'exécution reviewé avant application en production ; application prod uniquement depuis branche principale après merge.
- Tests et expérimentations sur environnement éphémère et isolé, jamais sur production.
- Tokens de pipeline CI : scope minimal, expiration courte, masking des secrets dans les logs.
