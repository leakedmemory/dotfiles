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
alias zshrc="nvim $HOME/.zshrc && source $HOME/.zshrc"
alias tmuxrc="nvim $HOME/.config/tmux/tmux.conf && tmux source $HOME/.config/tmux/tmux.conf"
alias kittyrc="nvim $HOME/.config/kitty/kitty.conf"
alias rgrc="nvim $HOME/.ripgreprc"

alias ls="eza --icons"
alias ll="eza -la --group-directories-first --icons --git"
alias tm="tmux attach -t TMUX || tmux new -s TMUX"

alias mark="grip -b --quiet"
alias fetch="fastfetch"

function upgrade_func() {
  echo "SUDO APT UPDATE"
  sudo apt update

  echo "\nSUDO APT UPGRADE"
  sudo apt dist-upgrade -y

  echo "\nSUDO APT AUTOREMOVE"
  sudo apt autoremove -y

  echo "\nSUDO APT AUTOCLEAN"
  sudo apt autoclean

  echo "\nZINIT UPDATE"
  zinit self-update
  zinit update

  echo "\nFLATPAK UPDATE"
  flatpak update -y

  echo "\nFLATPAK REMOVE UNUSED"
  flatpak remove --unused -y

  echo "\nSNAP REFRESH"
  sudo snap refresh

  echo "\nCARGO UPDATE"
  cargo install-update -a

  echo "\nPNPM UPDATE"
  pnpm update -g
}
alias upgrade=upgrade_func
