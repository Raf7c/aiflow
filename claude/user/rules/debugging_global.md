---
description: "Debug = repro, hypothèse, test."
alwaysApply: true
---

Objectif: Corriger la cause racine, éviter les fixes au hasard.
Portée: Tout bug, dev comme prod.

Procédure:
- Reproduire le bug avant toute modification.
- Formuler une seule hypothèse claire sur la cause.
- Concevoir un test ciblé pour valider/infirmer l’hypothèse.
- Écrire un test de régression qui échoue.
- Appliquer un fix minimal jusqu’à passage du test.
- Relancer les tests pertinents pour éviter les régressions.
- Documenter brièvement cause et fix (commit/issue) si utile.

Interdits:
- Ne pas modifier « pour voir » sans hypothèse.
- Ne jamais masquer une erreur par un try/catch vide ou log supprimé.