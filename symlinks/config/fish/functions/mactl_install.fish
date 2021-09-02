function mactl_install --description "[MA] Install and update mactl tool"
    if ! type -f gh >/dev/null 2>&1
        echo "GitHub CLI is not installed"
        echo "Go to https://github.com/cli/cli#installation"
        return 1
    end


    set -l release_version (gh --repo MeilleursAgents/MA-Integration release list | grep Latest | awk '{print $1}')
    set -l filename "$HOME/tmp/MA-Integration_"$release_version"_Darwin_x86_64.tar.gz"

    rm -f $filename

    gh --repo MeilleursAgents/MA-Integration release download $release_version --pattern '*Darwin_x86_64.tar.gz' --dir $HOME/tmp/
    tar xf $filename -C $HOME/tmp

    mv $HOME/tmp/mactl $HOME/opt/bin/mactl
    chmod +x $HOME/opt/bin/mactl
end
