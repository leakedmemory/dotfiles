#!/usr/bin/env bash

remove_locks() {
    sudo rm /var/lib/dpkg/lock-frontend
    sudo rm /var/cache/apt/archives/lock
}

upgrade() {
    remove_locks
    sudo apt update
    sudo apt dist-upgrade -y
}

full_upgrade_and_clean() {
    upgrade
    sudo apt autoclean
    sudo apt autoremove -y
    flatpak update -y
    flatpak remove --unused -y
    snap refresh
}

upgrade

PPAS=(ppa:papirus/papirus ppa:zhangsongcui3371/fastfetch)
for ppa in ${PPAS[@]}; do
    sudo add-apt-repository ${ppa} -y
done

sudo apt update

PKGS=(
    papirus-icon-theme clang-format gdb tmux zsh kitty stow cmake flameshot
    latexmk biber zathura steam curl python3-pip libssl-dev snapd wget shfmt
    xsel fastfetch tree
    python$(python3 --version | awk "{print $2}" | cut -d"." -f1-2)-venv
)

remove_locks
sudo apt install ${PKGS[@]} -y

upgrade

FLATPAKS=(
    com.heroicgameslauncher.hgl
    com.obsproject.Studio
    dev.vencord.Vesktop
    io.gitlab.librewolf-community
    io.github.ungoogled_software.ungoogled_chromium
    org.qbittorrent.qBittorrent
    org.videolan.VLC
    org.localsend.localsend_app
)
flatpak install flathub ${FLATPAKS[@]} -y

SNAPS=(btop)
sudo snap install ${SNAPS[@]}

full_upgrade_and_clean

PIPS=(grip)
pip install ${PIPS[@]}

# install rust and some crates
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
. "$HOME/.cargo/env"

UNLOCKED_CRATES=(
    bob-nvim cargo-update eza lychee ripgrep tree-sitter-cli typos-cli
)
cargo install ${UNLOCKED_CRATES[@]}

LOCKED_CRATES=(bat serie zoxide)
cargo install --locked ${LOCKED_CRATES[@]}

# install ollama
curl -fsSL https://ollama.ai/install.sh | sh

# install oh-my-posh
curl -s https://ohmyposh.dev/install.sh | bash -s

# make zsh the default shell
chsh -s $(which zsh)

# tmux plugin manager
git clone https://github.com/tmux-plugins/tpm $HOME/.config/tmux/plugins/tpm --depth=1

# fonts
git clone https://github.com/ryanoasis/nerd-fonts.git $HOME/repos/nerd-fonts --depth=1
git clone https://github.com/google/fonts.git $HOME/repos/google-fonts --depth=1

./$HOME/dotfiles/scripts/google_fonts.sh
