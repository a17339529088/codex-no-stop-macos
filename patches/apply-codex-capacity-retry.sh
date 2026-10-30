#!/bin/sh
set -eu

repo_dir=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
patch_file="$repo_dir/patches/codex-capacity-retry.patch"

git -C "$repo_dir" apply --check "$patch_file"
git -C "$repo_dir" apply "$patch_file"
printf '%s\n' "Codex capacity retry patch applied. Rebuild the cockpit-cliproxy sidecar before launching Cockpit."
