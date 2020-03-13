function malogs_nginx --description "[MA] Show nginx app access logs"
    set apps 'Barometre' 'ConnectAPI' 'GeoAPI' 'IndiceAPI' 'luigi' 'MailAPI' 'MarketAPI' 'MediaAPI' 'MyPro' 'MyProAPI' 'Partners' 'PdfAPI' 'ProfileAPI' 'SalesforceAPI' 'ThirdPartiesAPI' 'Thumbor' 'Tools' 'Wa' 'www'
    set logs_path ""

    if test -n "$argv[1]"
        set apps $argv[1]
    end

    for app in $apps
        set app_name (echo $app | tr '[:upper:]' '[:lower:]')
        set app_access_logs_path "/var/log/nginx/$app_name.access.log"
        set app_error_logs_path "/var/log/nginx/$app_name.error.log"
        if test -n "$app_access_logs_path"; and test -n "$app_error_logs_path"
            set logs_path $logs_path $app_access_logs_path $app_error_logs_path
        end
    end

    sudo tail -f $logs_path
end