set -gx PATH /usr/local/bin $PATH

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

# CLI PostGres
set -gx PATH /Applications/Postgres.app/Contents/Versions/latest/bin $PATH
