function gssh --description "Connect to GCP instance over SSH (in dev env by default)"
    set -l host "$argv[1]"
    set -l possibleEnv 'prod' 'staging' 'dev' 'test' 'backbone'

    if type -f fzf 1>/dev/null 2>&1
        if test (count $argv) -eq 0
            set host (gls dev | cut -d " " -f1 | fzf)
        else if test (count $argv) -eq 1
            set host (gls dev | cut -d " " -f1 | fzf -q "$argv[1]" -1)
        else if test (count $argv) -gt 1
            for env in $possibleEnv
                if test "$env" = "$argv[1]"
                    set host (gls "$argv[1]" | cut -d " " -f1 | fzf -q "$argv[2]" -1)
                    set --erase argv[1]
                end
            end
        end
    end

    set --erase argv[1]

    if test -z $host
        exit
    end

    set -l env (getGcpEnv $host)
    set -l project (getProjectByEnv $env)
    set -l zone (getZoneFromHostname $env $host)
    set -l ip
    set -l ssh_opts

    if test "$env" = "backbone"
        set ip (gcloud compute instances describe --project=$project --zone=$zone --format="value(networkInterfaces[0].accessConfigs[0].natIP)" $host)
        set ssh_opts ""
    else
        set ip (gcloud compute instances describe --project=$project --zone=$zone --format="value(networkInterfaces[0].networkIP)" $host)
        set ssh_opts "-o StrictHostKeyChecking=no -o ProxyCommand='ssh -W %h:%p $env'"
    end

    set cmd "ssh $ssh_opts $ip $argv"

    echo "+-------------------------------------------------------------------------------------+"
    echo "| gssh                                                                                |"
    echo "+-------------------------------------------------------------------------------------+"
    echo "| project: $project"
    echo "| environment: $env"
    echo "| host: $host"
    echo "| zone: $zone"
    echo "| ip: $ip"
    echo "| cmd: $cmd"
    echo "+-------------------------------------------------------------------------------------+"

    eval $cmd
end
