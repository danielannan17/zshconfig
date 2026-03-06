#!/usr/bin/env bash

set -e

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
PLUGIN_DIR="$ZSH_CUSTOM/plugins"
BUILTIN_PLUGINS=(git z fzf)

mkdir -p "$PLUGIN_DIR"

PLUGINS=(
  you-should-use|https://github.com/MichaelAquilina/zsh-you-should-use
  zsh-ai|https://github.com/matheusml/zsh-ai
  zsh-autosuggestions|https://github.com/zsh-users/zsh-autosuggestions
  zsh-completions|https://github.com/zsh-users/zsh-completions
  zsh-syntax-highlighting|https://github.com/zsh-users/zsh-syntax-highlighting
  zsh-vi-mode|https://github.com/jeffreytse/zsh-vi-mode
)

INSTALLED=()

for entry in "${PLUGINS[@]}"; do
  NAME="${entry%%|*}"
  REPO="${entry##*|}"

  if [ -d "$PLUGIN_DIR/$NAME" ]; then
    echo "✔ $NAME already installed"
  else
    echo "→ Installing $NAME"
    git clone --depth=1 "$REPO" "$PLUGIN_DIR/$NAME"
  fi

  INSTALLED+=("$NAME")
done

# Apply patches (one patch file per plugin: patches/<plugin-name>.patch)
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PATCH_DIR="$SCRIPT_DIR/patches"

if [ -d "$PATCH_DIR" ]; then
  for patch in "$PATCH_DIR"/*.patch; do
    [ -f "$patch" ] || continue
    PLUGIN_NAME="$(basename "${patch%.patch}")"
    TARGET_DIR="$PLUGIN_DIR/$PLUGIN_NAME"
    if [ -d "$TARGET_DIR" ]; then
      if git -C "$TARGET_DIR" apply --check "$patch" 2>/dev/null; then
        echo "→ Applying patch: $PLUGIN_NAME"
        git -C "$TARGET_DIR" apply "$patch"
      else
        echo "✔ Patch already applied: $PLUGIN_NAME"
      fi
    else
      echo "⚠ No plugin found for patch: $PLUGIN_NAME"
    fi
  done
fi

echo ""
echo "----------------------------------"
echo "Add this to your ~/.zshrc:"
echo ""

printf "plugins=("
for p in "${BUILTIN_PLUGINS[@]}"; do
  printf "%s " "$p"
done
printf "\n"
for p in "${INSTALLED[@]}"; do
  printf "  %s\n" "$p"
done
printf ")\n"

echo ""
echo "⚠ Ensure 'zsh-syntax-highlighting' is the LAST plugin in the list."
echo "----------------------------------"