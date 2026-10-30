#!/bin/zsh
set -euo pipefail
ROOT=${CODEX_NO_STOP_ROOT:-/Volumes/SSD/codex-no-stop}
: "${CODEX_RETRY_UPSTREAM:?请先设置 CODEX_RETRY_UPSTREAM，例如 https://your-provider.example/v1}"
export CODEX_NO_STOP_ROOT="$ROOT"
exec "$ROOT/start-proxy.sh"
