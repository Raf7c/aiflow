# Conventions

Doc opérationnelle, à consulter chaque fois qu'un artefact est ajouté ou modifié.

## Nommage des fichiers

- **Format** : `snake_case.md` avec underscores.
- **Rules transverses** : suffixe `_global` (ex : `clean_code_global.md`, `testing_global.md`).
- **Rules de domaine** : suffixe du domaine (ex : `clean_architecture_infra.md`, `security_infra.md`).
- **Exception** : `git_workflow.md` n'a pas de suffixe `_global` car « GitHub Flow » est intrinsèquement un workflow ; ajouter `_global` serait redondant.
- **Templates** : organisés par domaine (`templates/git/commit.md`, futurs `templates/test/`, `templates/plan/`).
- **Memory-bank** : noms fixes (`overview.md`, `architecture.md`, `decisions.md`).
- **Dossiers** : `kebab-case` (ex : `memory-bank/`, `claude-code/` lorsque pertinent).

## Langue

- **Français** pour tous les artefacts versionnés (rules, templates, commands, docs, memory-bank).
- **Anglais accepté** uniquement pour les identifiants techniques (`commit`, `pr`, `plan`, `review`, `debug`, etc.) qui correspondent aux commandes Git/CLI usuelles.

## Densité

- Rules : ≤ 80 lignes par fichier.
- Commands : ≤ 60 lignes.
- Templates : ≤ 60 lignes.
- Au-delà, signe d'un mauvais découpage : extraire en sous-fichier ou retirer du contenu non essentiel.

## Frontmatter

| Type d'artefact | `description` | `globs` | `alwaysApply` |
|---|---|---|---|
| Rule transverse (`user/rules/*_global.md`) | Concise, informative | (absent, redondant) | `true` |
| Rule de domaine (`user/rules/*_<domaine>.md`) | Concise, informative | Patterns ciblés | `false` |
| Rule on-demand (ex : `git_workflow`) | Détaillée avec « À invoquer pour... » | (absent) | `false` |
| Command | Action attendue, courte | (sans objet) | (sans objet) |
| Command avec argument | + `argument-hint: "[...]"` | (sans objet) | (sans objet) |
| Template | (pas de frontmatter) | — | — |
| Memory-bank | (pas de frontmatter) | — | — |

Note : les rules de domaine vivent dans `user/rules/` au même titre que les transverses, parce qu'elles ne consomment pas de tokens hors contexte (activation par globs). Les dossiers `claude/rules/` et `claude/commands/` à la racine restent réservés aux rares cas d'artefacts spécifiques à un projet précis.

## Références entre fichiers

- **Syntaxe** : `@~/.claude/...` (chemin **après installation**, pas dans la structure du repo).
- **Exemple** : une command référence un template via `@~/.claude/templates/git/commit.md`, pas `templates/git/commit.md` ni `aiflow/claude/user/templates/git/commit.md`.
- **Raison** : le repo suit l'interprétation « source à projeter » (cf. `philosophy.md`). Les fichiers vivent leur vie dans `~/.claude/` une fois installés.

## Critère unique de garde dans une rule

Pour chaque ligne candidate dans une rule, se poser la question :

> **« Une IA non guidée ferait-elle ce truc spontanément ? »**

- Si **oui** → la ligne est inutile, à couper.
- Si **non** → la ligne reste, formulée à l'impératif tranchant.

Exemples de coupes systématiques :
- « Imports triés » → un linter le fait.
- « Indentation propre » → spontané pour toute IA.
- « Versionnement SemVer » → trivial.

Exemples de gardes :
- « Tout bugfix commence par un test qui reproduit le bug » → l'IA dérive systématiquement.
- « Pas de catch vide » → l'IA le fait pour faire passer le code.
- « Hypothèse écrite avant toute modification de code » → l'IA tâtonne.

## Pureté des rules

- **Aucun nom d'outil, framework ou langage** dans le corps des rules de domaine. Les principes restent universels.
- **Exception unique** : Git (universel sur tous tes projets) reste mentionné nommément.
- Les noms de fichiers ou patterns techniques (`Dockerfile`, `*.tf`, `**/infra/**`) sont **autorisés uniquement dans les `globs` du frontmatter**, jamais dans le corps de la rule.
- Quand des rules par outil apparaîtront (`tools/terraform.md`, `tools/k8s.md`), elles surchargeront avec le concret. Les rules de domaine resteront conceptuelles.

## Conventional Commits du repo lui-même

Le repo `aiflow` lui-même suit ses propres rules Git.

Format : `<type>(<scope>): <description>`

Scopes alignés sur les dossiers du repo :
- `feat(rules): ajoute rule perf transverse`
- `fix(commands): corrige référence template dans pr.md`
- `docs(philosophy): clarifie principe DRY`
- `refactor(memory-bank): simplifie le template overview`
- `chore(license): ajoute fichier LICENSE`

Voir `templates/git/commit.md` pour le format détaillé et les anti-patterns.