
function mastatus -d "[MA] Give a status of all app and services"
    function mastatus_call_curl
        source "$HOME/dotfiles-fish/helpers.fish"

        set -l loader "$argv[1]"

        set -l apps (env SCHEME="http" \
        SSL_DISABLED="True" \
        INSTANCE_NAME="$MA_INSTANCE" \
        DOMAIN_NAME="meilleursagents.tech" \
        envsubst < "$HOME/.config/ma-apps.conf")

        echo "App status$loader"

        for app in $apps
            set -l name (echo "$app" | awk '{print $2}')
            set -l url (echo "$app" | awk '{print $4}')

            if ! test -n "$url"
                continue
            end

            set -l code (cat "$HOME/tmp/mastatus-$name")

            if test "$code" = "$loader"
                echo (printf '%20s' $name)"  $loader  $url"
            else if test "$code" = "200"
                echo (printf '%20s' $name)"  "(print_green 200)"  $url"
            else
                echo (printf '%20s' $name)"  "(print_red $code)"  $url"
            end
        end
    end

    funcsave mastatus_call_curl

    set -l SCHEME "https"

    if ! type -q envsubst
        echo "envsubst (part of gettext) is not defined. Maybe you are not on a GNU system."
        echo "On OSX you can install from brew : `brew install gettext"
        echo "If you have issue you can read this : https://stackoverflow.com/questions/14940383/how-to-install-gettext-on-macos-x"
        return 1
    end

    set -l apps (env SCHEME="http" \
      SSL_DISABLED="True" \
      INSTANCE_NAME="$MA_INSTANCE" \
      DOMAIN_NAME="meilleursagents.tech" \
    envsubst < "$HOME/.config/ma-apps.conf")

    if ! test -d "$HOME/tmp"
        mkdir $HOME/tmp
    end

    set -l loader "..."

    for app in $apps
        set -l name (echo "$app" | awk '{print $2}')
        set -l url (echo "$app" | awk '{print $4}')

        if ! test -n "$url"
            continue
        end

        curl --head --write-out '%{response_code}' --insecure --silent --create-dirs --output /dev/null "$url" > "$HOME/tmp/mastatus-$name" &
        echo "$loader" > "$HOME/tmp/mastatus-$name"
    end

    watch -n 1 -t -c -x fish -c "mastatus_call_curl \"$loader\""
end
