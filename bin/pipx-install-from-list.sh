jq -r '.venvs | keys[]' $1 | xargs -pI _ pipx install _