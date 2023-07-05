set -gx SF_PATH "$HOME/Work/spacefill"

set -gx DIRENV_LOG_FORMAT

abbr wk "cd ~/Work/"
abbr sf "cd $SF_PATH"
abbr sff "cd $SF_PATH/services/frontends"
abbr sfd "cd $SF_PATH/databases"
abbr sffa "cd $SF_PATH/services/frontends/packages/admin-console/"
abbr sffe "cd $SF_PATH/services/frontends/packages/external-console/"
abbr sfe2e "cd $SF_PATH/services/frontends/packages/end2end"
abbr sfui "cd $SF_PATH/services/frontends/packages/uikit"
abbr sfgqlupdate "npm --prefix $SF_PATH/services/frontends/packages/shared run download-graphql-schema"
abbr sfi18n "npm --prefix $SF_PATH/services/frontends/packages/shared run i18n"

set -gx PATH "$SF_PATH/scripts" "$PATH"
