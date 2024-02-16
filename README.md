# Dotfiles

## Requirements

Install [GNU Stow](https://www.gnu.org/software/stow/) using the following command

```bash
sudo apt stow
```

## Creating Symlinks

Run the following to create the links

```bash
stow --adopt .
```

Maybe the files already existed and were merged with the ones of this repo, so
make sure to remove the undesired changes and commit or use `git restore`.

