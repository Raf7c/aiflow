# Philosophy

## Pourquoi ce repo

Travailler avec des agents IA de codage (Claude Code, OpenCode, Codex, etc.) sur plusieurs projets sans système versionné conduit à trois problèmes récurrents :

- **Fragmentation** : les configurations sont éparpillées entre projets, copiées-collées, modifiées localement sans trace.
- **Prompts jetables** : les bonnes formulations sont écrites dans une UI, perdues à la session suivante.
- **Perte de qualité** : un agent IA bien guidé sur un projet redevient générique sur le suivant.

Ce repo résout ces problèmes en concentrant **un système versionné, DRY, portable** : rules, templates, commands, mémoire projet, le tout dans un seul Git, prêt à installer sur n'importe quelle machine, sur n'importe quel projet.

## Principes fondateurs

- **Source unique de vérité** : `claude/` est la source officielle, pas une copie. Pas de double couche `core/adapters/` tant qu'un seul outil cible suffit. Si un deuxième outil arrive, on extrait l'abstraction au troisième usage, pas avant.
- **DRY mais pas dogmatique** : la règle des trois avant d'extraire une abstraction. Une duplication acceptée vaut mieux qu'une mauvaise abstraction imposée.
- **Fichiers versionnés > prompts UI** : tout vit dans Git. Rien dans les paramètres d'application.
- **Court et testable > exhaustif et flou** : chaque rule tient en lignes impératives, jamais en paragraphes. ≤ 80 lignes par fichier d'artefact.
- **Anti-dérive IA > exhaustivité** : chaque ligne d'une rule corrige un comportement qu'une IA non guidée ne ferait pas spontanément. Tout le reste est du bruit.
- **Strict minimum** : pas de noms d'outils, frameworks ou langages dans le corps des rules. Les rules sont conceptuelles ; les outils sont des détails d'application.
- **Anticipation par dossier, pas par fichier** : on prépare des dossiers vides (`templates/`, `commands/` à la racine) pour des extensions futures, sans pré-remplir avant le besoin.

## Architecture mentale

Le repo se lit en deux zones, chacune avec une destination d'installation distincte :

```
aiflow/
│
├── claude/                               [configuration IA versionnée]
│   ├── user/         ─────────────►  ~/.claude/         (tout ce qui te suit partout)
│   ├── commands/     ─────────────►  <projet>/.claude/commands/  (vide, futurs par-projet)
│   └── rules/        ─────────────►  <projet>/.claude/rules/     (vide, futurs par-projet)
│
├── memory-bank/      ─────────────►  <projet>/docs/memory-bank/  (par projet, à remplir)
│
└── docs/             [documentation du repo lui-même, lue par humains]
```

Le repo est une **source à projeter** vers ces destinations, pas un dotfile à cloner directement. Les références internes pointent vers les chemins **après installation** (`@~/.claude/templates/git/commit.md`), pas vers la structure du repo.

Le contenu de `claude/user/` regroupe **tout ce qui te suit partout** : profile (`CLAUDE.md`), permissions (`settings.json`), rules (transverses ET de domaine activées par globs), commands, templates. Les rules de domaine vivent ici aussi parce qu'elles ne consomment pas de tokens hors contexte (activation par globs) ; il n'y a donc aucune raison de les copier projet par projet.

Les dossiers `claude/rules/` et `claude/commands/` à la racine sont conservés vides pour de futures rules ou commands réellement spécifiques à un projet (cas rare).

## Rôle de chaque brique

- **`CLAUDE.md` (global)** — *qui tu es*. Profile utilisateur lu par Claude Code à chaque session : OS, runtimes, éditeur, préférences de communication, comportements attendus, règles de compaction.

- **`settings.json` (global)** — *ce que Claude a le droit de faire*. Permissions Bash structurées en deny / ask / allow, variables d'environnement, mode d'exécution. L'incarnation opérationnelle des rules de sécurité.

- **`rules`** — *comment coder*. Garde-fous comportementaux à l'impératif, qui corrigent les dérives IA classiques. Activées en permanence (transverses) ou par globs (domaine).

- **`templates`** — *forme des livrables*. Squelettes Markdown que les commands remplissent (PR, commit, plan, bugfix). Sans frontmatter, agnostiques.

- **`commands`** — *déclencheurs ponctuels*. Slash commands invoquées explicitement (`/commit`, `/pr`). Une command = une intention immédiate, un résultat dans la foulée.

- **`memory-bank`** — *sur quoi tu codes*. Templates de mémoire à copier dans chaque projet pour donner à l'IA le contexte du projet (overview, architecture, décisions).

- **`docs`** — *pourquoi tout ça existe*. Documentation humaine du repo, lue par toi dans 6 mois ou par un dev senior qui découvre le système.

## Ce que ce repo n'est pas

- **Pas un framework** : aucune dépendance d'exécution, aucune surcouche logicielle.
- **Pas un outil exécutable** : pas de CLI, pas de daemon, pas de runtime.
- **Pas un linter** : ne remplace ni eslint, ni ruff, ni shellcheck. Les rules guident l'IA, pas le code source.
- **Pas une collection de prompts jetables** : chaque artefact a un emplacement fixe, un format, une raison d'être.
- **Pas un guide générique de bonnes pratiques** : les rules sont **anti-dérives IA** ciblées, pas un cours d'ingénierie logicielle.
- **Pas un `~/.claude/`** : le repo est la source versionnée, `~/.claude/` est l'installation active.

## Évolution prévue

Au fil des besoins, des extensions naturelles pourront s'ajouter sans rompre l'architecture :

- **Templates par domaine** : `templates/test/`, `templates/debug/`, `templates/review/`, `templates/plan/` (sur le modèle de `templates/git/`).
- **Commands additionnelles** : `/plan`, `/review`, `/debug`, `/test`, invocables sur action.
- **Skills** (workflows multi-étapes) : `planning-feature`, `debugging-bug`, `reviewing-diff` quand un protocole structuré apporte plus que la somme des commands.
- **Rules de domaine** : `clean_architecture_data.md`, `clean_architecture_ml.md` lorsque les projets correspondants apparaîtront.
- **Rules par langage** : `python.md`, `terraform.md`, `react.md` lorsque les conventions spécifiques deviendront récurrentes.
- **Support d'autres outils IA** : OpenCode, Codex et autres seront intégrés en répliquant le pattern actuel sous `.opencode/`, `.codex/`, etc. — extraction d'un `core/` agnostique uniquement si la divergence devient coûteuse à maintenir.
- **Script d'installation** : automatiser la projection du repo vers `~/.claude/` et `<projet>/.claude/`.

Le repo grandit par ajout, jamais par refonte.