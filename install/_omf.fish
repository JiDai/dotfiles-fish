#!/usr/bin/env fish

if test -d "$HOME/opt/omf"
    rm -rf "$HOME/opt/omf"
end

curl -L https://get.oh-my.fish > install_omf
fish install_omf --noninteractive --path=$HOME/opt/omf --config=./config/omf
rm -f install_omf
