set shell := ["bash", "-eu", "-o", "pipefail", "-c"]

@default:
  just --list

@install:
  uv sync

@dev:
  uv sync --dev

@run:
  if [ -x .venv/bin/python ]; then PYTHONPATH=src .venv/bin/python -m ai_workshop; else PYTHONPATH=src python -m ai_workshop; fi

@test:
  if [ -x .venv/bin/python ]; then PYTHONPATH=src .venv/bin/python -m pytest; else PYTHONPATH=src python -m pytest; fi
