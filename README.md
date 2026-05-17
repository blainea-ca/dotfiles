# github.com/blainea-ca/dotfiles

blainea-ca's dotfiles, managed with [`chezmoi`](https://www.chezmoi.io).

Personal secrets live in [1Password](https://1password.com); the
[1Password CLI](https://developer.1password.com/docs/cli/) is required to
render templates that reference vaulted items.

## New macOS setup

Prerequisites: [Homebrew](https://brew.sh).

Install Homebrew:

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

Install chezmoi:

    brew install chezmoi

Initialize - this clones the repo, the pre-source-state hook installs
1Password and 1Password CLI, then exits with sign-in instructions:

    chezmoi init --apply blainea-ca

Sign in to 1Password:

1. Open 1Password and sign in.
2. In 1Password → Settings → Developer, enable:
   - Integrate with 1Password CLI
   - Use the SSH agent
   - Then run `eval $(op signin)`

Install the 1Password AWS CLI plugin:

    op plugin init aws

Apply the rest of the templates (op can now resolve secrets):

    chezmoi apply

Fetch SSH public key files:

    op read "op://Private/Example SSH Key/public key" > ~/.ssh/id_example.pub

Install software managed with [`brew`](https://brew.sh):

    brewfile-install

## What chezmoi automates

- 1Password + 1Password CLI - installed by
  [`.install-1password.sh`](.install-1password.sh) via the
  `read-source-state.pre` hook configured in
  [`.chezmoi.toml.tmpl`](.chezmoi.toml.tmpl).
- Oh My Zsh - installed by
  [`.chezmoiscripts/run_once_before_omz.sh`](.chezmoiscripts/run_once_before_omz.sh)
  if `~/.oh-my-zsh` doesn't exist. Runs before any files are applied so the
  framework exists before `.zshrc` lands and before externals clone plugins.
- powerlevel10k, zsh-syntax-highlighting, zsh-autosuggestions - cloned
  into `~/.oh-my-zsh/custom/` by
  [`.chezmoiexternal.toml`](.chezmoiexternal.toml) (refreshed weekly).
- Templated files (`~/.ssh/config`, `~/.gam/*`, `~/.gitconfig`, etc.) -
  rendered from 1Password on `chezmoi apply`.

## Updating `~/.ssh/config`

The SSH config lives in a 1Password Document named `chezmoi-ssh-config`, referenced from [`dot_ssh/config.tmpl`](dot_ssh/config.tmpl). 

Push updates from local file to 1Password

    op document edit "chezmoi-ssh-config" ~/.ssh/config
