set -gx SF_PATH "$HOME/Work/spacefill"

set -gx DIRENV_LOG_FORMAT

abbr wk "cd ~/Work/"
abbr sf "cd $SF_PATH"
abbr sff "cd $SF_PATH/services/frontends"
abbr sffa "cd $SF_PATH/services/frontends/packages/admin-console/"
abbr sffe "cd $SF_PATH/services/frontends/packages/external-console/"
abbr sfe2e "cd $SF_PATH/services/frontends/packages/end2end"

set -gx PATH "$SF_PATH/scripts" "$PATH"
