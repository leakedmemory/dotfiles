source ~/.zsh/catppuccin_latte-zsh-syntax-highlighting.zsh

export ZSH="$HOME/.oh-my-zsh"

export VISUAL=nvim
export EDITOR=$VISUAL
export XDG_CONFIG_HOME=$HOME/.config

export PATH=$PATH:$HOME/.local/bin

plugins=(git zsh-autosuggestions zsh-syntax-highlighting tmux)

ZSH_TMUX_AUTOSTART=true

source $ZSH/oh-my-zsh.sh

eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"
