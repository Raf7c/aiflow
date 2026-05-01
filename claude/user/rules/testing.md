---
description: "Règles pour écrire et maintenir des tests. Auto-activée sur les fichiers de test."
paths:
  - "**/tests/**"
  - "**/test/**"
  - "**/__tests__/**"
  - "**/*_test.*"
  - "**/*.test.*"
  - "**/*.spec.*"
  - "**/spec/**"
  - "**/conftest.py"
---

Objectif: Chaque bug corrigé reste corrigé; tests stables.
Portée: Tous les tests liés au code de production.

Règles:
- Tout bugfix commence par un test qui reproduit le bug et échoue.
- Un test = un comportement précis, isolé et déterministe.
- Pas d'état partagé entre tests; pas de dépendance à l'ordre d'exécution.
- Utiliser des données de test explicites, locales au test.
- Préférer des assertions lisibles, proches du langage métier.
- Structurer les descriptions de tests en Given / When / Then quand c'est pertinent.
- Pas de dépendance externe non maîtrisée (réseau réel, horloge système, hasard) sans isolation.
