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


# The next line updates PATH for the Google Cloud SDK.
bass source '$HOME/opt/google-cloud-sdk/path.bash.inc'

# The next line enables shell command completion for gcloud.
bass source '$HOME/opt/google-cloud-sdk/completion.bash.inc'
