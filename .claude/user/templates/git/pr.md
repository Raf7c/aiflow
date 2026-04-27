# Description de PR

<!--
Squelette à remplir pour toute description de PR.
Sections marquées (optionnel) à retirer si non pertinentes.
-->

## Titre

<!--
Format Conventional Commits : `<type>(<scope>): <description>`
≤ 72 caractères, impératif présent, pas de point final.
Voir templates/git/commit.md pour le format détaillé.
-->

## Contexte

<!--
2-4 lignes : pourquoi cette PR maintenant, quel problème elle résout.
Lien vers issue/ticket si pertinent : Refs #123, Closes #456.
-->

## Changements

<!--
Liste à puces, haut niveau, orientée « ce qui change pour un reviewer ».
- Composant/fichier concerné : nature du changement
- ...
-->

## Lien vers plan (optionnel)

<!--
`docs/plans/YYYY-MM-DD-<slug>.md` si la feature a un plan formel.
Sinon retirer cette section.
-->

## Tests effectués

<!--
- Tests automatiques : commande lancée + résultat (ex : `pytest tests/auth/` : 12 passed)
- Tests manuels : ce qui a été vérifié à la main et comment
-->

## Checklist

- [ ] Tests présents et verts
- [ ] Lint/format OK
- [ ] Memory-bank à jour si impact archi
- [ ] Pas de secret, pas de TODO sans issue
- [ ] Docs utilisateur à jour si impact UX/API

## Notes pour le reviewer (optionnel)

<!--
Points d'attention, zones fragiles, décisions discutables.
Retirer cette section si rien à signaler.
-->
