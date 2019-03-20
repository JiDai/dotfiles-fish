
set -gx IS_MACOS 0
set -gx IS_LINUX 0
switch (uname -s)
    case "Darwin"
        set -gx IS_MACOS 1
    case "Linux"
        set -gx IS_LINUX 1
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

set ANSIBLE_VAULT_PASSWORD_FILE ~/.vagrant_vault_pass.txt

set -x MA_INSTANCE "$USER"
set -x MA_ENV "dev"
set -x ENVIRONMENT "dev-server"
set -x SSL_DISABLED "True"
set -x SSL_ACTIVE "False"

set -x PGDATABASE "meilleursagents_dev"
set -x PGUSER "meilleursagents"
set -x PGHOST "www-db-master.dev-internal.meilleursagents"
