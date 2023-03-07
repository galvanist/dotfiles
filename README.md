# Gavin's Dotfiles

Requires and uses `stow`, as per http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html

Previously setup as per https://www.atlassian.com/git/tutorials/dotfiles

## Getting Started

### Homebrew

Firstly you need to get Homebrew installed and evaluated for this shell (until you stow the `zsh` configs):

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"
```

You can (re)install the preferred apps and casks in the `Brewfile` with `brew bundle install`.

You can refresh this file with `brew bundle dump --force`.

### Installing Stow and Git (Required for the following)
```sh
brew install git stow
```

### Cloning Dotfiles

**Important** - The dotfiles repo *must* be in your home directory as `stow` assumes it should dump the files into its parent directory.

```sh
git clone git@github.com:galvanist/dotfiles.git ~/.dotfiles
```

### Apply
```sh
cd ~/.dotfiles

stow [folder-names-to-apply]
stow git ssh
```

To overwrite or adopt pre-existing files:
```
stow --adopt zsh
```

### Usage

You should setup a `~/.gitconfig_work` with your work email, the `zshrc` will warn you if this is missing:

```
[user]
	email = gavin@work.com
```

If you have custom rc files which `export` or `alias` you should place them in `~/.customrcs`, they will be sourced by `zshrc`.

If you use Github you should create a `~/.ssh/id_ed25519_github` and/or `~/.ssh/id_ed25519_github_personal`. If you use Gitlab you should create a `~/.ssh/id_ed25519_gitlab`.

## Macos

There is a `macos-defaults.sh` which updates various MacOS settings to my preference.

## Pipx

Once you have installed pipx with Homebrew, you should check it's active:
```sh
pipx ensurepath
```

Then you can install the preferred apps with:
```sh
./bin/pipx-install-from-list.sh pipx-list.json
```

You can also refresh the file with:
```sh
./bin/pipx-list.sh > pipx-list.json
```

## Manual Installs

I've grown accustomed to the following tools, they may need to be manually installed/managed:
* [MeetingBar](https://github.com/leits/MeetingBar)
* [Rectangle](https://rectangleapp.com/)
* [DBeaver](https://dbeaver.io/)

## Other Considerations

It's also worth keeping the following in mind (i.e. backed up):
* Shell Histories are useful, typically found in `~/.zsh_history`
* Bookmarks in browsers, Google and Firefox can sync these.
* VSCode settings and installed plugins aren't easy, but should be managed by Github Settings Sync.
