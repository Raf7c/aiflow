#!/bin/sh
# Symlinks claude/user/* -> ~/.claude/*
# Sauvegarde un éventuel fichier ou dossier réel existant dans ~/.claude/backups/
# avant écrasement.
set -eu

src=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)/claude/user
dst=$HOME/.claude
backup_dir="$dst/backups"
ts=$(date +%s)

if [ ! -d "$dst" ]; then
  printf '%s\n' "Erreur: $dst n'existe pas."
  printf '%s\n' "Installe Claude Code d'abord, puis relance ce script."
  exit 1
fi

if [ ! -d "$backup_dir" ]; then
  mkdir -p "$backup_dir"
  printf '[create] %s\n' "$backup_dir"
fi

for entry in CLAUDE.md settings.json commands rules templates; do
  source_path="$src/$entry"
  target_path="$dst/$entry"

  if [ -e "$target_path" ] && [ ! -L "$target_path" ]; then
    backup_path="$backup_dir/$entry.bak.$ts"
    mv "$target_path" "$backup_path"
    printf '[backup] %s -> %s\n' "$target_path" "$backup_path"
  fi

  ln -snf "$source_path" "$target_path"
  printf '[link] %s -> %s\n' "$target_path" "$source_path"
done