alias v="nvim"

function nvrc_func() {
  SAVE_PWD=($PWD)
  cd ~/.config/nvim && nvim . && cd $SAVE_PWD
}
alias nvrc=nvrc_func

alias aliases="nvim ~/.oh-my-zsh/custom/aliases.zsh && source ~/.oh-my-zsh/custom/aliases.zsh"

alias ls="exa"
alias ll="exa -l --group-directories-first"

alias cat="batcat"

alias mark="grip -b"

alias upgrade="
echo \"SUDO APT UPDATE\" &&
sudo apt update &&
echo \"\nSUDO APT UPGRADE\" &&
sudo apt upgrade -y &&
echo \"\nSUDO APT AUTOREMOVE\" &&
sudo apt autoremove -y &&
echo \"\nSUDO APT AUTOCLEAN\" &&
sudo apt autoclean &&
echo \"\nFLATPAK UPDATE\" &&
flatpak update -y &&
echo \"\nFLATPAK REMOVE UNUSED\" &&
flatpak remove --unused -y &&
echo \"\nSNAP REFRESH\" &&
sudo snap refresh
"

alias cubemx="/usr/local/STMicroelectronics/STM32Cube/STM32CubeMX/STM32CubeMX"
