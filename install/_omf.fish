#!/usr/bin/env fish

if test -d "$HOME/opt/omf"
    rm -rf "$HOME/opt/omf"
end

curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install > install_omf
fish install_omf --noninteractive --path=$HOME/opt/omf --config=./config/omf
rm -f install_omf
