# github.com/blainea-ca/dotfiles

Blaine Aldridge's dotfiles, managed with [`chezmoi`](https://www.chezmoi.io)

Install them with:

    chezmoi init --apply blainea-ca

Personal secrets are stored in [1Password](https://1password.com) and you'll
need the [1Password CLI](https://developer.1password.com/docs/cli/) installed.
Login to 1Password with:

    eval $(op signin)

Software managed with [`brew`](https://brew.sh)

Install with:

    brew bundle install --file=~/.Brewfile
