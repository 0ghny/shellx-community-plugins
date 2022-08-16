# Define asdf home location
if [[ -n "${ASDF_DIR}" ]] || [[ -d "${HOME}/.asdf" ]]; then
  export ASDF_DIR="${ASDF_DIR:-"${HOME}/.asdf"}"
fi

if [[ ! -d "${ASDF_DIR}" ]]; then
  # Feature: Install if not present
  if [[ -n "${ASDF_INSTALL_IF_NOT_PRESENT}" ]]; then
    git clone https://github.com/asdf-vm/asdf.git "${ASDF_DIR:-"${HOME}"/.asdf}" --branch v0.10.2
  else
    # Feature disabled, don't do nothing, asdf is not installed
    return
  fi
fi

# Init asdf
if [[ ! -f "${ASDF_DIR}/asdf.sh" ]]; then
  echo "shellx-asdf-plugin: asdf.sh file not found at ${ASDF_DIR}/asdf.sh, cannot be loaded."
  return
fi

source "$ASDF_DIR/asdf.sh"
