#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

main() {
    if [[ "${IS_MACOS}" == true ]]; then
        if ! command -v brew > /dev/null 2>&1; then
          mkdir "${HOME}/homebrew" && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C "${HOME}/homebrew"
          # After install source path of homebrew for current run
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
          tree \
          hub \
          httpie \
          pass \
          pass-otp \
          mosh \
          watch \
          fish \
          pgcli \
          ripgrep \
          gnupg \
          fzf \
          tmux
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
            fish \
            pgcli \
            fzf \
            tmux

        curl -LO https://github.com/BurntSushi/ripgrep/releases/download/0.10.0/ripgrep_0.10.0_amd64.deb
        sudo dpkg -i ripgrep_0.10.0_amd64.deb

        pip install --user tmuxp
    fi

    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    export PYENV_ROOT=$HOME/opt/pyenv
    if [[ -d "$PYENV_ROOT" ]]; then
        rm -rf $PYENV_ROOT
    fi
    curl https://pyenv.run | bash
    if [[ ! -d "$PYENV_ROOT/plugins/pyenv-virtualenv" ]]; then
        git clone https://github.com/pyenv/pyenv-virtualenv.git $PYENV_ROOT/plugins/pyenv-virtualenv
    fi

}

main
