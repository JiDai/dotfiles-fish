# Python stuff

set -x WORKON_HOME $HOME/.virtualenvs

if test -d $HOME/opt/python
    set -x PYTHONUSERBASE $HOME/opt/python
    set -x PATH $PYTHONUSERBASE/bin:$PATH
end

if test -d $HOME/opt/python/bin
    set -gx PATH $HOME/opt/python/bin $PATH
end