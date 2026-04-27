---
description: "Tests : règle d'or bugfix=test, isolation, déterminisme."
alwaysApply: true
---

- Tout bugfix commence par un test qui reproduit le bug et échoue. Non-négociable.
- Un test = un comportement vérifié, isolé, déterministe.
- Pas d'état partagé entre tests, pas de dépendance d'ordre.
