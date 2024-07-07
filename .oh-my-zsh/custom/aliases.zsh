function nvrc_func() {
  SAVE_PWD=($PWD)
  cd ~/.config/nvim && nvim . && cd $SAVE_PWD
}
alias nvrc=nvrc_func

function v_func() {
  if [[ ! -n $1 ]]; then
    nvim .
  else
    nvim $1
  fi
}
alias v=v_func

alias aliases="nvim ~/.oh-my-zsh/custom/aliases.zsh && source ~/.oh-my-zsh/custom/aliases.zsh"
alias zshrc="nvim ~/.zshrc && source ~/.zshrc"
alias tmuxrc="nvim ~/.config/tmux/tmux.conf && tmux source ~/.config/tmux/tmux.conf"
alias alacrittyrc="nvim ~/.config/alacritty/alacritty.toml"
alias rgrc="nvim ~/.ripgreprc"

alias ls="eza --icons"
alias ll="eza -la --group-directories-first --icons --git"

alias bat="batcat"

alias mark="grip -b --quiet"

alias keymapp="~/Downloads/programs/keymapp"

function upgrade_func() {
  echo "SUDO APT UPDATE"
  sudo apt update

  echo "\nSUDO APT UPGRADE"
  sudo apt upgrade -y

  echo "\nSUDO APT AUTOREMOVE"
  sudo apt autoremove -y

  echo "\nSUDO APT AUTOCLEAN"
  sudo apt autoclean

  echo "\nFLATPAK UPDATE"
  flatpak update -y

  echo "\nFLATPAK REMOVE UNUSED"
  flatpak remove --unused -y

  echo "\nSNAP REFRESH"
  sudo snap refresh

  echo "\nCARGO UPDATE"
  cargo install-update -a
}
alias upgrade=upgrade_func
