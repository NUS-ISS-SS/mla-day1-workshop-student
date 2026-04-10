#!/usr/bin/env bash
# cleanup.sh — Remove virtual environments and unnecessary files before Dropbox sync

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "Cleaning up: $SCRIPT_DIR"
echo ""

remove_if_exists() {
    local path="$1"
    if [ -e "$path" ]; then
        echo "  Removing: $path"
        rm -rf "$path" 2>/dev/null || true
        # Windows fallback when rm -rf is blocked by file locks (antivirus, Dropbox, etc.)
        if [ -e "$path" ]; then
            local winpath
            winpath="$(cygpath -w "$path" 2>/dev/null || echo "$path")"
            cmd //c rmdir //s //q "$winpath" 2>/dev/null || \
            powershell -Command "Remove-Item -Recurse -Force '$winpath'" 2>/dev/null || true
        fi
    fi
}

# Virtual environments
echo "[1/4] Removing virtual environments..."
remove_if_exists "ml-env"
remove_if_exists ".venv"
remove_if_exists "venv"
remove_if_exists "env"

# Python cache files
echo "[2/4] Removing Python cache files..."
find . -type d -name "__pycache__" -not -path "./.git/*" -exec rm -rf {} + 2>/dev/null || true
find . -type d -name ".mypy_cache" -not -path "./.git/*" -exec rm -rf {} + 2>/dev/null || true
find . -type f -name "*.pyc" -not -path "./.git/*" -delete 2>/dev/null || true
find . -type f -name "*.pyo" -not -path "./.git/*" -delete 2>/dev/null || true
echo "  Done."

# Jupyter checkpoints
echo "[3/4] Removing Jupyter checkpoints..."
find . -type d -name ".ipynb_checkpoints" -not -path "./.git/*" -exec rm -rf {} + 2>/dev/null || true
echo "  Done."

# Misc build artifacts
echo "[4/4] Removing build artifacts..."
remove_if_exists "dist"
remove_if_exists "build"
find . -type d -name "*.egg-info" -not -path "./.git/*" -exec rm -rf {} + 2>/dev/null || true
remove_if_exists "uv.lock"

echo ""
echo "Cleanup complete. Ready for Dropbox sync."
