# aiflow

Système versionné de configuration pour agents IA de codage : rules, templates, commands et templates de mémoire projet.

Conçu pour Claude Code aujourd'hui, extensible à d'autres outils IA (OpenCode, Codex, etc.) en répliquant le pattern.

## Structure

```
aiflow/
├── .claude/
│   ├── user/                          → ~/.claude/         (transverse, tous projets)
│   │   ├── rules/                     (6 rules : clean code, archi, sécu, tests, debug, git)
│   │   ├── commands/                  (slash commands : /commit, /pr)
│   │   └── templates/                 (squelettes par domaine : git/, futurs test/, plan/)
│   ├── rules/                         → <projet>/.claude/rules/  (par projet : infra)
│   └── commands/                      → <projet>/.claude/commands/  (vide, futurs par-projet)
│
├── memory-bank/                       → <projet>/docs/memory-bank/  (par projet, à remplir)
│   ├── overview.md                    (quoi, pour qui, pourquoi)
│   ├── architecture.md                (stack, structure, flux)
│   ├── decisions.md                   (journal ADR append-only)
│   └── README.md                      (mode d'emploi)
│
└── docs/                              (documentation du repo)
    ├── philosophy.md                  (pourquoi ce repo, principes)
    └── conventions.md                 (nommage, frontmatter, références)
```

## Quick start

### Installation utilisateur (une fois par machine)

```bash
git clone <url> ~/dev/aiflow

mkdir -p ~/.claude/{rules,commands,templates}
cp -r ~/dev/aiflow/.claude/user/rules/*       ~/.claude/rules/
cp -r ~/dev/aiflow/.claude/user/commands/*    ~/.claude/commands/
cp -r ~/dev/aiflow/.claude/user/templates/*   ~/.claude/templates/
```

À chaque session Claude Code dans n'importe quel projet : les 6 rules transverses sont actives, les slash commands `/commit` et `/pr` invocables.

### Installation par projet (à chaque nouveau projet)

```bash
cd <projet>

# Memory-bank du projet
mkdir -p docs/memory-bank
cp ~/dev/aiflow/memory-bank/{overview,architecture,decisions}.md docs/memory-bank/
$EDITOR docs/memory-bank/                       # remplir les 3 templates

# CLAUDE.md à la racine pour charger la memory-bank
cat > CLAUDE.md <<EOF
@docs/memory-bank/overview.md
@docs/memory-bank/architecture.md
@docs/memory-bank/decisions.md
EOF

# Si le projet a de l'infrastructure
mkdir -p .claude/rules
cp ~/dev/aiflow/.claude/rules/*.md .claude/rules/

git add .claude/ docs/memory-bank/ CLAUDE.md
git commit -m "chore: initialize Claude Code config"
```

## Roadmap et liens

**Aujourd'hui** : rules transverses (clean code, archi, sécu, tests, debug, git), rules infra, système Git complet (rule + templates + commands /commit /pr), memory-bank, philosophy, conventions.

**À venir** : commands `/plan`, `/review`, `/debug`, `/test` ; templates par domaine (`templates/test/`, `templates/plan/`) ; skills multi-étapes ; rules par langage et par outil ; script `install.sh` ; support OpenCode et Codex.

- Pourquoi ce repo et principes : [`docs/philosophy.md`](docs/philosophy.md)
- Conventions de format et nommage : [`docs/conventions.md`](docs/conventions.md)
- Mode d'emploi memory-bank : [`memory-bank/README.md`](memory-bank/README.md)
