function maip --description "[MA] Get ip of dev server instance"
    set -l instance "jordid"
    if test -n "$argv[1]"
        set instance "jordid"
    end
    gcloud --project=ma-dev2 compute instances list | grep "$instance-developers" | awk '{ print $5 }'
end
