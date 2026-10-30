#!/bin/zsh
set -euo pipefail
ROOT=${CODEX_NO_STOP_ROOT:-/Volumes/SSD/codex-no-stop}
HOST=${CODEX_RETRY_HOST:-127.0.0.1}
PORT=${CODEX_RETRY_PORT:-8788}

if curl -fsS "http://${HOST}:${PORT}/__health" >/dev/null 2>&1; then
  "$ROOT/stop-proxy.sh" >/dev/null 2>&1 || true
fi
exec "$ROOT/restore-config.sh"
