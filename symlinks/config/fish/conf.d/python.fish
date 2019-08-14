
set -x WORKON_HOME $HOME/.virtualenvs

if test -d $HOME/opt/python
    set -x PYTHONUSERBASE $HOME/opt/python
    set -x PATH $PYTHONUSERBASE/bin:$PATH
end