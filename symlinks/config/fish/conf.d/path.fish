set -gx PATH /usr/local/bin $PATH
# Brew
if test -d /opt/homebrew
	set -gx PATH /opt/homebrew/sbin /opt/homebrew/bin $PATH
end

# Custom binaries
if test -d $HOME/opt/bin
	set -gx PATH $HOME/opt/bin $PATH
end

# Binaries in node-modules
set -gx PATH ./node_modules/.bin/ $PATH

# CLI PostGres
set -gx PATH /Applications/Postgres.app/Contents/Versions/latest/bin $PATH

set -gx N_PREFIX $HOME/.n
set -gx PATH $N_PREFIX/bin $PATH

# WebStorm cli
set -gx PATH /Applications/WebStorm.app/Contents/MacOS $PATH
