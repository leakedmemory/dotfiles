# Dotfiles

My dotfile configuration.

## TODO

Create a setup script to install and configure everything.

## Dependencies

- [GNU Stow](https://www.gnu.org/software/stow/)
- [Node.js](https://nodejs.org/en/download/package-manager)
  - [pyright](https://github.com/microsoft/pyright)
- [marksman](https://github.com/artempyanykh/marksman)

Install them by using

```bash
$ sudo apt install stow
$ npm install -g pyright
$ sudo snap install marksman
```

## Creating Symlinks

Clone the repository, enter it and run the following to create the links:

```bash
stow --adopt .
```

Maybe the files already existed and were merged with the ones of this repo, so
make sure to remove the undesired changes and commit or just use `git restore`.

## Wallpaper

![current wallpaper](./wallpaper.jpg)
