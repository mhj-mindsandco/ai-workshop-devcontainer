set shell := ["bash", "-eu", "-o", "pipefail", "-c"]

@default:
  just --list

@install:
  python -m pip install -r requirements.txt

@dev:
  python -m venv .venv
  .venv/bin/python -m pip install --upgrade pip
  .venv/bin/python -m pip install -r requirements.txt
  .venv/bin/python -m pip install ruff black pytest mypy

@run:
  if [ -x .venv/bin/python ]; then PYTHONPATH=src .venv/bin/python -m ai_workshop; else PYTHONPATH=src python -m ai_workshop; fi

@test:
  if [ -x .venv/bin/python ]; then PYTHONPATH=src .venv/bin/python -m pytest; else PYTHONPATH=src python -m pytest; fi
