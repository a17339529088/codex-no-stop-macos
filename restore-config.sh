#!/bin/zsh
set -euo pipefail
ROOT=${CODEX_NO_STOP_ROOT:-${0:A:h}}
CODEX_HOME_DIR=${CODEX_HOME:-$HOME/.codex}
TARGET="$CODEX_HOME_DIR/config.toml"
BACKUP="$ROOT/config.toml.backup"
if [[ ! -f "$BACKUP" ]]; then
  print -u2 "Backup not found: $BACKUP"
  exit 1
fi
mkdir -p "$CODEX_HOME_DIR"
if [[ -f "$TARGET" ]]; then
  cp -p "$TARGET" "$TARGET.before-restore.$(date +%Y%m%d-%H%M%S)"
fi
cp -p "$BACKUP" "$TARGET"
chmod 600 "$TARGET"
print "Restored $TARGET from $BACKUP"
