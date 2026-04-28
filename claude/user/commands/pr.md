---
description: "Prépare titre et description de PR à coller dans GitHub depuis le diff de branche."
argument-hint: "[lien optionnel vers issue ou plan]"
---

# /pr

À partir du diff de la branche courante par rapport à `main`, génère titre et description de PR prêts à coller dans GitHub.

## Étapes

1. Exécuter `git log main..HEAD --oneline` pour comprendre la suite de commits.
2. Exécuter `git diff main...HEAD` pour le contenu détaillé.
3. Si un argument est fourni ($ARGUMENTS) : l'inclure dans la section "Lien vers plan".
4. Sinon, chercher si un plan existe dans `docs/plans/` correspondant à la branche.
5. Vérifier la présence de fichiers de tests dans le diff.
6. Vérifier l'absence apparente de secrets (heuristique sur patterns type `API_KEY=`, `password=`, tokens hex longs, etc.).
7. Remplir le template `@~/.claude/templates/git/pr.md` :
   - **Titre** : format Conventional Commits selon `@~/.claude/templates/git/commit.md`
   - **Contexte** : déduit du diff et des messages de commit
   - **Changements** : résumés à haut niveau pour un reviewer
   - **Lien vers plan** : si fourni ou détecté
   - **Tests effectués** : extraits du diff (présence de tests, commandes de test si visibles)
   - **Checklist** : pré-cochée sur ce qui est vérifiable (tests présents → coché ; secrets non détectés → coché)
   - **Notes pour le reviewer** : zones fragiles identifiées (ou retirer la section)

## Output

Le titre et la description finale, prêts à copier-coller dans GitHub.

## Rules

- Format et granularité : `@~/.claude/rules/git_workflow.md`
- Vérification tests : `@~/.claude/rules/testing_global.md`
- Vérification secrets : `@~/.claude/rules/security_global.md`

## Critères de qualité

- Titre ≤ 72 caractères, conforme Conventional Commits
- Toutes les sections obligatoires du template remplies
- Sections optionnelles (Lien vers plan, Notes pour le reviewer) retirées si vides
- Checklist alignée avec ce qui est réellement vérifié dans le diff
