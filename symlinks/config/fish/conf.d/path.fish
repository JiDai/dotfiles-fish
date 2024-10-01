set -gx PATH /usr/local/bin $PATH
# Brew
if test -d $HOME/homebrew
	set -gx PATH $HOME/homebrew/sbin $HOME/homebrew/bin $PATH
end

# init asdf configuration
source (brew --prefix asdf)"/libexec/asdf.fish"

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
