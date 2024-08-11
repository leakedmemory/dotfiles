ZSH="$HOME/.zsh"
source $ZSH/catppuccin_latte-zsh-syntax-highlighting.zsh
source $ZSH/aliases.zsh

export VISUAL=nvim
export EDITOR=$VISUAL
export XDG_CONFIG_HOME=$HOME/.config

export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc

export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:/usr/local/go/bin

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
# nvm end

# pnpm
export PNPM_HOME="/home/leaked/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
# download if not found
if [ ! -d $ZINIT_HOME ]; then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME" --depth=1
fi
source "${ZINIT_HOME}/zinit.zsh"

# plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# load completions
autoload -U compinit && compinit

# completion styling
zstyle ":completion:*" matcher-list "m:{a-z}={A-Za-z}"

# replay cached completions
zinit cdreplay -q

# keybinds
bindkey "[[A" history-search-backward
bindkey "[[B" history-search-forward

# history
HISTSIZE=5000
HISTFILE=$HOME/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory  # append command to history rather than overwriting
setopt sharehistory  # share history accross sessions
setopt hist_ignore_space  # don't append command if it starts with space
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups  # ignore dups when searching command

# integrations

## tmux
if [ -z "$TMUX" ]; then  # start tmux session if none is found
    tmux attach -t TMUX || tmux new -s TMUX
fi

### ctrl+d behavior
exit_or_kill_tmux() {
    if [ -n "$TMUX" ]; then
        n_panes=$(tmux list-panes | wc -l)
        if [ "$n_panes" -eq 1 ]; then
            tmux kill-session
        fi
    fi
}
zle -N exit_or_kill_tmux
bindkey "^D" exit_or_kill_tmux

eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/config.omp.toml)"
eval "$(zoxide init --cmd cd zsh)"
