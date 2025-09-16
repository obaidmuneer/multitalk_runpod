#!/bin/bash
set -euo pipefail

VOLUME="/runpod-volume"
VENV_DIR="$VOLUME/ComfyUI/venv"

cd "$VOLUME"

if [ -x "$VENV_DIR/bin/python" ]; then
  echo "[info] Using venv at $VENV_DIR"
  PY="$VENV_DIR/bin/python"
else
  echo "[warn] No usable venv found, falling back to system python"
  PY="python"
fi

# Optional: sanity prints
$PY -V || true
which $PY || true

exec $PY handler.py
