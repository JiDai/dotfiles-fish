set -x IS_MACOS ""
set -x IS_LINUX ""

switch (uname -s)
    case "Darwin"
        set -x IS_MACOS 1
    case "Linux"
        set -x IS_LINUX 1
    case '*'
        echo "Unknown OS"
end

if test -n "$IS_MACOS"
    set -x MA_FOLDER "$HOME/MAWork"
    set -x MA_REPOSITORY "$MA_FOLDER/MeilleursAgents"
else
    set -x MA_FOLDER "$HOME"
    set -x MA_REPOSITORY "$MA_FOLDER/meilleursagents"
end

set -x MA_APPS \
'Barometre' 'barometre' "$MA_REPOSITORY/apps/Barometre" \
'ConnectAPI' 'connectapi' "$MA_REPOSITORY/apps/ConnectAPI" \
'GeoAPI' 'geoapi' "$MA_REPOSITORY/apps/GeoAPI" \
'IndiceAPI' 'indiceapi' "$MA_REPOSITORY/apps/IndiceAPI" \
'luigi' 'luigi' "$MA_REPOSITORY/apps/luigi" \
'MailAPI' 'mailapi' "$MA_REPOSITORY/apps/MailAPI" \
'MarketAPI' 'marketapi' "$MA_REPOSITORY/apps/MarketAPI" \
'MediaAPI' 'mediaapi' "$MA_REPOSITORY/apps/MediaAPI" \
'MyPro' 'mypro' "$MA_REPOSITORY/apps/MyPro" \
'MyProAPI' 'myproapi' "$MA_REPOSITORY/apps/MyProAPI" \
'Partners' 'partners' "$MA_REPOSITORY/apps/Partners" \
'PdfAPI' 'pdfapi' "$MA_REPOSITORY/apps/PdfAPI" \
'ProfileAPI' 'profileapi' "$MA_REPOSITORY/apps/ProfileAPI" \
'SalesforceAPI' 'salesforceapi' "$MA_REPOSITORY/apps/SalesforceAPI" \
'ThirdPartiesAPI' 'thirdpartiesapi' "$MA_REPOSITORY/apps/ThirdPartiesAPI" \
'Thumbor' 'thumbor' "$MA_REPOSITORY/apps/Thumbor" \
'Tools' 'tools' "$MA_REPOSITORY/apps/Tools" \
'Wa' 'wa' "$MA_REPOSITORY/apps/Wa" \
'www' 'www' "$MA_REPOSITORY/apps/www"

set -x MA_APPS_NAMES
set -x MA_APPS_SERVICES
set -x MA_APPS_PATHS
set -l counter 0

for i in $MA_APPS
    if test (math $counter % 3) = 0
        set MA_APPS_NAMES $MA_APPS_NAMES $i
    end
    if test (math $counter % 3) = 1
        set MA_APPS_SERVICES $MA_APPS_SERVICES $i
    end
    if test (math $counter % 3) = 2
        set MA_APPS_PATHS $MA_APPS_PATHS $i
    end
    set counter (math $counter + 1)
end


############################################
### ENV
#

set ANSIBLE_VAULT_PASSWORD_FILE ~/.vagrant_vault_pass.txt

set -x MA_INSTANCE "$USER"
set -x MA_ENV "dev"
set -x ENVIRONMENT "dev-server"
set -x SSL_DISABLED "True"
set -x SSL_ACTIVE "False"
set -x WEBPACK_NO_ESLINT 1

# set -x PGDATABASE "meilleursagents_dev"
# set -x PGUSER "meilleursagents"
# set -x PGHOST "www-db-master.dev-internal.meilleursagents"

# To make make init-dev work without GIT repo
set -x VERSION_HASH "dev"


# Source ansible local rc manually because file does not contains `export` keyword
set -l ansible_local_rc_file "$HOME/.ansible-localrc"
if test -r $ansible_local_rc_file
    while read -l line
        if string match --quiet -r '^#' $line
            continue
        end
        set -l keyvalue (string split -m 1 = -- $line)
        set -gx $keyvalue # this will set the variable named by $kv[1] to the rest of $kv
    end < $ansible_local_rc_file
end

############################################
### Aliases
#

alias ma='cd $MA_FOLDER'
alias www='cd $MA_REPOSITORY/apps/www'
alias site='cd $MA_REPOSITORY/apps/www/www/frontend/site'
alias react='cd $MA_REPOSITORY/apps/www/www/frontend/react'
alias common='cd $MA_REPOSITORY/apps/www/www/frontend/common'
alias mypro='cd $MA_REPOSITORY/apps/MyPro'
alias portfolio='cd $MA_REPOSITORY/apps/Portfolio/portfolio/frontend'
alias jinjacommon='cd $MA_REPOSITORY/apps/JinjaCommon'
alias tools='cd $MA_REPOSITORY/apps/Tools/tools/frontend'
alias envdev='cd $MA_REPOSITORY/tools/env-dev'

alias jk_e2e_all='/Users/jordid/MAWork/JenkinsAPI/.venv/bin/python /Users/jordid/MAWork/JenkinsAPI/e2e_local_all.py'
alias jk_e2e='/Users/jordid/MAWork/JenkinsAPI/.venv/bin/python /Users/jordid/MAWork/JenkinsAPI/e2e_local.py'
alias jk_deploy='/Users/jordid/MAWork/JenkinsAPI/.venv/bin/python /Users/jordid/MAWork/JenkinsAPI/deploy.py'

alias selenium-chrome="open vnc://localhost:secret@localhost:5900"

abbr --add get_expected_responses rsync -rv jordid:~/meilleursagents/apps/www/tests/unit/views/.expected_responses/ $MA_REPOSITORY/apps/www/tests/unit/views/.expected_responses/
abbr --add tml tmuxp load ~/.tmuxp-ma.yml
