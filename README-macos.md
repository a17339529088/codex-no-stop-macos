# macOS scripts

- `start-proxy.sh`: start the retry proxy after setting `CODEX_RETRY_UPSTREAM`.
- `stop-proxy.sh`: stop the local retry proxy.
- `codex-retry`: run the normal Codex CLI with the existing ChatGPT account and
  retry only transient capacity/service failures (up to five attempts by
  default). Set `CODEX_RETRY_MAX_ATTEMPTS` to change the bound. This is the
  recommended mode and does not replace the configured provider.
- `CODEX_NO_STOP_MODE=proxy codex-retry`: opt into the legacy local proxy
  mode. This mode is for API-key providers and is not used for the ChatGPT
  account path.
- `restore-config.sh`: restore the saved Codex configuration.

The saved configuration is `config.toml.backup`. Before restoring, the current config is copied to a timestamped `config.toml.before-restore.*` file.
