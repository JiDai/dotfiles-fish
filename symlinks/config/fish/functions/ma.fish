#!/usr/bin/env fish

function ma_status -d "[MA] Give a status of all app and services"
    set -lx SCHEME "https"

    if ! type -q service-checker
      echo "service-checker is not defined"
      echo "Download and copy it in your PATH:"
      echo "https://console.cloud.google.com/storage/browser/ma-public-files?project=ma-prod"
      return
    end

    service-checker -name dev -dbHost "$PGHOST" -dbPort 5432 -dbUser "$PGUSER" -dbName "$PGDATABASE"

    if test "$SSL_ACTIVE" = "False"; or test "$SSL_DISABLED" = "True"
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
    service-checker -name followup -url "$SCHEME://$INSTANCE_NAME-followup.meilleursagents.tech/ping"
    service-checker -name geo -url "$SCHEME://$INSTANCE_NAME-api.meilleursagents.tech/geo/v1/ping"

    service-checker -name redis -tcp "localhost:6379"
    service-checker -name mailhog -url "http://127.0.0.1:8025/ping"
end

function ma_restart -d "[MA] Restart all apps and services"
  set -l apps 'www' 'portfolio' 'mediaapi' 'marketapi' 'geoapi' 'mailapi' 'indiceapi' 'mypro' 'myproapi' 'followup' 'partners' 'profileapi' 'pdfapi' 'webanalytics' 'barometre' 'thirdpartiesapi'

  for i in $apps
      set -l appName (ls "$MA_REPOSITORY/apps/" | grep -i "$i" | head -1)
      set -l appNameLower (echo "$appName" | tr '[:upper:]' '[:lower:]')

      echo "Restarting $appName..."
      sudo systemctl restart "(appName  | tr '[:lower:]')"
  end
end

#rebuild() {
#  local apps=(${@:-'www' 'Portfolio' 'MediaAPI' 'MarketAPI' 'GeoAPI' 'MailAPI' 'IndiceAPI' 'MyPro' 'MyProAPI' 'FollowUp' 'Partners' 'ProfileAPI' 'PdfAPI' 'WebAnalytics' 'Barometre' 'ThirdPartiesAPI'})
#
#  for i in ${apps[@]}; do
#      local appName=$(ls "${HOME}/meilleursagents/apps/" | grep -i "${i}" | head -1)
#      echo "Rebuilding ${appName}..."
#
#      pushd "${HOME}/meilleursagents/apps/${appName}"
#
#      make init-dev
#      if [[ $(make -qp | grep build-assets | wc -l) -ge 1 ]]
#        make build-assets
#      end
#
#      popd
#
#      restart "${appName}"
#  done
#}
#
#logs() {
#  local logs_path=""
#  local apps=${@-}
#
#  if [[ -n "${apps}" ]]
#    for app in ${apps[@]}; do
#      local app_logs_path="/var/log/ma/${app,,}.log"
#      if [[ -e "${app_logs_path}" ]]
#        logs_path="${logs_path} ${app_logs_path}"
#      else
#        echo "No log file for ${app}"
#        return 1
#      end
#    done
#  else
#    logs_path=/var/log/ma/*.log
#  end
#
#  sudo tail -f ${logs_path}
#}
#
#logs_nginx() {
#  local logs_path=""
#  local apps=${@-}
#
#  if [[ "${apps}" != "" ]]
#    for app in ${apps[@]}; do
#      local app_access_logs_path="/var/log/nginx/${app,,}.access.log"
#      local app_error_logs_path="/var/log/nginx/${app,,}.error.log"
#      if [[ -e "${app_access_logs_path}" ]] && [[ -e "${app_error_logs_path}" ]]
#        logs_path="${logs_path} ${app_access_logs_path} ${app_error_logs_path}"
#      end
#    done
#  end
#
#  if [[ "${logs_path}" = "" ]]
#    logs_path=/var/log/nginx/*.log
#  end
#
#  sudo tail -f ${logs_path}
#}
#
#if [[ -e "${MA_REPOSITORY}/tools/.bashrc" ]]
#  source "${MA_REPOSITORY}/tools/.bashrc"
#end
#
#if [[ -e "${HOME}/MA-Infra/tools/gssh/gssh.sh" ]]
#  source "${HOME}/MA-Infra/tools/gssh/gssh.sh"
#end
#
