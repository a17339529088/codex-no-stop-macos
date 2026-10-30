#!/bin/zsh
set -euo pipefail
ROOT=${0:A:h}
mkdir -p "$HOME/.local/bin"
chmod +x "$ROOT"/*.sh "$ROOT"/codex-retry "$ROOT"/bin/*.sh
ln -sf "$ROOT/codex-retry" "$HOME/.local/bin/codex-retry"
ln -sf "$ROOT/bin/start-codex-no-stop.sh" "$HOME/.local/bin/start-codex-no-stop"
ln -sf "$ROOT/bin/start-codex-desktop-no-stop.sh" "$HOME/.local/bin/start-codex-desktop-no-stop"
ln -sf "$ROOT/bin/restore-codex-no-stop.sh" "$HOME/.local/bin/restore-codex-no-stop"
ln -sf "$ROOT/bin/restore-codex-config.sh" "$HOME/.local/bin/restore-codex-config"
print "Installed codex-no-stop commands from $ROOT"
