eval "$(fnm env --use-on-cd)"
export GPG_TTY=$(tty)

export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

# Set XDG location of Emacs Spacemacs configuration
export SPACEMACSDIR="$XDG_CONFIG_HOME/spacemacs"

alias ghb="github-branch"

export SDKMAN_DIR=$(brew --prefix sdkman-cli)/libexec
[[ -s "${SDKMAN_DIR}/bin/sdkman-init.sh" ]] && source "${SDKMAN_DIR}/bin/sdkman-init.sh"

export PATH=$PATH:/usr/local/bin/google-cloud-sdk/bin
