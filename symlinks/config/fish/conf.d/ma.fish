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

set -x PGDATABASE "meilleursagents_dev"
set -x PGUSER "meilleursagents"
set -x PGHOST "www-db-master.dev-internal.meilleursagents"

# To make make init-dev work without GIT repo
set -x VERSION_HASH "dev"



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

alias selenium-chrome="open vnc://localhost:secret@localhost:5900"

abbr --add get_expected_responses rsync -rv jordid:~/meilleursagents/apps/www/tests/unit/views/.expected_responses/ $MA_REPOSITORY/apps/www/tests/unit/views/.expected_responses/
abbr --add tml tmuxp load ~/.tmuxp-ma.yml
