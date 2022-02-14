#!/bin/sh

# ----------------------------- VARIÁVEIS ----------------------------- #
PROGRAMS_PATH="$HOME/Downloads/programs"
FONTS_PATH="$HOME/Downloads/fonts"
HOME_FONTS="$HOME/.local/share/fonts"
CONFIG_FILES_REPOSITORY_PATH="$HOME/config-files"
DOT_CONFIG_PATH="$HOME/.config"
WALLPAPERS_REPOSITORY_PATH="$HOME/wallpapers"

PPA_REPOSITORIES=(
    ppa:libratbag-piper/piper-libratbag-git
    ppa:neovim-ppa/unstable
    ppa:papirus/papirus
)

GITHUB_REPOSITORIES=(
    https://github.com/alacritty/alacritty.git
    https://github.com/Lohan-Yrvine/wallpapers
)

DEB_PROGRAMS=(

)

APT_PROGRAMS=(
    snapd
    flatpak
    neofetch
    ratbagd
    piper
    yarn
    nodejs
    npm
    zsh
    pkg-config
    libfreetype6-dev
    libfontconfig1-dev
    libxcb-xfixes0-dev
    libxkbcommon-dev
    python3
    python3-pip
    exuberant-ctags
    timeshift
    curl
    wallch
    tmux
    neovim
    bat
    cmake
    ccls
    virt-manager
    gnome-tweaks
    papirus-icon-theme
    procps
    ripgrep
    apt-transport-https
    brave-browser
    gparted
)

SNAP_PROGRAMS=(
    glow
    bottom
    lsd
)

FLATPAK_PROGRAMS=(
    com.spotify.Client
    com.discordapp.Discord
    com.visualstudio.code
    org.onlyoffice.desktopeditors
    org.gnome.Extensions
    org.flameshot.Flameshot
    org.videolan.VLC
    org.qbittorrent.qBittorrent
)

REMOVE_PROGRAMS=(
    nano
    byobu
)

# ----------------------------- REQUISITOS ----------------------------- #
sudo rm /var/lib/apt/lists/lock
sudo rm /var/lib/dpkg/lock
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

sudo apt update -y

echo; echo "--> Adicionando repositórios ppa"
for repository in ${PPA_REPOSITORIES[@]}; do
    sudo apt-add-repository $repository -y
done
sudo apt-add-repository universe

echo; echo "--> Clonando repositórios do github"
for repository in ${GITHUB_REPOSITORIES[@]}; do
    git clone $repository
done

# Brave
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

# ----------------------------- EXECUÇÃO ----------------------------- #
sudo apt update -y

echo; echo "--> Baixando e instalando programas .deb"
mkdir $PROGRAMS_PATH
for program in ${DEB_PROGRAMS[@]}; do
    wget -c $program -P $PROGRAMS_PATH
done
sudo dpkg -i $PROGRAMS_PATH/*.deb

echo; echo "--> Baixando e instalando fontes"
mkdir $FONTS_PATH
mkdir $HOME_FONTS

# FiraCode
wget -c https://github.com/tonsky/FiraCode/releases/download/6.2/Fira_Code_v6.2.zip -P $FONTS_PATH
unzip $FONTS_PATH/*.zip
mv $FONTS_PATH/ttf/*.ttf $HOME_FONTS
rm ttf
rm variable_ttf
rm woff
rm woff2
rm fire_code.css
rm README.txt
rm specimen.html

echo; echo "--> Instalando programas dkpg"
for program in ${APT_PROGRAMS[@]}; do
    sudo apt install $program -y
done

echo; echo "--> Instalando programas snap"
for program in ${SNAP_PROGRAMS[@]}; do
    sudo snap install $program
done

echo; echo "--> Instalando programas flatpak"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
for program in ${FLATPAK_PROGRAMS[@]}; do
    sudo flatpak install flathub $program -y
done

echo; echo "--> Instalando programas curl"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo; echo "--> Instalando plugins do zsh"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

echo; echo "--> Atualizando nodejs"
sudo npm cache clean -f
sudo npm install -g n
sudo n stable

echo; echo "--> Instalando Rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
rustup override set stable
rustup update stable

echo; echo "Configurando virt-manager"
sudo groupadd --system libvirt
sudo usermod -a -G libvirt $(whoami)
newgrp libvirt
sudo systemctl restart libvirtd.service

echo; echo "--> Removendo programas"
for program in ${REMOVE_PROGRAMS[@]}; do
    sudo apt remove $program -y
done

# ----------------------------- PÓS-INSTALAÇÃO ----------------------------- #
sudo apt update -y
sudo apt dist-upgrade -y
sudo snap refresh
sudo flatpak update
sudo apt autoclean
sudo apt autoremove -y
sudo dpkg --configure -a

git config --global user.name "Lohan Pinheiro"
git config --global user.email "o.lohan.yrvine@gmail.com"
git config --global alias.aac "!git add -A && git commit"

mkdir $DOT_CONFIG_PATH/nvim
mkdir $DOT_CONFIG_PATH/alacritty
cp -f $CONFIG_FILES_REPOSITORY_PATH/init.vim $DOT_CONFIG_PATH/nvim
cp -f $CONFIG_FILES_REPOSITORY_PATH/coc-settings.json $DOT_CONFIG_PATH/nvim
cp -r $CONFIG_FILES_REPOSITORY_PATH/plugin $DOT_CONFIG_PATH/nvim
cp -f $CONFIG_FILES_REPOSITORY_PATH/alacritty.yml $DOT_CONFIG_PATH/alacritty
cp -f $CONFIG_FILES_REPOSITORY_PATH/.zshrc $HOME
cp -f $CONFIG_FILES_REPOSITORY_PATH/.tmux.conf $HOME
mv -f $WALLPAPERS_REPOSITORY_PATH $HOME/Pictures

mkdir -p ${ZDOTDIR:-~}/.zsh_functions
echo 'fpath+=${ZDOTDIR:-~}/.zsh_functions' >> ${ZDOTDIR:-~}/.zshrc

echo; echo "---------- LISTA DE AJUSTES MANUAIS QUE PRECISAM SER FEITOS ----------"
echo "mudar o PrtSc para printar com o flameshot por padrão (flameshot gui)"
echo "setar o source-file do tmux com <C-b> :source-file ~/.tmux.conf"
echo "setar o zsh como shell padrão usando [chsh -s $(which zsh)]"
echo "configurar mouse no piper"
echo "configurar o coc.nvim"
echo "configurar o timeshift"
echo "sync brave browser"
echo "trocar o tema de ícones no gnome-tweaks"
echo "instalar a extensão clipboard indicator (by tudmotu)"
echo "remover libreoffice pela store"
echo "remover gnome extensions padrão do SO"
echo "remover gnome videos"
echo "mudar os aplicativos padrão"
echo;
