set -gx SF_PATH "$HOME/Work/spacefill"

set -gx DIRENV_LOG_FORMAT

abbr wk "cd ~/Work/"
abbr sf "cd $SF_PATH"
abbr sff "cd ~/Work/frontends"
abbr sfra "cd ~/Work/rest-api"
abbr sfb "cd ~/Work/backend"
abbr sfd "cd ~/Work/database"
abbr sffa "cd ~/Work/frontends/packages/admin-console/"
abbr sffe "cd ~/Work/frontends/packages/external-console/"
abbr sfe2e "cd ~/Work/frontends/packages/end2end"
abbr sfui "cd ~/Work/frontends/packages/uikit"
abbr sfdbsandbox "pgcli postgres://\$AWS_SANDBOX_DB_USERNAME:\$AWS_SANDBOX_DB_PASSWORD@rds-sandbox.cwlralkfkokc.eu-west-3.rds.amazonaws.com/sandbox"
abbr sfdbstaging "pgcli postgres://\$AWS_STAGING_DB_USERNAME:\$AWS_STAGING_DB_PASSWORD@demo.cwlralkfkokc.eu-west-3.rds.amazonaws.com:5432/staging"
abbr sfdbprod "pgcli postgres://\$AWS_PROD_DB_USERNAME:\$AWS_PROD_DB_PASSWORD@production-replica.cwlralkfkokc.eu-west-3.rds.amazonaws.com:5432/production"

set -gx PATH "$SF_PATH/scripts" "$PATH"
set -gx PATH "$HOME/homebrew/opt/libpq/bin" "$PATH"

set -gx LDFLAGS "-L/Users/jordid/homebrew/opt/libpq/lib"
set -gx CPPFLAGS "-I/Users/jordid/homebrew/opt/libpq/include"

set -gx PKG_CONFIG_PATH "/Users/jordid/homebrew/opt/libpq/lib/pkgconfig"

set -gx DENO_INSTALL "$HOME/.deno"
set -gx PATH "$DENO_INSTALL/bin:$PATH"
