function maapps -d "[MA] List apps configuration"
    env SCHEME="http" \
        SSL_DISABLED="True" \
        INSTANCE_NAME="$MA_INSTANCE" \
        DOMAIN_NAME="meilleursagents.tech" \
        envsubst < "$HOME/.config/ma-apps.conf"
end

