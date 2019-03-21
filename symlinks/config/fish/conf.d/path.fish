# Brew
if test -d $HOME/homebrew
    set -gx PATH $HOME/homebrew/sbin $HOME/homebrew/bin $PATH
end

# Misc
if test -d $HOME/.local/bin
    set -gx PATH $HOME/.local/bin $PATH
end

if test -d $HOME/opt/bin
    set -gx PATH $HOME/opt/bin $PATH
end

# Python stuff
if test -d $HOME/opt/python/bin
    set -gx PATH $HOME/opt/python/bin $PATH
end

# N node version manager
if test -d $HOME/n
    set -gx PATH $HOME/n/bin $PATH
end

# GO Lang
if test ! -d $HOME/go-workspace
  mkdir $HOME/go-workspace
end

set -gx GOPATH $HOME/go-workspace # don't forget to change your path correctly!
set -gx PATH $GOPATH/bin $PATH
set -gx PATH $GOROOT/bin $PATH


# The next line updates PATH for the Google Cloud SDK.
bass source '$HOME/opt/google-cloud-sdk/path.bash.inc'

# The next line enables shell command completion for gcloud.
bass source '$HOME/opt/google-cloud-sdk/completion.bash.inc'
