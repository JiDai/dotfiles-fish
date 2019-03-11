# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

set -U FZF_LEGACY_KEYBINDINGS 0
# Load Oh My Fish configuration.
source $OMF_PATH/init.fish

