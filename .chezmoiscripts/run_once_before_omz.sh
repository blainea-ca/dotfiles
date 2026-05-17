#!/bin/sh
# Install Oh My Zsh if not present. Runs once per machine, before chezmoi
# applies any files — so ~/.oh-my-zsh exists before .zshrc lands and before
# .chezmoiexternal.toml clones plugins into ~/.oh-my-zsh/custom/.
#
# KEEP_ZSHRC=yes  — don't overwrite the .zshrc chezmoi is about to install
# RUNZSH=no       — don't auto-launch a new zsh shell at end of installer
# CHSH=no         — don't prompt to change the default shell
set -e

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "==> Installing Oh My Zsh..."
  RUNZSH=no CHSH=no KEEP_ZSHRC=yes \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
