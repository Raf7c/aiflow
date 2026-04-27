---
description: "Architecture en couches : dépendances vers le domaine, frontières via interfaces, pas de logique dans l'I/O."
alwaysApply: true
---

- Sens des dépendances : frameworks → adapters → use-cases → domaine.
- Le domaine ne dépend de rien (pas de framework, pas d'I/O, pas de DB).
- Pas de logique métier dans les controllers/handlers HTTP.
- Pas de logique métier dans les modèles de persistance.
- Pas de SQL dans le domaine, pas d'HTTP dans les use-cases.
- Toute dépendance externe (DB, HTTP, FS, queue) passe par une interface (port).
- Implémentations concrètes injectées, jamais hardcodées.
- Mocker à la frontière externe, jamais au sein du domaine.
- Pas d'état global mutable, pas de singleton caché.
- Pas d'import circulaire : signe d'un mauvais découpage.
- Tout choix structurant (stack, DB, framework, intégration majeure) tracé dans `docs/memory-bank/decisions.md`.
- Tout changement structurel met à jour `docs/memory-bank/architecture.md` dans la même PR.
