function marestart --description "[MA] Restart all apps and services or one if specified"
    if test -n "$argv[1]"
        set arg_apps $argv[1]
    end

    sudo systemctl daemon-reload # If sysctl configuration has changed

    if test -n "$arg_apps"
        maapps | while read -l app
            set -l name (echo "$app" | awk '{print $1}')
            set -l service_name (echo "$app" | awk '{print $2}')

            for arg_app in $arg_apps
                if test "$arg_app" = "$service_name"; or test "$arg_app" = "$name"
                    echo "Restarting $name..."
                    sudo systemctl restart $service_name
                end
            end
        end
    else
        maapps | while read -l app
            set -l name (echo "$app" | awk '{print $1}')
            set -l service_name (echo "$app" | awk '{print $2}')

            echo "Restarting $name..."
            sudo systemctl restart $service_name
        end
    end
end