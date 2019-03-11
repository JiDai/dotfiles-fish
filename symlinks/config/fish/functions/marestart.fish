function marestart --description "[MA] Restart all apps and services or one if specified"
    set apps 'Barometre' 'ConnectAPI' 'GeoAPI' 'IndiceAPI' 'MailAPI' 'MarketAPI' 'MediaAPI' 'MyPro' 'MyProAPI' 'Partners' 'PdfAPI' 'ProfileAPI' 'SalesforceAPI' 'ThirdPartiesAPI' 'Thumbor' 'Tools' 'Wa' 'www'
    set services 'nginx' 'redis-server' 'luigi'

    sudo systemctl daemon-reload # If sysctl configuration has changed

    if test -n "$argv[1]"
        sudo systemctl restart "$argv[1]"
        return 0
    end

    for i in $apps
        set appName (ls "$MA_REPOSITORY/apps/" | grep -i "$i" | head -1)
        set appNameLower (echo "$appName" | tr '[:upper:]' '[:lower:]')

        echo "Restarting $appName..."
        sudo systemctl restart $appNameLower
    end

    for i in $services
        echo "Restarting $i..."
        sudo systemctl restart $i
    end
end