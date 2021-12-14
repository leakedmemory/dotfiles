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
    ppa:xalt7x/chromium-deb-vaapi
    ppa:neovim-ppa/unstable
    ppa:qbittorrent-team/qbittorrent-stable
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
    chromium-browser
    chromium-codecs-ffmpeg
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
    fonts-firacode
    exuberant-ctags
    timeshift
    curl
    wallch
    tmux
    neovim
    flameshot
    bat
    cmake
    ccls
    vlc
    qbittorrent
    virt-manager
    gnome-tweaks
    papirus-icon-theme
    ps
    ripgrep
)

SNAP_PROGRAMS=(
    spotify
    discord
    glow
)

FLATPAK_PROGRAMS=(

)

CARGO_PACKAGES=(
    bottom
)

REMOVE_PROGRAMS=(
    nano
    byobu
)

FONTS=(

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
for font in ${FONTS[@]}; do
    wget -c $font -P $FONTS_PATH
done
unzip $FONTS_PATH/*.zip
tar -xzvf $FONTS_PATH/*tar.gz
mv $FONTS_PATH/*.ttf $HOME_FONTS
mv $FONTS_PATH/*.otf $HOME_FONTS

echo; echo "--> Instalando programas apt"
for program in ${APT_PROGRAMS[@]}; do
    sudo apt install $program -y
done

echo; echo "--> Instalando programas snap"
for program in ${SNAP_PROGRAMS[@]}; do
    sudo snap install $program
done

echo; echo "--> Instalando programas flatpak"
for program in ${FLATPAK_PROGRAMS[@]}; do
    sudo flatpak install $program
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

echo; echo "--> Instalando pacotes cargo"
for package in ${CARGO_PACKAGES[@]}; do
    cargo install $package
done

# configurando virt-manager
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
cargo install $(cargo install --list | egrep '^[a-z0-9_-]+ v[0-9.]+:$' | cut -f1 -d' ')
sudo apt autoclean
sudo apt autoremove -y
sudo dpkg --configure -a

git config --global user.name "Lohan Pinheiro"
git config --global user.email "o.lohan.yrvine@gmail.com"

mkdir $DOT_CONFIG_PATH/nvim
mkdir $DOT_CONFIG_PATH/alacritty
cp -f $CONFIG_FILES_REPOSITORY_PATH/init.vim $DOT_CONFIG_PATH/nvim
cp -f $CONFIG_FILES_REPOSITORY_PATH/coc-settings.json $DOT_CONFIG_PATH/nvim
cp -f $CONFIG_FILES_REPOSITORY_PATH/plugin $DOT_CONFIG_PATH/nvim
cp -f $CONFIG_FILES_REPOSITORY_PATH/alacritty.yml $DOT_CONFIG_PATH/alacritty
cp -f $CONFIG_FILES_REPOSITORY_PATH/.zshrc $HOME
cp -f $CONFIG_FILES_REPOSITORY_PATH/.tmux.conf $HOME
mv -f $WALLPAPERS_REPOSITORY_PATH $HOME/Pictures
