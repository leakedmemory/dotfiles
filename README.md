# Dotfiles

My dotfile configuration.

## TODO

Create a setup script to install and configure everything.

## (Not all) Dependencies

- [GNU Stow](https://www.gnu.org/software/stow)
- [Latexmk](https://mg.readthedocs.io/latexmk.html)
- [Pyright](https://microsoft.github.io/pyright/#/)
- [Marksman](https://github.com/artempyanykh/marksman)
- [Black](https://black.readthedocs.io/en/stable/index.html)
- [Tree-sitter](https://tree-sitter.github.io/tree-sitter) (need because of
  latex)

Install them by using

```bash
$ sudo apt install stow latexmk
$ npm install -g pyright
$ sudo snap install marksman
$ pip install black
$ cargo install tree-sitter-cli
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
