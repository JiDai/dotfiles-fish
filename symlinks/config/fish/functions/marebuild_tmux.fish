function marebuild_tmux --description "[MA] Rebuild all apps in Tmux windows in background"
    if ! test -n "$TMUX"
        echo "You're not inside a tmux, exiting"
        return 1
    end

    for app in 'Barometre' 'ConnectAPI' 'GeoAPI' 'IndiceAPI' 'luigi' 'MailAPI' 'MarketAPI' 'MediaAPI' 'MyPro' 'MyProAPI' 'Partners' 'PdfAPI' 'ProfileAPI' 'SalesforceAPI' 'ThirdPartiesAPI' 'Thumbor' 'Tools' 'Wa' 'www'
        tmux new-window -n "$app" -d "marebuild $app"
    end
end
