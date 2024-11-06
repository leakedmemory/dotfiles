# config files
alias termrc="nvim $HOME/.config/kitty/kitty.conf"
alias tmuxrc="nvim $HOME/.config/tmux/tmux.conf && tmux source $HOME/.config/tmux/tmux.conf"
alias zshrc="nvim $HOME/.zshrc && source $HOME/.zshrc"
alias aliases="nvim $HOME/.zsh/aliases.zsh && source $HOME/.zsh/aliases.zsh"
alias promptrc="nvim $HOME/.config/ohmyposh/config.omp.toml"
# opening the directory directly doesn't allow navigation using telescope
function nvrc_func() {
  pushd $HOME/.config/nvim > /dev/null
  nvim .
  popd > /dev/null
}
alias nvrc=nvrc_func

# git
alias gad="git add"
alias gag="git add --all"
alias gbr="git branch"
alias gch="git checkout"
alias gco="git commit"
alias gan="git commit --amend --no-edit"
alias gdi="git diff"
alias gme="git merge"
alias gpl="git pull"
alias gpu="git push"
alias grb="git rebase"
alias grs="git reset"
alias gre="git restore"
alias gun="git restore --staged"
alias gsh="git stash"
alias gst="git status"
alias gl="serie --protocol kitty"

alias ..="cd .."
alias ls="eza --icons"
alias ll="eza -la --group-directories-first --icons --git"
alias mark="grip -b --quiet"
alias fetch="fastfetch"
alias tm="tmux attach -t TMUX || tmux new -s TMUX"
alias pn="pnpm"

function v_func() {
  if [[ ! -n $1 ]]; then
    nvim .
  else
    nvim $1
  fi
}
alias v=v_func

function upgrade_func() {
  echo "APT DIST-UPGRADE"
  sudo apt update
  sudo apt dist-upgrade -y
  sudo apt autoremove -y
  sudo apt autoclean

  echo "\nOH MY POSH UPDATE"
  oh-my-posh upgrade

  echo "\nFLATPAK UPDATE"
  flatpak update -y
  flatpak remove --unused -y

  echo "\nSNAP REFRESH"
  sudo snap refresh

  echo "\nCARGO UPDATE"
  rustup update stable
  cargo install-update -a

  # update after cargo, since it's a cargo package
  echo "\nNVIM UPDATE"
  bob update --all

  echo "\nPNPM UPDATE"
  pnpm update -g -L
}
alias upgrade=upgrade_func
