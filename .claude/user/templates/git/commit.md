# Format de message de commit

## Format

`<type>(<scope>): <description>`

## Champs

- **type** : `feat` | `fix` | `chore` | `docs` | `refactor` | `test` | `perf` | `ci` | `build`
- **scope** : module, composant ou dossier concerné (optionnel mais recommandé)
- **description** : impératif présent, ≤ 72 caractères, pas de point final, pas de majuscule initiale

## Corps de commit

- Optionnel pour les changements triviaux.
- Obligatoire si le contexte n'est pas évident depuis le diff.
- Explique le **pourquoi**, pas le **quoi** (le diff montre le quoi).
- Référence aux issues : `Refs #123`, `Closes #456`.

## Exemples valides

```
feat(auth): ajoute le refresh token JWT
fix(orders): corrige le tri par date sur liste vide
docs(readme): ajoute la section quickstart
refactor(domain): extrait la validation de commande
chore(deps): met à jour pytest 8.x
perf(query): cache les résultats de get_user_orders
```

## Anti-patterns à éviter

- `update`, `wip`, `fix divers` → pas de description claire
- `Fix bug.` → point final, majuscule, pas de scope
- `Added new feature` → passé au lieu de l'impératif
- `feat: ajout d'un nouveau système complet de gestion des utilisateurs` → trop long, devrait être splitté
- Mélange de plusieurs intentions dans un seul commit (feat + refactor + fix)
