---
description: "Garde-fous de débogage : reproduction, hypothèse unique, test de régression, interdits."
alwaysApply: true
---

- Reproduire le bug avant toute correction. Pas de fix sans repro.
- Une seule hypothèse à la fois, formulée par écrit avant de toucher au code.
- Test de régression écrit avant le fix ; correction minimale ensuite.
- Interdits : modifier « pour voir », masquer une erreur par try/catch, changer plusieurs choses sans vérification intermédiaire.
