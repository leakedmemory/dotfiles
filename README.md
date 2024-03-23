# Dotfiles

## TODO

Create a setup script to install and configure everything.

## Requirements

- [GNU Stow](https://www.gnu.org/software/stow/)
- [npm](https://www.npmjs.com/)
  - [pyright](https://github.com/microsoft/pyright)

Install them using

```bash
sudo apt stow npm
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

