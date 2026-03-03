#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
workspace_dir="$(cd "${script_dir}/.." && pwd)"

sudo mkdir -p "${workspace_dir}/.venv" /home/vscode/.cache/uv /home/vscode/.cache/opencode
sudo chown -R vscode:vscode "${workspace_dir}/.venv" /home/vscode/.cache

if [ ! -x "${workspace_dir}/.venv/bin/python" ]; then
  cd "${workspace_dir}"
  just dev
fi
