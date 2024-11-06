# Dotfiles

My dotfile configuration.

Obs.: this assumes you are on Pop!\_OS and X11 (see
[tmux-yank](https://github.com/tmux-plugins/tmux-yank?tab=readme-ov-file#linux)).

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
- set user profile picture
- set default browser to LibreWolf
- set default media player to VLC
- install [node](https://nodejs.org/en/download/package-manager)
  - install prettier
  - install pnpm
- install nerd-fonts getting inside ~/repos/nerd-fonts and running ./install.sh
- [install go](https://go.dev/doc/install)
- [install tmux plugins](https://github.com/tmux-plugins/tpm?tab=readme-ov-file#installing-plugins)
- [set shortcut to flameshot](https://askubuntu.com/a/1039949)
- [generate ssh key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#generating-a-new-ssh-key)
  and put it on github
- [setup cloudflare dns](https://developers.cloudflare.com/1.1.1.1/ip-addresses/)

## Wallpaper

[![current wallpaper](./wallpaper.jpg)](https://wallhaven.cc/w/ex59dr)

## User Profile Picture

[![current user profile picture](./profile.jpg)](https://wallhaven.cc/w/yxpdog)
