# Dotfiles

## TODO

Create a setup script to install and configure everything.

## Requirements

- [GNU Stow](https://www.gnu.org/software/stow/)
- [pyright](https://github.com/microsoft/pyright)
  - [Node.js](https://nodejs.org/en/download/package-manager)

Install them using

```bash
$ sudo apt stow
$ npm install -g pyright
```

## Creating Symlinks

Clone the repository, enter it and run the following to create the links (note
that this does NOT install anything, it only creates the links to the dotfiles
in this directory):

```bash
stow --adopt .
```

Maybe the files already existed and were merged with the ones of this repo, so
make sure to remove the undesired changes and commit or just use `git restore`.

## Wallpaper

![current wallpaper](./wallpaper.jpg)

