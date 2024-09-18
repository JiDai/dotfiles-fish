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

set -gx PATH "$SF_PATH/scripts" "$PATH"


  fish_add_path /Users/jordid/homebrew/opt/libpq/bin

  set -gx LDFLAGS "-L/Users/jordid/homebrew/opt/libpq/lib"
  set -gx CPPFLAGS "-I/Users/jordid/homebrew/opt/libpq/include"

  set -gx PKG_CONFIG_PATH "/Users/jordid/homebrew/opt/libpq/lib/pkgconfig"

set -gx DENO_INSTALL "$HOME/.deno"
set -gx PATH "$DENO_INSTALL/bin:$PATH"
