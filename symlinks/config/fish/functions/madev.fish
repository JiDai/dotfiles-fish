function madev --description "[MA] Connect to dev server"
    if ! type -f mosh > /dev/null 2>&1
        echo "mosh command is not installed"
        echo "Go to https://mosh.org/#getting"
        exit 1
    end

    mosh (gcloud --project=ma-dev2 compute instances list | grep jordid-developers | awk '{ print $5 }')
end
