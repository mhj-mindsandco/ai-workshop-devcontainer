# AI Workshop (Python)

Minimal scaffolding for a Python-based AI workshop project.

## Quick start

```bash
just dev
just run
just test
```

If you prefer not to use `just`, you can run the equivalent commands manually:

```bash
python -m venv .venv
.venv/bin/python -m pip install --upgrade pip
.venv/bin/python -m pip install -r requirements.txt
PYTHONPATH=src .venv/bin/python -m ai_workshop
PYTHONPATH=src .venv/bin/python -m pytest
```

## Devcontainer

This repo includes a minimal devcontainer in `.devcontainer/` for a ready-to-code setup.

- Base image: `mcr.microsoft.com/devcontainers/python:3.12`
- Installed tools: `just`, `opencode`, `build-essential`, `curl`
- Startup bootstrap: `postStartCommand` runs `.devcontainer/post-start.sh` to repair volume ownership and run `just dev` if `.venv` is missing
- Named volumes are used for `.venv` and pip cache to speed up rebuilds

### OpenCode in the devcontainer

To reuse host OpenCode setup in-container, these host paths are bind-mounted:

- `~/.config/opencode` -> `/home/vscode/.config/opencode`
- `~/.local/share/opencode` -> `/home/vscode/.local/share/opencode`

This keeps your OpenCode config and auth credentials available inside the devcontainer.

### Python env caching

The devcontainer mounts named volumes for Python caching:

- `ai-workshop-venv` -> `${containerWorkspaceFolder}/.venv`
- `ai-workshop-pip-cache` -> `/home/vscode/.cache/pip`

This preserves the virtualenv and downloaded wheels across container rebuilds/reopens.

### Git config in the devcontainer

VS Code devcontainers typically provision Git identity/auth automatically (for example via
`~/.gitconfig` and credential helper wiring), so no explicit Git config mount is required.
If host Git settings change later, rebuild/reopen the container to refresh.

## Project layout

- `.devcontainer` - devcontainer image and container config
- `justfile` - convenience commands (`dev`, `run`, `test`)
- `src/ai_workshop` - minimal package and entrypoint
- `tests` - placeholder for tests

---

## Disclaimer

Note: This starter template was generated with OpenCode using the GPT-5.3 Codex model, then reviewed and iterated in this repository.
