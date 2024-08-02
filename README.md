# Dotfiles

My dotfile configuration.

Obs.: this assumes you are on Pop!\_OS and X11.

## Installing

Clone the repository into the home directory

```bash
git clone https://github.com/leakedmemory/dotfiles.git $HOME/dotfiles --depth=1
```

enter the directory

```bash
cd $HOME/dotfiles
```

run

```bash
./scripts/install.sh
```

create symlinks of the dotfiles

```bash
stow --adopt .
```

revert any merged files

```bash
git restore .
```

select kitty as default terminal app

```bash
sudo update-alternatives --config x-terminal-emulator
```

and finish with manual installs/configurations:

- set wallpaper
- set default browser to LibreWolf
- set default media player to VLC
- install [node](https://nodejs.org/en/download/package-manager)
  - install prettier
- install nerd-fonts getting inside ~/repos/nerd-fonts and running ./install.sh
- [install go](https://go.dev/doc/install)
- [install tmux plugins](https://github.com/tmux-plugins/tpm?tab=readme-ov-file#installing-plugins)
- [set shortcut to flameshot](https://askubuntu.com/a/1039949)
- [generate ssh key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#generating-a-new-ssh-key)
  and put it on github
- [catppuccin-cursors](https://github.com/catppuccin/cursors?tab=readme-ov-file#installation)
- [catppuccin-chrome](https://github.com/catppuccin/chrome?tab=readme-ov-file#manual-installation)
- [catppuccin-firefox](https://github.com/catppuccin/firefox?tab=readme-ov-file#-custom-install)
- [catppuccin-userstyles](https://github.com/catppuccin/userstyles?tab=readme-ov-file#%EF%B8%8F-install)
- [catppuccin-heroic](https://github.com/catppuccin/heroic?tab=readme-ov-file#usage)
- [catppuccin-qbittorrent](https://github.com/catppuccin/qbittorrent?tab=readme-ov-file#usage)

## Wallpaper

[![current wallpaper](./wallpaper.jpg)](https://unsplash.com/photos/snow-capped-mountain-in-the-horizon-with-cumulus-clouds-3XoiSqiX5ms)
