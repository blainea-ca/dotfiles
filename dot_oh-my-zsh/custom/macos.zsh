# Aliases
alias ls='eza -h'
alias ll='eza -lh'
alias la='eza -lha'

alias youtube-dl="yt-dlp"
alias brewfile-update="brew bundle dump --describe -f --file ~/.Brewfile"
alias brewfile-install="brew bundle install --file=~/.Brewfile"

# GYB - Got Your Back (GYB) is a command line tool for backing up your Gmail messages to your local computer.
# https://github.com/GAM-team/got-your-back
alias gyb="~/bin/gyb/gyb"
# Upgrade GYB
alias upgrade_gyb="bash <(curl -s -S -L https://gyb-shortn.jaylee.us/gyb-install) -l"

# GAM - A command line tool for Google Workspace admins to manage domain and user settings quickly and easily.
# https://github.com/GAM-team/GAM
alias gam="~/bin/gam7/gam"
# Upgrade GAM
alias upgrade_gam="bash <(curl -s -S -L https://git.io/gam-install) -l"

# Podman Configuration
export PODMAN_COMPOSE_WARNING_LOGS=false

# Set default editor to nano
export EDITOR=nano
export VISUAL="$EDITOR"

# 1Password plugins (created by `op plugin init <plugin>`; guarded for fresh machines)
[ -f $HOME/.config/op/plugins.sh ] && source $HOME/.config/op/plugins.sh
