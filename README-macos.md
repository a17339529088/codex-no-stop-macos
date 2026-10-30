# macOS scripts

- `start-proxy.sh`: start the retry proxy after setting `CODEX_RETRY_UPSTREAM`.
- `stop-proxy.sh`: stop the local retry proxy.
- `codex-retry`: run Codex through the local retry proxy.
- `restore-config.sh`: restore the saved Codex configuration.

The saved configuration is `config.toml.backup`. Before restoring, the current config is copied to a timestamped `config.toml.before-restore.*` file.
