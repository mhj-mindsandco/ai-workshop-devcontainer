FROM mcr.microsoft.com/devcontainers/python:3.12

ENV PATH="/home/vscode/.local/bin:/home/vscode/.opencode/bin:${PATH}"

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    just \
  && mkdir -p /home/vscode/.local/share/opencode /home/vscode/.config/opencode \
  && chown -R vscode:vscode /home/vscode/.local /home/vscode/.config \
  && su vscode -c "curl -LsSf https://astral.sh/uv/install.sh | sh" \
  && su vscode -c "curl -fsSL https://opencode.ai/install | bash -s -- --no-modify-path" \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
