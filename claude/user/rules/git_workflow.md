---
description: "Workflow Git simple (GitHub Flow)."
alwaysApply: false
---

Objectif: Historique lisible, branches courtes, PR claires.
Portée: Branches, commits, PR.

Branches:
- Utiliser GitHub Flow : branches depuis `main`, PR vers `main`, squash merge.
- Ne jamais commit directement sur `main`.
- Nommer: `<type>/<scope>-<description>` (feat, fix, chore, docs, refactor, test, perf, ci, build).

Commits:
- Un commit = une intention atomique, facilement revertable.
- Éviter les commits fourre‑tout (`wip`, `misc`, etc.).
- Utiliser le format `@~/.claude/templates/git/commit.md`.

PR:
- Une PR = une seule intention fonctionnelle.
- Mettre à jour la memory‑bank si l’architecture change.
- Utiliser le template `@~/.claude/templates/git/pr.md`.