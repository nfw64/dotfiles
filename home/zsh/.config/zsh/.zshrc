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
### Old way ig
# if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
#     print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
#     command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
#     command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
#         print -P "%F{33} %F{34}Installation successful.%f%b" || \
#         print -P "%F{160} The clone has failed.%f%b"
# fi
#
# source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
# autoload -Uz _zinit
# (( ${+_comps} )) && _comps[zinit]=_zinit


ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

### End of Zinit's installer chunk

### Themes

#setopt promptsubst
#zinit snippet OMZL::git.zsh
#zinit snippet OMZT::lukerandall

###

### Plugins
# Load fast-syntax-highlighting first (it needs to be at the start)


# Enable the menu selection
zstyle ':completion:*' menu select

# Case-insensitive matching (type 'nano' and it finds 'Nano')
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Group results by category (e.g., Commands, Files, Aliases)
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'

# Use LS_COLORS in the completion menu (makes it colorful)
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

zinit wait lucid for \
    atinit"ZINIT[COMPINIT_OPTS]=-C" \
    zdharma-continuum/fast-syntax-highlighting

# Load completions with blockf so it doesn't mess with others
zinit wait lucid blockf for \
    zsh-users/zsh-completions

# Load autosuggestions last
zinit wait lucid atload"!_zsh_autosuggest_start" for \
    zsh-users/zsh-autosuggestions


### Autopair

zinit ice lucid wait"5"
zinit light hlissner/zsh-autopair

###

### History files
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zhistory"
HISTSIZE=290000
SAVEHIST=$HISTSIZE
###

# Exports

export PATH="$HOME/.local/bin/:$HOME/.config/npm/bin:$PATH"

export XDG_STATE_HOME="$HOME/.local/state"
export XDG_SRC_HOME="$HOME/.local/src"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"

#

### Aliases

source $XDG_CONFIG_HOME/zsh/.zsh_aliases

###

### Bindkey

bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
eval "$(starship init zsh)"
eval "$(pay-respects zsh)"
