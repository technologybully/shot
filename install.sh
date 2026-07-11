#!/usr/bin/env bash
# Symlink shot into ~/.local/bin
set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
mkdir -p "$HOME/.local/bin"
chmod +x "$repo_dir/shot"
ln -sf "$repo_dir/shot" "$HOME/.local/bin/shot"
echo "Installed: ~/.local/bin/shot -> $repo_dir/shot"

case ":$PATH:" in
    *":$HOME/.local/bin:"*) ;;
    *) echo "NOTE: ~/.local/bin is not on your PATH — add it to your shell profile." ;;
esac
