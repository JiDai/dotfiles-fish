
# Disable welcome message
set fish_greeting

set -x LANG en_US.UTF-8
set -x LANGUAGE en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8
set -x LC_NUMERIC "en_US.UTF-8"
set -x LC_TIME "en_US.UTF-8"
set -x LC_COLLATE "en_US.UTF-8"
set -x LC_MONETARY "en_US.UTF-8"
set -x LC_MESSAGES "en_US.UTF-8"
set -x LC_PAPER "en_US.UTF-8"
set -x LC_NAME "en_US.UTF-8"
set -x LC_ADDRESS "en_US.UTF-8"
set -x LC_TELEPHONE "en_US.UTF-8"
set -x LC_MEASUREMENT "en_US.UTF-8"
set -x LC_IDENTIFICATION "en_US.UTF-8"

set -U fish_color_command green
set -U fish_color_param normal

if test -f "$HOME/.localrc"
	source $HOME/.localrc
end

if test -d "$HOME/.pyenv"
	set -x PYENV_ROOT $HOME/.pyenv
	set -x PATH $PYENV_ROOT/bin $PATH
	status --is-interactive; and source (pyenv init - | psub)
	status --is-interactive; and source (pyenv virtualenv-init - | psub)
end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jordid/Downloads/google-cloud-sdk/path.fish.inc' ]; . '/Users/jordid/Downloads/google-cloud-sdk/path.fish.inc'; end

set fzf_preview_file_cmd __fzf_preview_file_content
