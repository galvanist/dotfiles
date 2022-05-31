export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

export HISTCONTROL=erasedups
export HISTSIZE=
export HISTFILESIZE=
shopt -s histappend

export PATH=/Users/gavin/.local/bin:$PATH
