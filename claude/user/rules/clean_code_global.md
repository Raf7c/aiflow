---
description: "Clean code global."
alwaysApply: true
---

Objectif: Code lisible, testable, simple à modifier.
Portée: Tout code de production (backend, frontend, scripts).

Règles:
- Une fonction = une responsabilité, ≤ 40 lignes, ≤ 3 niveaux.
- ≤ 4 paramètres; sinon objet/struct.
- Ne pas muter les paramètres d’entrée.
- Pas de magic numbers / strings : constantes nommées.
- Noms explicites, alignés métier, verbe pour fonctions.
- Préférer early return aux `if` imbriqués.
- Pas de `catch`/`except` vide; ne jamais avaler une erreur.
- Distinguer erreurs attendues vs bugs/pannes.
- Factoriser au 3ᵉ usage (règle des trois).
- Appliquer YAGNI : pas de code spéculatif.
- Pas de code commenté ni TODO sans issue liée.
- Préférer petites unités de code fortement cohérentes, faiblement couplées.