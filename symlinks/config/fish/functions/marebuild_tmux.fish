function marebuild_tmux --description "[MA] Rebuild all apps in Tmux windows in background"
    if command -v tmux >/dev/null 2>&1
        echo "You're not inside a tmux, exiting"
        exit 1
    end

    for app in 'www' 'Portfolio' 'MediaAPI' 'MarketAPI' 'GeoAPI' 'MailAPI' 'IndiceAPI' 'MyPro' 'MyProAPI' 'Tools' 'Partners' 'ProfileAPI' 'PdfAPI' 'WebAnalytics' 'Barometre' 'ThirdPartiesAPI'
        tmux new-window -n "$app" -d "marebuild $app"
    end
end
