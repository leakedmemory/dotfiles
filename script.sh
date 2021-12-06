#!/bin/sh

# ----------------------------- VARIÁVEIS ----------------------------- #
PROGRAMS_PATH="$HOME/Downloads/programs"
BASH_PATH="$HOME/.bashrc"
DOT_FILES_REPOSITORY_PATH="$HOME/dot-files"
DOT_CONFIG_PATH="$HOME/.config"
WALLPAPERS_REPOSITORY_PATH="$HOME/wallpapers"

PPA_REPOSITORIES=(
    ppa:libratbag-piper/piper-libratbag-git
    ppa:xalt7x/chromium-deb-vaapi
    ppa:neovim-ppa/unstable
    ppa:qbittorrent-team/qbittorrent-stable
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
    qbittorrent
)

SNAP_PROGRAMS=(
    spotify
    discord
)

FLATPAK_PROGRAMS=(

)

# ----------------------------- REQUISITOS ----------------------------- #
# Criando aliases
echo 'alias alacritty="cd $HOME/alacritty' >> $BASH_PATH
echo 'alias home="cd"' >> $BASH_PATH
source $BASH_PATH

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
    wget -c $program -p $PROGRAMS_PATH done
sudo dpkg -i $PROGRAMS_PATH/*.deb

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

echo; echo "--> Instalando alacritty"
alacritty  # alias criado anteriormente
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

home  # alias criado anteriormente


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

mkdir $DOT_CONFIG_PATH/nvim
mkdir $DOT_CONFIG_PATH/alacritty
cp -f $DOT_FILES_REPOSITORY_PATH/init.vim $DOT_CONFIG_PATH/nvim
cp -f $DOT_FILES_REPOSITORY_PATH/coc-settings.json $DOT_CONFIG_PATH/nvim
cp -f $DOT_FILES_REPOSITORY_PATH/alacritty.yml $DOT_CONFIG_PATH/alacritty
cp -f $DOT_FILES_REPOSITORY_PATH/.zshrc $HOME
cp -f $DOT_FILES_REPOSITORY_PATH/.tmux.conf $HOME
mv -f $WALLPAPERS_REPOSITORY_PATH $HOME/Pictures

echo; echo "---------- LISTA DE AJUSTES MANUAIS QUE PRECISAM SER FEITOS ----------"
echo "configurar mouse no piper"
echo "setar o flameshot para iniciar com o SO"
echo "mudar o PrtSc para printar com o flameshot por padrão (flameshot gui)"
echo "configurar o wallch"
echo "setar source-file do tmux com <C-b> :source-file ~/.tmux.conf"
echo "setar o zsh como shell padrão"
echo "setar o alacritty como terminal padrão"
echo "configurar o coc.nvim"
echo "configurar o timeshift"
