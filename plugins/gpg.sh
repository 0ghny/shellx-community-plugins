# .............................................................................
# guard
# .............................................................................
command -v gpg >/dev/null || return
# .............................................................................
# Features
# .............................................................................
if [[ -n "${GPG_USE_TTY}" ]]; then
  export GPG_TTY=$(tty)
fi
