# for `brew`
eval "$(/opt/homebrew/bin/brew shellenv)"

# for `pyenv`
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# for `pipx`
export PATH="$PATH:/Users/gavin/.local/bin"
