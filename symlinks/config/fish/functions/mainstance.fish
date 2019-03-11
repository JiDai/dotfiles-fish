function mainstance -d "[MA] Start or stop a GCP instance with a given instance name"
    if test -z "$argv[1]"
        echo "Please provide an action, start or stop"
        echo "\$ mainstance_start jordid"
        return 1
    end

    if test -z "$argv[2]"
        echo "Please provide an instance name"
        echo "\$ mainstance_start jordid"
        return 1
    end

    gcloud compute instances "$argv[1]" "$argv[2]-developers-1c-0"
end

