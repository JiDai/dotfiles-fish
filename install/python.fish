# Python configuration
# Make PIP packages install in ~/opt/python folder

function main
    if ! type -f python
        echo "Fail to find Python"
        return
    end

    mkdir -p "$HOME/opt/python"

    set --export PYTHONUSERBASE $HOME/opt/python
    set --export PATH $PYTHONUSERBASE/bin $PATH

    if ! type -f pip
        echo "Fail to find PIP"
        return
    end

    pip install --user --upgrade pip

    echo "Install PIP global packages"
    pip install --user ansible
    pip install --user tmuxp

end

main