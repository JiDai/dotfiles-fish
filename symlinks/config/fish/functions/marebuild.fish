function marebuild --description "[MA] Rebuild all apps or one if specified"
    set apps 'www' 'Portfolio' 'MediaAPI' 'MarketAPI' 'GeoAPI' 'MailAPI' 'IndiceAPI' 'MyPro' 'MyProAPI' 'Tools' 'Partners' 'ProfileAPI' 'PdfAPI' 'WebAnalytics' 'Barometre' 'ThirdPartiesAPI'

    if test -n "$argv[1]"
        set apps $argv[1]
    end

    echo "Rebuild apps : $apps"
    for i in $apps
        set appName (ls "$MA_REPOSITORY/apps/" | grep -i "$i" | head -1)
        echo "Rebuilding $appName..."

        pushd "$MA_REPOSITORY/apps/$appName"

        make init-dev
        set condition (make -qp | grep build-assets | wc -l)
        if test condition >= 1
            make build-assets
        end

        popd

        marestart "$appName"
    end
end
