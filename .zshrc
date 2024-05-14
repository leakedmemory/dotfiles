if [ -f $HOME/.zsh/env_exports.zsh ]; then
    source ~/.zsh/zshalias
fi
source $HOME/.zsh/catppuccin_latte-zsh-syntax-highlighting.zsh

export ZSH="$HOME/.oh-my-zsh"

export VISUAL=nvim
export EDITOR=$VISUAL
export XDG_CONFIG_HOME=$HOME/.config

export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc

export PATH=$PATH:$HOME/.local/bin

plugins=(git zsh-autosuggestions zsh-syntax-highlighting tmux)

ZSH_TMUX_AUTOSTART=true

source $ZSH/oh-my-zsh.sh

eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"
