---
description: "Architecture pour infrastructure : composants à interface claire, idempotence, environnements isolés, workloads orchestrés."
globs: ["**/infra/**", "**/*.tf", "**/*.tfvars", "**/Dockerfile*", "**/docker-compose*.y*ml", "**/.github/workflows/**", "**/.gitlab-ci.yml", "**/Jenkinsfile"]
alwaysApply: false
---

- Tout composant d'infrastructure a une interface explicite : inputs, outputs, effets de bord documentés.
- Composition par modules réutilisables, jamais par copier-coller.
- Tout code d'infrastructure est idempotent : l'appliquer N fois produit le même état final.
- Préférer le déclaratif à l'impératif ; pas de script qui suppose l'état précédent.
- Pas de logique conditionnelle complexe dans les templates : déléguer à un wrapper.
- Plusieurs petits composants clairs > un composant paramétrable monstrueux.
- Environnements strictement isolés : pas de partage d'état entre environnements.
- Promotion d'environnement via le même code, configurations séparées par environnement.
- Workloads conteneurisés : un processus principal, stateless, healthcheck explicite, image immuable.
- Limites de ressources (CPU, mémoire) définies pour tout workload orchestré.
- Probes de santé configurées pour tout workload géré par un orchestrateur.
- Configuration externalisée du code, jamais hardcodée dans l'image ou l'artefact.
- Templates de déploiement = mise en forme uniquement, jamais de logique métier.
