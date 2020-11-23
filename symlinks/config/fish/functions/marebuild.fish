function marebuild --description "[MA] Rebuild all apps or one if specified"
    set arg_app "$argv[1]"

    if ! test -n "$arg_app[1]"
        echo "Please give apps to rebuild"
        return 1
    end

    set -l rebuild_done 0

    maapps | while read -l app
        set -l name (echo "$app" | awk '{print $1}')
        set -l service_name (echo "$app" | awk '{print $2}')

        if test "$arg_app" = "$service_name"; or test "$arg_app" = "$name"
            echo "Rebuild $name"

            pushd "$MA_REPOSITORY/apps/$name"

            if test -d "$MA_REPOSITORY/apps/$name/.git"
                echo "Update code..."
                git pull
            end

            echo "Rebuilding backend..."
            make init-dev; or make init

            set condition (make -qp | grep build-assets | wc -l)
            if test $condition -gt 1
                echo "Rebuilding assets..."
                make build-assets
            end

            popd

            set rebuild_done 1

            marestart "$service_name"
        end

    end

    if test $rebuild_done -eq 0
        echo "App $arg_app not found"
        return 1
    end
end
