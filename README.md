# Gavin's Dotfiles

Requires and uses `stow`, as per http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html

Previously setup as per https://www.atlassian.com/git/tutorials/dotfiles

## Getting Started

**Important** - The dotfiles repo *must* be in your home directory as `stow` assumes it should dump the files into its parent directory.

```sh
git clone git@github.com:galvanist/dotfiles.git ~/.dotfiles
```

## Install
```sh
brew install stow
```

## Apply
```sh
cd ~/.dotfiles

stow [folder-names-to-apply]
stow git ssh
```

To overwrite or adopt pre-existing files:
```
stow --adopt zsh
```

## Usage

You should setup a `~/.gitconfig_work` with your work email, the `zshrc` will warn you if this is missing:

```
[user]
	email = gavin@work.com
```

If you have custom rc files which `export` or `alias` you should place them in `~/.customrcs`, they will be sourced by `zshrc`.

If you use Github you should create a `~/.ssh/id_ed25519_github` and/or `~/.ssh/id_ed25519_github_personal`. If you use Gitlab you should create a `~/.ssh/id_ed25519_gitlab`.

## Macos

There is a `macos-defaults.sh` which updates various MacOS settings to my preference.

## Homebrew

Once you have installed Homebrew, you can re-install my preferred apps and casks in the `Brewfile` with `brew bundle install`.

You can refresh this file with `brew bundle dump`.

## Pipx

Once you have installed pipx with Homebrew, you can restore the previously installed apps with:
```sh
./bin/pipx-install-from-list.sh pipx-list.json
```

You can also refresh the file with:
```sh
./bin/pipx-list.sh > pipx-list.json
```
