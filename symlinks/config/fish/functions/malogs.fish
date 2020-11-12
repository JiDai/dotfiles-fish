function malogs --description "[MA] Show logs of all apps or ones if specified"
    set apps_docker_external 'connectapi' 'myaccount' 'myaccountapi' 'userapi' 'dvfapi' 'cookiebanner' 'webanalytics'

    # TODO check status of app before display the logs

    set app "$argv[1]"

    if test $app = "php"
        cat <(docker exec ma-legacy tail -n 50 -f "/var/log/syslog" & docker logs --tail 50 -f ma-legacy)
        return 0
    end

    if contains "$app" $apps_docker_external
        echo "Logging $app..."
        cd "$HOME/$app"
        docker-compose logs --follow --tail 20
        return 0
    else
        set app_logs_path "/var/log/ma/$app.log"

        if ! test -n "$app_logs_path"
            echo "No log file for $app"
            return 1
        end

        echo "Logging $app..."
        sudo tail -f $app_logs_path
        return 0
    end

    echo "Please specify a valid app folder : "
    echo "$MA_APPS_SERVICES"
    return 1
end
