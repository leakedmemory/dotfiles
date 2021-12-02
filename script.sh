#!/bin/sh

# ----------------------------- VARIÁVEIS ----------------------------- #
PPA_LIBRATBAG="ppa:libratbag-piper/piper-libratbag-git"
PPA_CHROMIUM="ppa:xalt7x/chromium-deb-vaapi"

REPOSITORIOS_GITHUB=(
    https://github.com/Lohan-Yrvine/config-files
    https://github.com/alacritty/alacritty.git
)

PROGRAMAS_APT=(
    snapd
    flatpak
    flameshot
    htop
    bat
    neofetch
    neovim
    ratbagd
    piper
    chromium-browser
    chromium-codecs-ffmpeg
    yarn
    nodejs
    zsh
    cmake
    pkg-config
    libfreetype6-dev
    libfontconfig1-dev
    libxcb-xfixes0-dev
    libxkbcommon-dev
    python3
)

PROGRAMAS_CURL=(
    "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs
)

# ----------------------------- REQUISITOS ----------------------------- #
sudo rm /var/lib/apt/lists/lock
sudo rm /var/lib/dpkg/lock
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

sudo apt update

sudo apt-add-repository "$PPA_LIBRATBAG" -y
sudo apt-add-repository "$PPA_CHROMIUM" -y

for repositorio in ${REPOSITORIOS_GITHUB}; do
    git clone $repositorio
done

# ----------------------------- EXECUÇÃO ----------------------------- #
sudo apt update

for programa in ${PROGRAMAS_APT}; do
    if ! dpkg -l | grep -q $programa; then
        sudo apt install $programa -y
    else
        echo "[INSTALADO] - $programa"
    fi
done

for programa in ${PROGRAMAS_CURL}; do
    sh -c $programa
done

rustup override set stable
rustup update stable

## Pacotes Flakpak ##

## Pacotes Snap ##
snap snap install spotify

## Alacritty ##
cd alacritty
cargo build --release

### Terminfo ###
sudo tic -xe alacritty,alacritty-direct extra/alacritty.info

### Desktop Entry ###
sudo cp target/release/alacritty /usr/local/bin
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database

### Manual Page ###
sudo mkdir -p /usr/local/share/man/man1
gzip -c extra/alacritty.man | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null
gzip -c extra/alacritty-msg.man | sudo tee /usr/local/share/man/man1/alacritty-msg.1.gz > /dev/null

cd

# ----------------------------- PÓS-INSTALAÇÃO ----------------------------- #
sudo apt update && sudo apt dis-upgrade -y
flatpak update
sudo apt autoclean
sudo apt autoremove -y
sudo dpkg --configure -a

git config --global user.name "Lohan Pinheiro"
git config --global user.email "o.lohan.yrvine@gmail.com"

mkdir ~/.config/nvim
mkdir ~/.config/alacritty
cp -f ~/config-files/init.vim ~/.config/nvim
cp -f ~/config-files/coc-settings.json ~/.config/nvim
cp -f ~/config-files/alacritty.yml ~/.config/alacritty
cp -f ~/config-files/.zshrc ~/
cp -f ~/config-files/.tmux.conf ~/
