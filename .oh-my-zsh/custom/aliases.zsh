alias v="nvim"

alias ls="exa"
alias ll="exa -l --group-directories-first"

alias cat="batcat"

alias gs="git status"

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
