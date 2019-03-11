set -x PYENV_ROOT $HOME/opt/pyenv
set -x PATH $PYENV_ROOT/bin $PATH
set -x WORKON_HOME $HOME/.virtualenvs

status --is-interactive; and pyenv init - | source
status --is-interactive; and pyenv virtualenv-init - | source
