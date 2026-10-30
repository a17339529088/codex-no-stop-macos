#!/bin/zsh
set -euo pipefail
ROOT=${CODEX_NO_STOP_ROOT:-/Volumes/SSD/codex-no-stop}
CONFIG=${CODEX_HOME:-$HOME/.codex}/config.toml
STAMP=$(date +%Y%m%d-%H%M%S)

mkdir -p "${CONFIG:h}"
cp -p "$CONFIG" "$CONFIG.before-no-stop.$STAMP" 2>/dev/null || true

python3 - "$CONFIG" <<'PY'
from pathlib import Path
import sys
p = Path(sys.argv[1])
s = p.read_text()
if 'model_provider = "codex_no_stop"' not in s:
    s = 'model_provider = "codex_no_stop"\n' + s
if '[model_providers.codex_no_stop]' not in s:
    s += '''\n[model_providers.codex_no_stop]\nname = "codex-no-stop"\nbase_url = "http://127.0.0.1:8788/v1"\nwire_api = "responses"\nrequires_openai_auth = false\n\n'''
p.write_text(s)
PY

if ! curl -fsS http://127.0.0.1:8788/__health >/dev/null 2>&1; then
  CODEX_RETRY_UPSTREAM=https://api.openai.com/v1 CODEX_RETRY_PORT=8788 CODEX_RETRY_HOST=127.0.0.1 \
    nohup node "$ROOT/proxy/server.js" >>"$ROOT/proxy/proxy.log" 2>&1 &
fi
open -a "/Applications/ChatGPT.app"
