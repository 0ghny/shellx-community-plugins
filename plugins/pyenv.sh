# Define asdf home location
if [[ -z "${PYENV_HOME}" ]] || [[ ! -d "${HOME}/.pyenv" ]]; then
  export PYENV_HOME="${PYENV_HOME:-"${HOME}/.pyenv"}"
fi

shellx::plugins::log_debug "pyenv" "home defined in ${PYENV_HOME}"
if [[ ! -d "${PYENV_HOME}" ]]; then
  git clone --quiet https://github.com/pyenv/pyenv.git "${PYENV_HOME:-"${HOME}"/.pyenv}" > /dev/null 2>&1 || \
  shellx::plugins::log_error "pyenv" "error cloning pyenv, skipping initialisation"
fi

# setting pyenv dir in path
if [[ -d "${PYENV_HOME}" ]]; then
  export PATH="${PYENV_HOME}/bin:${PATH}"
fi

command -v pyenv >/dev/null || return

# Init pyenv
eval "$(pyenv init -)"

# Feature: pyenv-virtualenv
if [[ ! -d "$(pyenv root)/plugins/pyenv-virtualenv" ]]; then
  git clone --quiet https://github.com/pyenv/pyenv-virtualenv.git "$(pyenv root)/plugins/pyenv-virtualenv" > /dev/null 2>&1 || \
  shellx::plugins::log_error "pyenv" "error cloning plugin virtualenv, skipping initialisation"
fi

if [[ -d "$(pyenv root)/plugins/pyenv-virtualenv" ]]; then
  eval "$(pyenv virtualenv-init -)"
fi
