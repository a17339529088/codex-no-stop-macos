#!/bin/zsh
set -euo pipefail
ROOT=${CODEX_NO_STOP_ROOT:-/Volumes/SSD/codex-no-stop}
exec "$ROOT/restore-config.sh" "$@"
