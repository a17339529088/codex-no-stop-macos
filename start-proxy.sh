#!/bin/zsh
set -euo pipefail
ROOT=${CODEX_NO_STOP_ROOT:-${0:A:h}}
: "${CODEX_RETRY_UPSTREAM:?Set CODEX_RETRY_UPSTREAM before starting the retry proxy}"
export CODEX_RETRY_PORT=${CODEX_RETRY_PORT:-8788}
export CODEX_RETRY_HOST=${CODEX_RETRY_HOST:-127.0.0.1}
exec node "$ROOT/proxy/server.js"
