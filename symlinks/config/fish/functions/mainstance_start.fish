function mainstance_start -d "[MA] Start a GCP instance with a given instance name"
    if test -z "$argv[1]"
        echo "Please provide an instance name"
        echo "\$ mainstance_start jordid"
        return 1
    end
    gcloud compute instances start "$argv[1]-developers-1c-0"
end

