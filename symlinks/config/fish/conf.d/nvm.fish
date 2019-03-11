# NVM path

set -x NVM_DIR "$HOME/.nvm"
# creates a symbolic link from $NVM_DIR/current to current active version
set -x NVM_SYMLINK_CURRENT true
# add this to the PATH
set -gx PATH $NVM_DIR/current/bin $PATH