#!/bin/sh

# ----------------------------- VARIÁVEIS ----------------------------- #
DOWNLOAD_FOLDER="$HOME/Downloads/programs"

PPA_REPOSITORIOS=(
    ppa:libratbag-piper/piper-libratbag-git
    ppa:xalt7x/chromium-deb-vaapi
    ppa:neovim-ppa/unstable
)

GITHUB_REPOSITORIOS=(
    https://github.com/alacritty/alacritty.git
    https://github.com/Lohan-Yrvine/wallpapers
    https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
)

PROGRAMAS_DEB=(

)

PROGRAMAS_APT=(
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
    fonts-firacode
    exuberant-ctags
    timeshift
    curl
    wallch
    tmux
    neovim
    flameshot
    htop
    cmake
    ccls
    vlc
)

PROGRAMAS_SNAP=(
    spotify
    discord
)

PROGRAMAS_FLATPAK=(

)

# ----------------------------- REQUISITOS ----------------------------- #
sudo rm /var/lib/apt/lists/lock
sudo rm /var/lib/dpkg/lock
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

sudo apt update -y

echo "\n --> Adicionando repositórios ppa"
for repositorio in ${PPA_REPOSITORIOS[@]}; do
    sudo apt-add-repository $repositorio -y
done
sudo apt-add-repository universe

echo "\n --> Clonando repositórios do github"
for repositorio in ${GITHUB_REPOSITORIOS[@]}; do
    git clone $repositorio
done

# ----------------------------- EXECUÇÃO ----------------------------- #
sudo apt update -y

echo "\n --> Baixando e instalando programas .deb"
mkdir $DOWNLOAD_FOLDER 
for programa in ${PROGRAMAS_DEB}; do
    wget -c $programa -p $DOWNLOAD_FOLDER
done
sudo dpkg -i $DOWNLOAD_FOLDER/*.deb

echo "\n --> Instalando programas apt"
for programa in ${PROGRAMAS_APT[@]}; do
    sudo apt install $programa -y
done

echo "\n --> Instalando programas snap"
for programa in ${PROGRAMAS_SNAP[@]}; do
    sudo snap install $programa
done

echo "\n --> Instalando programas flatpak"
for programa in ${PROGRAMAS_FLATPAK[@]}; do
    sudo flatpak install $programa
done

echo "\n --> Instalando programas curl"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --assume-no
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo "\n --> Instalando tema spaceship zsh"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

echo "\n --> Atualizando nodejs"
sudo npm cache clean -f
sudo npm install -g n
sudo n stable

echo "\n --> Instalando Rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env
rustup override set stable
rustup update stable

echo "\n --> Instalando alacritty"
alacritty
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

home

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

mkdir $HOME/.config/nvim
mkdir $HOME/.config/alacritty
cp -f $HOME/config-files/init.vim $HOME/.config/nvim
cp -f $HOME/config-files/coc-settings.json $HOME/.config/nvim
cp -f $HOME/config-files/alacritty.yml $HOME/.config/alacritty
cp -f $HOME/config-files/.zshrc $HOME
cp -f $HOME/config-files/.tmux.conf $HOME
mv -f $HOME/wallpapers $HOME/Pictures

echo "\n ---------- LISTA DE AJUSTES MANUAIS QUE PRECISAM SER FEITOS ----------"
echo "configurar mouse no piper"
echo "setar o flameshot para iniciar com o SO"
echo "mudar o PrtSc para printar com o flameshot por padrão (flameshot gui)"
echo "configurar o wallch"
echo "setar source-file do tmux com <C-b> :source-file ~/.tmux.conf"
echo "setar o zsh como shell padrão"
echo "setar o alacritty como terminal padrão"
echo "configurar o coc.nvim"
echo "configurar o timeshift"
