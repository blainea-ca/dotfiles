#!/bin/sh
# Pre-source-state hook: ensure 1Password and 1Password CLI are available
# before chezmoi reads templates (which call onepasswordDocument / onepasswordRead).
#
# Wired up via .chezmoi.toml.tmpl:
#   [hooks.read-source-state.pre]
#     command = ".chezmoiscripts/install-1password.sh"
#
# Cannot use chezmoi template variables — runs before the template engine.
set -e

if ! command -v brew >/dev/null 2>&1; then
  echo "ERROR: Homebrew is required but was not found in PATH." >&2
  echo "Install it first: https://brew.sh" >&2
  exit 1
fi

if ! command -v op >/dev/null 2>&1; then
  echo "==> Installing 1Password and 1Password CLI..."
  brew install --cask 1password 1password-cli

  cat <<'MSG'

==> 1Password and 1Password CLI installed.

Next steps (one-time setup):
  1. Open 1Password and sign in.
  2. In 1Password: Settings -> Developer
       - Enable "Integrate with 1Password CLI"
       - Enable "Use the SSH agent"
  3. Re-run: chezmoi apply

MSG
  exit 1
fi
