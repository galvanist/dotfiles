# for `brew`
eval "$(/opt/homebrew/bin/brew shellenv)"

# for `pyenv`
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
if [ -x "$(command -v pyenv)" ]; then
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi

# for `pipx`
export PATH="/Users/gavin/.local/bin:$PATH"

# for `awsume`
alias awsume=". awsume"
