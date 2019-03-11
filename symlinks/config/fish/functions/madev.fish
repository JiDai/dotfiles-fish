function madev --description "[MA] Connect to dev server"
    if ! type -f mosh > /dev/null 2>&1
        echo "mosh command is not installed"
        echo "Go to https://mosh.org/#getting"
        return 1
    end

    mosh (maip jordid)
end
