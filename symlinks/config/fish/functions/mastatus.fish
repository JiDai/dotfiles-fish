function mastatus -d "[MA] Give a status of all app and services"
    set -l SCHEME "https"

    if ! type -q service-checker
        echo "service-checker is not defined"
        echo "Download and copy it in your PATH:"
        echo "https://console.cloud.google.com/storage/browser/ma-public-files?project=ma-prod"
        return 1
    end

    set -l SCHEME "http"
    set -l SSL_DISABLED "True"
    set -l INSTANCE_NAME "jordid"
    set -l DOMAIN_NAME "jordid"


    set -l MA_APPS "www www $INSTANCE_NAME-www.$DOMAIN_NAME/ping"
    set -l MA_APPS $MA_APPS "mediaapi MediaAPI $INSTANCE_NAME-api.$DOMAIN_NAME/media/v1/ping"
    for i in $MA_APPS
      set -l app_args (echo $i | string split ' ')
    end

    # MA_APPS+=("geoapi GeoAPI ${URL_PREFIX}-api.${DOMAIN_NAME}/geo/v1/ping");
    # MA_APPS+=("marketapi MarketAPI ${URL_PREFIX}-api.${DOMAIN_NAME}/market/v1/ping");
    # MA_APPS+=("indiceapi IndiceAPI ${URL_PREFIX}-api.${DOMAIN_NAME}/indices/v1/ping");
    # MA_APPS+=("mailapi MailAPI ${URL_PREFIX}-api.${DOMAIN_NAME}/mail/ping");
    # MA_APPS+=("mypro MyPro ${URL_PREFIX}-www.${DOMAIN_NAME}/my/realtor/ping");
    # MA_APPS+=("myproapi MyProAPI ${URL_PREFIX}-api.${DOMAIN_NAME}/mypro/v1/ping");
    # MA_APPS+=("connectapi ConnectAPI ${URL_PREFIX}-api.${DOMAIN_NAME}/connect/v1/ping");
    # MA_APPS+=("past-sales-report Past-Sales-Report ${URL_PREFIX}-www.${DOMAIN_NAME}/prix-ventes-realisees/form/");
    # MA_APPS+=("profileapi ProfileAPI ${URL_PREFIX}-api.${DOMAIN_NAME}/profile/ping");
    # MA_APPS+=("wa Wa ${URL_PREFIX}-wa.${DOMAIN_NAME}/ping");
    # MA_APPS+=("pdfapi PdfAPI ${URL_PREFIX}-api.${DOMAIN_NAME}/pdf/v1/ping");
    # MA_APPS+=("tools Tools ${URL_PREFIX}-tools.${DOMAIN_NAME}/ping");
    # MA_APPS+=("luigi false ${URL_PREFIX}-luigi.${DOMAIN_NAME}");
    # MA_APPS+=("buffer Buffer ${URL_PREFIX}-buffer.${DOMAIN_NAME}/ping");
    # MA_APPS+=("salesforceapi SalesforceAPI ${URL_PREFIX}-salesforceapi.${DOMAIN_NAME}/ping");
    # MA_APPS+=("thirdpartiesapi ThirdPartiesAPI ${URL_PREFIX}-thirdparties.${DOMAIN_NAME}/ping");
    # MA_APPS+=("barometre Barometre ${URL_PREFIX}-barometre.${DOMAIN_NAME}/ping");
    # MA_APPS+=("partners Partners ${URL_PREFIX}-partners-ma.${DOMAIN_NAME}/ping");
    # MA_APPS+=("airflow false ${URL_PREFIX}-airflow.${DOMAIN_NAME}/admin/");
    # MA_APPS+=("redis-server false false");
    # MA_APPS+=("thumbor Thumbor ${URL_PREFIX}-thumbor.${DOMAIN_NAME}$(get_thumbor_url_path)");
    # declare -g APPS_TO_RESTART=();
    # declare -g APPS_TO_REBUILD=();
    # for app in "${MA_APPS[@]}";
    # do
    #     read -r -a parts <<< "${app}";
    #     APPS_TO_RESTART+=("${parts[0]}");
    #     if [[ ${parts[1]:-} != "false" ]]; then
    #         APPS_TO_REBUILD+=("${parts[1]}");
    #     fi;
    # done



    # local DB_HOST=${PGHOST:-"www-db-master.dev-internal.meilleursagents"};
    # local DB_USER=${PGUSER:-"meilleursagents"};
    # local DB_DATABASE=${PGDATABASE:-"meilleursagents_dev"};
    # service-checker -name dev -dbHost "${DB_HOST}" -dbPort 5432 -dbUser "${DB_USER}" -dbName "${DB_DATABASE}";
    # service-checker -name mailhog -url "http://${MA_INSTANCE:-${USER}}-mailhog.meilleursagents.tech";
    # service-checker -name redis -tcp "localhost:6379";
    # config_apps;

    # for app in "${MA_APPS[@]}";
    # do
    #     read -r -a parts <<< "${app}";
    #     if [[ ${parts[2]:-} != "false" ]]; then
    #         service-checker -name "${parts[0]}" -url "${parts[2]}";
    #     fi;
    # done



    # service-checker -name dev -dbHost "$PGHOST" -dbPort 5432 -dbUser "$PGUSER" -dbName "$PGDATABASE"

    # if test "$SSL_ACTIVE" = "False"
    #     or test "$SSL_DISABLED" = "True"
    #     set -lx SCHEME "http"
    # end

    # service-checker -name www -url "$SCHEME://$INSTANCE_NAME-www.meilleursagents.tech/ping"
    # service-checker -name mypro -url "$SCHEME://$INSTANCE_NAME-www.meilleursagents.tech/my/realtor/ping"
    # service-checker -name portfolio -url "$SCHEME://$INSTANCE_NAME-www.meilleursagents.tech/portfolio/ping"
    # service-checker -name media -url "$SCHEME://$INSTANCE_NAME-api.meilleursagents.tech/media/v1/ping"
    # service-checker -name myproapi -url "$SCHEME://$INSTANCE_NAME-api.meilleursagents.tech/mypro/v1/ping"
    # service-checker -name market -url "$SCHEME://$INSTANCE_NAME-api.meilleursagents.tech/market/v1/ping"
    # service-checker -name indices -url "$SCHEME://$INSTANCE_NAME-api.meilleursagents.tech/indices/v1/ping"
    # service-checker -name pdfapi -url "$SCHEME://$INSTANCE_NAME-api.meilleursagents.tech/pdf/ping"
    # service-checker -name mailapi -url "$SCHEME://$INSTANCE_NAME-api.meilleursagents.tech/mail/ping"
    # service-checker -name tools -url "$SCHEME://$INSTANCE_NAME-tools.meilleursagents.tech/ping"
    # service-checker -name geo -url "$SCHEME://$INSTANCE_NAME-api.meilleursagents.tech/geo/v1/ping"

    # service-checker -name redis -tcp "localhost:6379"
    # service-checker -name mailhog -url "http://127.0.0.1:8025/ping"
end

