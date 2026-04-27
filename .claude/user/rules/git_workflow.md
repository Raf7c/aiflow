---
description: "Conventions Git : GitHub Flow, granularité, PR. À invoquer pour commit, branche, ou préparation de PR."
alwaysApply: false
---

- GitHub Flow : branches courtes depuis `main`, PR vers `main`, squash merge par défaut.
- Pas de merge direct sur `main`, même en solo.
- Nom de branche : `<type>/<scope>-<description-kebab>` (types : feat, fix, chore, docs, refactor, test, perf, ci, build).
- Un commit = un changement atomique, relisable, annulable, cherry-pickable. Pas de commit fourre-tout (`fix divers`, `wip`, `update`).
- Une PR = une intention ; deux intentions = deux PR.
- Memory-bank (`docs/memory-bank/architecture.md`, `decisions.md`) mise à jour dans la même PR si impact structurel.
- Format des messages de commit : voir `@~/.claude/templates/git/commit.md`.
- Format des descriptions de PR : voir `@~/.claude/templates/git/pr.md`.
