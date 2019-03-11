function gshow --description "Show details of instance"
    set -l host "$argv[1]"
    set -l gcp_env (getGcpEnv $host)
    set -l project (getProjectByEnv $gcp_env)
    set -l zone (getZoneFromHostname $gcp_env $host)
    gcloud --project=$project compute instances describe --zone=$zone $host
end
