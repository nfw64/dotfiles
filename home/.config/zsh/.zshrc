# Runs fastfetch everytime terminal launches (duh), if not installed then install
if command -v fastfetch > /dev/null; then
    fastfetch --logo none
else
    echo "Fastfetch not found. Installing..."
    if command -v pacman > /dev/null; then
        sudo pacman -S --noconfirm fastfetch
    elif command -v apt > /dev/null; then
        sudo apt update && sudo apt install -y fastfetch
    elif command -v dnf > /dev/null; then
        sudo dnf install -y fastfetch
    elif command -v brew > /dev/null; then
        brew install fastfetch
    fi
    fastfetch --logo none
fi

export VISUAL=nvim
export EDITOR="$VISUAL"

### Zinit's installer
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

### Plugins
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

zinit wait lucid for \
    atinit"ZINIT[COMPINIT_OPTS]=-C" \
    zdharma-continuum/fast-syntax-highlighting

zinit wait lucid blockf for \
    zsh-users/zsh-completions

zinit wait lucid atload"!_zsh_autosuggest_start" for \
    zsh-users/zsh-autosuggestions

zinit ice lucid wait"5"
zinit light hlissner/zsh-autopair

### History files

[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zhistory"
HISTSIZE=290000
SAVEHIST=$HISTSIZE

# Exports

export PATH="$HOME/.local/bin/:$HOME/.config/npm/bin:$PATH"

export XDG_STATE_HOME="$HOME/.local/state"
export XDG_SRC_HOME="$HOME/.local/src"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

### Misc

source $XDG_CONFIG_HOME/zsh/.zsh_aliases
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line

### End of .zshrc

eval "$(starship init zsh)"
eval "$(pay-respects zsh)"
eval "$(zoxide init zsh)"
