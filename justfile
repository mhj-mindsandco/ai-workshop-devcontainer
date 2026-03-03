set shell := ["bash", "-eu", "-o", "pipefail", "-c"]

@default:
  just --list

@install:
  uv venv .venv
  uv pip install --python .venv/bin/python -r requirements.txt

@dev:
  uv venv .venv
  uv pip install --python .venv/bin/python -r requirements.txt
  uv pip install --python .venv/bin/python ruff black pytest mypy

@run:
  if [ -x .venv/bin/python ]; then PYTHONPATH=src .venv/bin/python -m ai_workshop; else PYTHONPATH=src python -m ai_workshop; fi

@test:
  if [ -x .venv/bin/python ]; then PYTHONPATH=src .venv/bin/python -m pytest; else PYTHONPATH=src python -m pytest; fi
