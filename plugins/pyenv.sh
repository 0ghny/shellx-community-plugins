# .............................................................................
# guards
# .............................................................................
if [[ -n "${PYENV_HOME}" ]] && [[ ! -d "${HOME}/.pyenv" ]]; then
  echo "PYENV_HOME variable defined but pointing to an non existing directory"
  return
fi
if [[ -z "${PYENV_HOME}" ]] && [[ -d "${HOME}/.pyenv" ]]; then
  export PYENV_HOME="${HOME}/.pyenv"
fi

# setting pyenv dir in path
if [[ -d "${PYENV_HOME}" ]]; then
  export PATH="${PYENV_HOME}/bin:${PATH}"
fi
command -v pyenv >/dev/null || return

# .............................................................................
# Settings
# .............................................................................
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
