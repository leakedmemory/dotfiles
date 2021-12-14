#!/bin/sh

echo "--> Instalando alacritty"
cargo build --release

# Terminfo
sudo tic -xe alacritty,alacritty-direct extra/alacritty.info

# Desktop Entry
sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database

# Manual Page
sudo mkdir -p /usr/local/share/man/man1
gzip -c extra/alacritty.man | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null
gzip -c extra/alacritty-msg.man | sudo tee /usr/local/share/man/man1/alacritty-msg.1.gz > /dev/null

# zsh
mkdir -p ${ZDOTDIR:-~}/.zsh_functions
echo 'fpath+=${ZDOTDIR:-~}/.zsh_functions' >> ${ZDOTDIR:-~}/.zshrc

echo; echo "---------- LISTA DE AJUSTES MANUAIS QUE PRECISAM SER FEITOS ----------"
echo "configurar mouse no piper"
echo "setar o flameshot para iniciar com o SO"
echo "mudar o PrtSc para printar com o flameshot por padrão (flameshot gui)"
echo "configurar wallch"
echo "setar o source-file do tmux com <C-b> :source-file ~/.tmux.conf"
echo "setar o zsh como shell padrão"
echo "setar o alacritty como shell padrão"
echo "configurar o coc.nvim"
echo "configurar o timeshift"
echo "trocar o tema de ícones no gnome-tweaks"
echo "instalar a extensão clipboard indicator (by tudmotu)"
echo "por fim, é recomendado reiniciar a máquina"
