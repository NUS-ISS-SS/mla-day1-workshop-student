#!/usr/bin/env bash
# setup.sh — Create virtual environment and install packages for the MLA Day 1 workshop

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

VENV_DIR="ml-env"
KERNEL_NAME="ml-env"
KERNEL_DISPLAY="ML Workshop (ml-env)"

echo "=== MLA Day 1 Workshop — Dev Environment Setup ==="
echo "Working directory: $SCRIPT_DIR"
echo ""

# ── Step 1: Verify Python ────────────────────────────────────────────────────
echo "[1/4] Checking Python version..."

# Prefer python3, fall back to python
if command -v python3 &>/dev/null; then
    PYTHON=python3
elif command -v python &>/dev/null; then
    PYTHON=python
else
    echo "ERROR: No Python interpreter found. Install Python 3.12+ and try again." >&2
    exit 1
fi

PY_VERSION=$("$PYTHON" -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")
PY_MAJOR=$("$PYTHON" -c "import sys; print(sys.version_info.major)")
PY_MINOR=$("$PYTHON" -c "import sys; print(sys.version_info.minor)")

echo "  Found: $PYTHON ($PY_VERSION)"

if [ "$PY_MAJOR" -lt 3 ] || { [ "$PY_MAJOR" -eq 3 ] && [ "$PY_MINOR" -lt 12 ]; }; then
    echo "  WARNING: Python 3.12+ is recommended (requirements.txt targets >=3.12)."
    echo "  Proceeding with $PY_VERSION — some packages may fail to install."
fi

# ── Step 2: Create virtual environment ───────────────────────────────────────
echo ""
echo "[2/4] Creating virtual environment '$VENV_DIR'..."

if [ -d "$VENV_DIR" ]; then
    echo "  '$VENV_DIR' already exists — skipping creation."
else
    "$PYTHON" -m venv "$VENV_DIR"
    echo "  Created '$VENV_DIR'."
fi

# Determine activation path (Unix vs Windows/Git-Bash)
if [ -f "$VENV_DIR/bin/activate" ]; then
    ACTIVATE="$VENV_DIR/bin/activate"
    VENV_PYTHON="$VENV_DIR/bin/python"
else
    ACTIVATE="$VENV_DIR/Scripts/activate"
    # Windows venv creates python.exe, not python
    if [ -f "$VENV_DIR/Scripts/python.exe" ]; then
        VENV_PYTHON="$VENV_DIR/Scripts/python.exe"
    else
        VENV_PYTHON="$VENV_DIR/Scripts/python"
    fi
fi

# shellcheck disable=SC1090
source "$ACTIVATE"
echo "  Activated '$VENV_DIR'."

# ── Step 3: Install packages ─────────────────────────────────────────────────
echo ""
echo "[3/4] Installing packages..."

# Use 'python -m pip' to avoid Windows lock on the pip executable itself
"$VENV_PYTHON" -m pip install --upgrade pip --quiet || true

"$VENV_PYTHON" -m pip install -r requirements.txt --quiet
echo "  All packages installed."

# ── Step 4: Register Jupyter kernel ──────────────────────────────────────────
echo ""
echo "[4/4] Registering Jupyter kernel '$KERNEL_NAME'..."

"$VENV_PYTHON" -m ipykernel install --user \
    --name "$KERNEL_NAME" \
    --display-name "$KERNEL_DISPLAY"

echo "  Kernel '$KERNEL_DISPLAY' registered."

# ── Done ─────────────────────────────────────────────────────────────────────
echo ""
echo "=== Setup complete ==="
echo ""
echo "To run the notebooks:"
echo "  source $ACTIVATE"
echo "  jupyter notebook"
echo ""
echo "Then open Demo-housing.ipynb or Test-housing.ipynb and select"
echo "kernel → '$KERNEL_DISPLAY'."
