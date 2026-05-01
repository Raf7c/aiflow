# aiflow

Configurations centralisées pour mes outils IA. Pour l'instant : Claude Code. À venir : Codex, OpenCode, etc.

## Structure

```
aiflow/
├── claude/
│   └── user/                  # → symlinké vers ~/.claude/ par user_install.sh
│       ├── CLAUDE.md          # profil, communication, comportements (zéro @-import)
│       ├── settings.json      # env, permissions deny/ask/allow
│       ├── commands/          # /commit, /pr — slash commands
│       ├── rules/             # rules de cadrage (chargement par paths: ou à la demande)
│       └── templates/git/     # squelettes commit / PR
├── memory-bank/               # TEMPLATES à copier dans chaque projet
└── user_install.sh            # symlinks idempotents avec backup
```

## Philosophie

- **Une seule source de vérité par sujet.** Chaque règle vit dans un fichier.
- **Pas de chargement automatique global.** `~/.claude/CLAUDE.md` reste minimal et n'@-importe aucune règle de cadrage. Les règles sont chargées à la demande, soit par filtrage de chemin (`paths:` frontmatter), soit explicitement via une slash command.
- **Deny-first sur les Bash.** La liste `permissions.deny` couvre les opérations destructives, l'extraction de secrets, les écritures système. Tout ce qui sort de la deny-list passe par `ask` ou `allow`.
- **Pas d'agents ni de skills pour l'instant.** Volontaire. Sera ajouté quand les besoins seront clairs.

## Installation

```sh
./user_install.sh             # crée les symlinks dans ~/.claude/
./user_install.sh --dry-run   # affiche ce qui serait fait sans rien modifier
```

Le script sauvegarde tout fichier `~/.claude/<nom>` existant non-symlink en `~/.claude/<nom>.bak.<timestamp>` avant de poser le symlink.

## Rules

Huit fichiers dans `claude/user/rules/`. Toutes auto-activées par `paths:` (globs de **dossiers** plutôt que d'extensions, pour rester courts et lisibles). `security` et `architecture` sont split en `-app` / `-infra` pour ne charger que la moitié pertinente selon le contexte.

| Fichier | Auto-activée quand Claude touche… |
|---|---|
| `clean-code.md` | un dossier source standard (`src/`, `lib/`, `app/`, `internal/`, `pkg/`, `cmd/`) |
| `debugging.md` | un dossier source ou test |
| `testing.md` | un fichier ou dossier de test (`tests/`, `*.test.*`, `*.spec.*`, etc.) |
| `security-app.md` | dossiers source ou auth (validation entrées, SQL, secrets) |
| `security-infra.md` | infra, conteneurs, k8s, CI/CD (privilèges, isolation) |
| `architecture-app.md` | dossiers source (couches, ports/adapters) |
| `architecture-infra.md` | infra, conteneurs, k8s, CI/CD (composants, déclaratif) |
| `git-workflow.md` | invoquée explicitement par `/commit` et `/pr` |

### Limitation connue

Le mécanisme `paths:` au niveau **user** (`~/.claude/rules/`) est documenté comme partiellement buggé par Anthropic ([issue #21858](https://github.com/anthropics/claude-code/issues/21858), [#23478](https://github.com/anthropics/claude-code/issues/23478)) : les règles peuvent ne pas se charger automatiquement de façon fiable. Le format est conforme pour fonctionner dès que les bugs sont corrigés.

### Convention des paths

Globs basés sur les **dossiers** standards du projet plutôt que sur les extensions de fichiers. Couvre 95 % des projets modernes (Python, Node, Go, Rust, Java/Kotlin, Ruby). Pour un projet à structure plate, tu pourras ajouter une règle au niveau projet (`<projet>/.claude/rules/`).

## Slash commands

| Commande | Rôle |
|---|---|
| `/commit` | Génère 1-3 messages Conventional Commits depuis le diff staged |
| `/pr` | Compose titre et description PR depuis le diff de branche |

Toutes deux @-importent uniquement leurs templates et rules à l'invocation, jamais en contexte global.

## Memory-bank

`memory-bank/{overview,architecture,decisions}.md` sont des **templates** — ils ne décrivent pas ce repo, ils sont à copier dans chaque projet pour amorcer sa propre memory-bank. L'en-tête de chaque fichier le précise.

## Multi-outils (à venir)

La même approche sera dupliquée pour Codex, OpenCode, etc., dans des dossiers frères de `claude/`. Le contenu transverse des règles est volontairement écrit en markdown directif portable, pour rester réutilisable.

## License

MIT — voir [LICENSE](./LICENSE).
