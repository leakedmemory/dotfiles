ZSH="$HOME/.zsh"

source $ZSH/aliases.zsh

export VISUAL=nvim
export EDITOR=$VISUAL
export XDG_CONFIG_HOME=$HOME/.config

export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc

export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/.local/share/bob/nvim-bin

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

# KEYBINDS

# [Ctrl-RightArrow] - move forward one word
bindkey "^[[1;5C" forward-word
# [Ctrl-LeftArrow] - move backward one word
bindkey "^[[1;5D" backward-word
# [Ctrl-Delete] - delete forward one word
bindkey "^[[3;5~" kill-word
# [Ctrl-Backspace] - delete backward one word
bindkey "^H" backward-kill-word

# HISTORY

HISTSIZE=5000
HISTFILE=$HOME/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory  # append command to history rather than overwriting
setopt sharehistory  # share history across sessions
setopt hist_ignore_space  # don't append command if it starts with space
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups  # ignore dups when searching command

# INTEGRATIONS

## TMUX

if [ -z "$TMUX" ]; then  # start tmux session if none is found
    tmux attach -t TMUX || tmux new -s TMUX
fi

exit_or_kill_tmux() {
    if [ -n "$TMUX" ]; then
        n_panes=$(tmux list-panes | wc -l)
        if [ "$n_panes" -eq 1 ]; then
            tmux kill-session
        fi
    fi
}
zle -N exit_or_kill_tmux
# [Ctrl-D]
bindkey "^D" exit_or_kill_tmux

# prompt
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/config.omp.toml)"
# better `cd`
eval "$(zoxide init --cmd cd zsh)"
