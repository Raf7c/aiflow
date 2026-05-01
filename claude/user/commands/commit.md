---
description: "Génère un message de commit Conventional Commits depuis le diff staged."
allowed-tools:
  - Bash(git diff:*)
  - Bash(git diff --staged)
  - Bash(git status)
  - Bash(git reset:*)
  - Bash(git commit:*)
  - Read
---

# /commit

À partir du diff staged actuel, propose 1 à 3 messages de commit candidats au format Conventional Commits.

## Étapes

1. Exécuter `git diff --staged` pour lire le diff.
2. Si rien n'est staged : alerter l'utilisateur et arrêter.
3. Analyser le contenu : identifier le type de changement (feat, fix, refactor, etc.) et le scope (module, composant, dossier).
4. Si plusieurs changements logiquement distincts sont staged : prévenir l'utilisateur et suggérer `git reset` puis stager par intention.
5. Proposer 1 à 3 messages candidats au format défini dans le template.
6. Demander à l'utilisateur lequel il préfère (ou s'il veut une autre proposition).
7. Si l'utilisateur approuve : exécuter `git commit -m "<message>"`.

## Format

Voir `@~/.claude/templates/git/commit.md` pour le format strict, les exemples et les anti-patterns.

## Rules

Voir `@~/.claude/rules/git-workflow.md` pour les règles de granularité et d'atomicité.

## Critères de qualité

- Type Conventional Commits valide
- Scope pertinent extrait du diff
- Description ≤ 72 caractères, impératif présent, pas de point final, pas de majuscule initiale
- Pas de mélange d'intentions (feat + refactor + fix dans le même commit)
