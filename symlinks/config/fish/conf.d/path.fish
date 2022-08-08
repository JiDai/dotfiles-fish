set -gx PATH /usr/local/bin $PATH

# Path to Oh My Fish install.
set -gx OMF_PATH $HOME/opt/omf

# Customize Oh My Fish configuration path.
set -gx OMF_CONFIG $HOME/.config/omf

# Brew
if test -d $HOME/homebrew
    set -gx PATH $HOME/homebrew/sbin $HOME/homebrew/bin $PATH
end

# Custom binaries
if test -d $HOME/opt/bin
    set -gx PATH $HOME/opt/bin $PATH
end

# inaries in node-modules
set -gx PATH ./node_modules/.bin/ $PATH

# go
set -gx GOROOT /Users/jidai/go-sdk/go1.19 #gosetup
set -gx GOPATH /Users/jidai/GitHome/go #gosetup
set -gx PATH $GOPATH $GOROOT $PATH

# CLI PostGres
set -gx PATH /Applications/Postgres.app/Contents/Versions/latest/bin $PATH
