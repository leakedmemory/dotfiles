source ~/.zsh/catppuccin_latte-zsh-syntax-highlighting.zsh

export ZSH="$HOME/.oh-my-zsh"

export VISUAL=nvim
export EDITOR=$VISUAL
export XDG_CONFIG_HOME=$HOME/.config

export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc

export PATH=$PATH:$HOME/.local/bin

# added when installing nodejs
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

plugins=(git zsh-autosuggestions zsh-syntax-highlighting tmux)

ZSH_TMUX_AUTOSTART=true

source $ZSH/oh-my-zsh.sh

eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"
