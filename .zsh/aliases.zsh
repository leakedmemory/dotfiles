function v_func() {
  if [[ ! -n $1 ]]; then
    nvim .
  else
    nvim $1
  fi
}
alias v=v_func

function nvrc_func() {
    SAVE_PWD=($PWD)
    cd $HOME/.config/nvim && nvim . && cd $SAVE_PWD
}
alias nvrc=nvrc_func
alias aliases="nvim $HOME/.zsh/aliases.zsh && source $HOME/.zsh/aliases.zsh"
alias termrc="nvim $HOME/.config/kitty/kitty.conf"
alias tmuxrc="nvim $HOME/.config/tmux/tmux.conf && tmux source $HOME/.config/tmux/tmux.conf"
alias zshrc="nvim $HOME/.zshrc && source $HOME/.zshrc"
alias promprc="nvim $HOME/.config/ohmyposh/config.omp.toml"

alias ..="cd .."
alias ls="eza --icons"
alias ll="eza -la --group-directories-first --icons --git"

alias mark="grip -b --quiet"
alias fetch="fastfetch"
alias tm="tmux attach -t TMUX || tmux new -s TMUX"
alias pn="pnpm"
alias gl="serie --protocol kitty"

function upgrade_func() {
  echo "APT DIST-UPGRADE"
  sudo apt update
  sudo apt dist-upgrade -y
  sudo apt autoremove -y
  sudo apt autoclean

  echo "\nZINIT UPDATE"
  zinit self-update
  zinit update --all

  echo "\nOH MY POSH UPDATE"
  oh-my-posh upgrade

  echo "\nFLATPAK UPDATE"
  flatpak update -y
  flatpak remove --unused -y

  echo "\nSNAP REFRESH"
  sudo snap refresh

  echo "\nCARGO UPDATE"
  cargo install-update -a

  echo "\nPNPM UPDATE"
  pnpm update -g -L
}
alias upgrade=upgrade_func
