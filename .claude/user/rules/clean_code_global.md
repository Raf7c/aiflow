---
description: "Clean code : fonctions courtes, nommage explicite, gestion d'erreurs, anti-magic numbers."
alwaysApply: true
---

- Une fonction = une responsabilité, ≤ 40 lignes, ≤ 3 niveaux d'indentation.
- ≤ 4 paramètres ; au-delà, regrouper en struct/objet.
- Pas de mutation des arguments d'entrée.
- Pas de magic numbers ni magic strings : constantes nommées.
- Pas de booléen flag qui change le comportement : séparer en deux fonctions.
- Early returns plutôt que else profonds.
- Pas de nested if au-delà de 2 niveaux : extraire en fonction.
- Pas de catch vide, pas d'erreur convertie silencieusement en None/null.
- Distinguer erreurs attendues (validation, ressource manquante) et inattendues (bug, panne).
- Nommage : verbe pour fonctions, nom pour variables/types, is_/has_/should_ pour booléens.
- Pas de noms fourre-tout : data, info, manager, helper, util, tmp.
- Règle des trois : extraire une abstraction au troisième usage, pas avant.
- YAGNI : coder le besoin actuel, pas l'hypothétique.
- Pas de TODO/FIXME sans référence à une issue.
- Pas de code commenté : Git garde l'historique.
- Fail loud : une erreur attrapée se logue, se transforme, ou se propage — jamais ignorée.
