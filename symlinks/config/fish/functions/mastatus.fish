function mastatus -d "[MA] Give a status of all app and services"
    set -lx SCHEME "https"

    # if type ! service-checker
    #     echo "service-checker is not defined"
    #     echo "Download and copy it in your PATH:"
    #     echo "https://console.cloud.google.com/storage/browser/ma-public-files?project=ma-prod"
    #     return 1
    # end
    set -lx SCHEME "http"
    set -lx SSL_DISABLED "True"
    set -lx INSTANCE_NAME "jordid"

    service-checker -name dev -dbHost "$PGHOST" -dbPort 5432 -dbUser "$PGUSER" -dbName "$PGDATABASE"

    if test "$SSL_ACTIVE" = "False"
        or test "$SSL_DISABLED" = "True"
        set -lx SCHEME "http"
    end

    service-checker -name www -url "$SCHEME://$INSTANCE_NAME-www.meilleursagents.tech/ping"
    service-checker -name mypro -url "$SCHEME://$INSTANCE_NAME-www.meilleursagents.tech/my/realtor/ping"
    service-checker -name portfolio -url "$SCHEME://$INSTANCE_NAME-www.meilleursagents.tech/portfolio/ping"
    service-checker -name media -url "$SCHEME://$INSTANCE_NAME-api.meilleursagents.tech/media/v1/ping"
    service-checker -name myproapi -url "$SCHEME://$INSTANCE_NAME-api.meilleursagents.tech/mypro/v1/ping"
    service-checker -name market -url "$SCHEME://$INSTANCE_NAME-api.meilleursagents.tech/market/v1/ping"
    service-checker -name indices -url "$SCHEME://$INSTANCE_NAME-api.meilleursagents.tech/indices/v1/ping"
    service-checker -name pdfapi -url "$SCHEME://$INSTANCE_NAME-api.meilleursagents.tech/pdf/ping"
    service-checker -name mailapi -url "$SCHEME://$INSTANCE_NAME-api.meilleursagents.tech/mail/ping"
    service-checker -name tools -url "$SCHEME://$INSTANCE_NAME-tools.meilleursagents.tech/ping"
    service-checker -name geo -url "$SCHEME://$INSTANCE_NAME-api.meilleursagents.tech/geo/v1/ping"

    service-checker -name redis -tcp "localhost:6379"
    service-checker -name mailhog -url "http://127.0.0.1:8025/ping"
end

