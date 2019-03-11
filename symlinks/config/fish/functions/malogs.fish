function malogs --description "[MA] Show logs of all apps or ones if specified"
    set apps 'www' 'Portfolio' 'MediaAPI' 'MarketAPI' 'GeoAPI' 'MailAPI' 'IndiceAPI' 'MyPro' 'MyProAPI' 'Tools' 'Partners' 'ProfileAPI' 'PdfAPI' 'WebAnalytics' 'Barometre' 'ThirdPartiesAPI'  'Thumbor'
    set apps_docker 'Wa'
    set apps_docker_external 'ConnectAPI'

    if ! test -n "$argv[1]"
        echo "Please specify an app folder"
        return 1
    end

    set app "$argv[1]"
    set app_name_lower (echo $app | tr '[:upper:]' '[:lower:]')

    if not contains $app $apps; and not contains $app $apps_docker; and not contains $app $apps_docker_external
        echo "Please specify a valid app folder : "
        echo "$apps"
        echo "$apps_docker"
        return 1
    end

    if contains $app $apps
        set app_logs_path "/var/log/ma/$app_name_lower.log"

        if ! test -n "$app_logs_path"
            echo "No log file for $app"
            return 1
        end

        sudo tail -f $app_logs_path
        return 0
    end

    if contains $app $apps_docker
        cd "$HOME/meilleursagents/apps/$app"
        docker logs --follow --tail 20 $app_name_lower"-api"
        return 0
    end

    if contains $app $apps_docker_external
        cd "$HOME/$app"
        docker-compose logs --follow --tail 20
        return 0
    end
end
