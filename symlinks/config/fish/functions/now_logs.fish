function now_logs --description "Show runtime logs of latest deployment"
    if ! type -q now
        echo "Now CLI is not defined"
        return 1
    end

    if ! test -n "$argv[1]"
        echo "Please provide an app name"
        return 1
    end

    now logs -f -a (now ls | grep "$argv[1]" | awk '{print $2}')
end