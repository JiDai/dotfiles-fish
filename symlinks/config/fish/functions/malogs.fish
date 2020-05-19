function malogs --description "[MA] Show logs of all apps or ones if specified"
    set apps 'www' 'Portfolio' 'MediaAPI' 'MarketAPI' 'GeoAPI' 'MailAPI' 'IndiceAPI' 'MyPro' 'MyProAPI' 'Tools' 'Partners' 'ProfileAPI' 'PdfAPI' 'WebAnalytics' 'Barometre' 'ThirdPartiesAPI'  'Thumbor'
    set apps_docker 'Wa'
    set apps_docker_external 'ConnectAPI' 'MyAccount' 'MyAccountAPI' 'UserAPI'

    # TODO check status of app before display the logs

    if ! test -n "$argv[1]"
        echo "Please specify an app folder"
        return 1
    end

    set app "$argv[1]"
    set app_name_lower (echo $app | tr '[:upper:]' '[:lower:]')

    if test $app = "php"
        cat <(docker exec ma-legacy tail -n 50 -f "/var/log/syslog" & docker logs --tail 50 -f ma-legacy)
        return 0
    end

    if contains $app $apps
        set app_logs_path "/var/log/ma/$app_name_lower.log"

        if ! test -n "$app_logs_path"
            echo "No log file for $app"
            return 1
        end

        echo "Logging $app..."
        sudo tail -f $app_logs_path
        return 0
    end

    if contains $app $apps_docker
        echo "Logging $app..."
        cd "$HOME/meilleursagents/apps/$app"
        docker logs --follow --tail 20 $app_name_lower"-api"
        return 0
    end

    if contains "$app" $apps_docker_external
        echo "Logging $app..."
        cd "$HOME/$app"
        docker-compose logs --follow --tail 20
        return 0
    end

    echo "Please specify a valid app folder : "
    echo "$apps" "$apps_docker" "$apps_docker_external"
    return 1
end
