function marestart --description "[MA] Restart all apps and services or one if specified"
    set apps 'www' 'Portfolio' 'MediaAPI' 'MarketAPI' 'GeoAPI' 'MailAPI' 'IndiceAPI' 'MyPro' 'MyProAPI' 'Tools' 'Partners' 'ProfileAPI' 'PdfAPI' 'WebAnalytics' 'Barometre' 'ThirdPartiesAPI'

    if test -n "$argv[1]"
        set apps $argv[1]
    end

    for i in $apps
        set appName (ls "$MA_REPOSITORY/apps/" | grep -i "$i" | head -1)
        set appNameLower (echo "$appName" | tr '[:upper:]' '[:lower:]')

        echo "Restarting $appName..."
        sudo systemctl restart $appNameLower
    end
end