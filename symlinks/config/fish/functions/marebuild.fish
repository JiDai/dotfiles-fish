function marebuild --description "[MA] Rebuild all apps or one if specified"
    set apps $MA_APPS

    if test -n "$argv[1]"
        set apps $argv[1]
    end

    echo "Rebuild apps : $apps"
    for i in $apps
        set app_name (ls "$MA_REPOSITORY/apps/" | grep -i "$i" | head -1)
        set app_name_lower (echo $app_name | tr '[:upper:]' '[:lower:]')

        pushd "$MA_REPOSITORY/apps/$app_name"

        echo "Rebuilding $app_name backend..."
        make init-dev

        set condition (make -qp | grep build-assets | wc -l)
        if test $condition -gt 1
            echo "Rebuilding $app_name assets..."
            make build-assets
        end

        popd

        marestart "$app_name_lower"
    end
end
