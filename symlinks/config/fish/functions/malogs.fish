function malogs --description "[MA] Show logs of all apps or ones if specified"
    set apps 'www' 'Portfolio' 'MediaAPI' 'MarketAPI' 'GeoAPI' 'MailAPI' 'IndiceAPI' 'MyPro' 'MyProAPI' 'Tools' 'Partners' 'ProfileAPI' 'PdfAPI' 'WebAnalytics' 'Barometre' 'ThirdPartiesAPI'
    set logs_path ""

    if test -n "$argv[1]"
        set apps $argv[1]
    end

    for app in $apps
        set app_name (echo $app | tr '[:upper:]' '[:lower:]')
        set app_logs_path "/var/log/ma/$app_name.log"

        if test -n "$app_logs_path"
            if test -n "$logs_path"
                set logs_path $logs_path $app_logs_path
            else
                set logs_path $app_logs_path
            end
        else
            echo "No log file for $app"
            return 1
        end
    end

    sudo tail -f $logs_path
end
