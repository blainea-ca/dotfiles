# github.com/blainea-ca/dotfiles

blainea-ca's dotfiles, managed with [`chezmoi`](https://www.chezmoi.io)

Install them with:

    chezmoi init --apply blainea-ca

Personal secrets are stored in [1Password](https://1password.com) and you'll
need the [1Password CLI](https://developer.1password.com/docs/cli/) installed.

Login to 1Password with:

    eval $(op signin)

Software managed with [`brew`](https://brew.sh)

Install with:

    brew bundle install --file=~/.Brewfile

## New macOS setup

Install Homebrew:

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

Install 1Password, 1Password-CLI, and Chezmoi

    brew install 1password 1password-cli chezmoi

Personal secrets are stored in [1Password](https://1password.com) and you'll
need the [1Password CLI](https://developer.1password.com/docs/cli/) installed.

Login to 1Password with:

    eval $(op signin)

Install the 1Password AWS CLI plugin:

    op plugin init aws

Install Oh My Zsh:

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

Install Powerlevel10k theme for Zsh:

    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

Install Zsh Syntax Highlighting plugin

    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

Install Zsh Auto Suggestions plugin

    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

Install dotfiles with [`chezmoi`](https://www.chezmoi.io):

    chezmoi init --apply blainea-ca

Install Software managed with [`brew`](https://brew.sh):

    brewfile-install