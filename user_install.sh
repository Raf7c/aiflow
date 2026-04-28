#!/bin/sh
set -eu

src=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)/.claude/user
dst=$HOME/.claude

mkdir -p "$dst"
ln -snf "$src/CLAUDE.md" "$dst/CLAUDE.md"
ln -snf "$src/settings.json" "$dst/settings.json"
ln -snf "$src/commands" "$dst/commands"
ln -snf "$src/rules" "$dst/rules"
ln -snf "$src/templates" "$dst/templates"
