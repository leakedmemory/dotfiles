export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="spaceship"

export BAT_THEME="OneHalfLight"

export TERM="screen-256color"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting tmux)

ZSH_TMUX_AUTOSTART=true

source $ZSH/oh-my-zsh.sh

# User configuration

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/lohanyrvine/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/lohanyrvine/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/lohanyrvine/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/lohanyrvine/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
