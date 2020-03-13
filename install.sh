#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

export PATH="${HOME}/opt/bin:${PATH}"
export PATH="${HOME}/homebrew/sbin:${HOME}/homebrew/bin:${PATH}"

prerequisites() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        if ! command -v brew > /dev/null 2>&1; then
          if [[ ! -d "${HOME}/homebrew" ]]; then
              mkdir "${HOME}/homebrew"
          fi
          curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C "${HOME}/homebrew"
        fi

        brew update
        brew upgrade
        # Installed packages must be also declared in uninstall.sh
        brew install \
          htop \
          curl \
          ncdu \
          git \
          fswatch \
          openssl \
          python \
          tree \
          hub \
          httpie \
          mosh \
          watch \
          fish \
          pgcli \
          ripgrep \
          fzf \
          tmux \
          python \
          yarn
          pass \
          pass-otp \
          gnupg \
          watchman
    elif command -v apt-get > /dev/null 2>&1; then
        sudo apt-get update
        sudo apt-get upgrade -y -qq
        sudo apt-get install -y -qq apt-transport-https

        sudo apt-get install -y -qq \
            bash \
            bash-completion \
            htop \
            curl \
            git \
            tree \
            mosh \
            pgcli \
            fzf \
            python \
            tmux \
            yarn
        curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.10.0/ripgrep_0.10.0_amd64.deb
        sudo dpkg -i ripgrep_0.10.0_amd64.deb

        # fish 3
        sudo sh -c "echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/3/Debian_9.0/ /' > /etc/apt/sources.list.d/shells:fish:release:3.list"
        wget -nv https://download.opensuse.org/repositories/shells:/fish:/release:/3/Debian_9.0/Release.key -O Release.key
        sudo apt-key add - < Release.key
        sudo apt-get update
        sudo apt-get install -y -qq fish

        # Pyenv
        curl https://pyenv.run | bash
    fi
}


main() {
    mkdir -p "${HOME}/opt/bin"

    if ! prerequisites; then
        echo "Error while installing prerequisites"
    fi

    ./install.fish
}

main
