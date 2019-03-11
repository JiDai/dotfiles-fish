#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source helpers.sh

SYMLINK_PATH="${HOME}"

export PATH="${HOME}/opt/bin:${PATH}"
export PATH="${HOME}/homebrew/sbin:${HOME}/homebrew/bin:${PATH}"


main() {
    mkdir -p "${HOME}/opt/bin"


    print_title "Installs"

    for file in "${SCRIPT_DIR}/install"/*; do
        local basenameFile=$(basename ${file%.*})
        print_subtitle "${basenameFile}"

        [[ -r "${file}" ]] && [[ -x "${file}" ]] && "${file}"
    done


    print_title "Configure Fish"

    if ! command -v fish > /dev/null 2>&1; then
        echo "fish not found"
        exit 1
    fi

    if [[ -d "$HOME/opt/omf" ]]; then
        rm -rf "$HOME/opt/omf"
    fi
    curl -L https://get.oh-my.fish > install_omf
    fish install_omf --noninteractive --path=$HOME/opt/omf --config=./config/omf
    rm -f install_omf


    print_subtitle "Changing shell..."

    if [[ "${IS_MACOS}" == true ]]; then
        shell_fish="$(brew --prefix)/bin/fish"
        if grep "$shell_fish" /etc/shells; then
            echo "Fish path already in /etc/shells"
        else
            echo "$shell_fish" | sudo tee -a /etc/shells
        fi
    elif command -v apt-get > /dev/null 2>&1; then
        shell_fish="/usr/local/bin/fish"
        if grep "$shell_fish" /etc/shells; then
            echo "Fish path already in /etc/shells"
        else
            echo "$shell_fish" | sudo tee -a /etc/shells
        fi
    fi

    # Symlinks must be init after installation of OMF to avoid errors during install
    print_title "Symlinks"

    base_folder="./symlinks"
    dest="$HOME"
    for file in $(find ${base_folder} -type f  | grep -v '/\.'); do
        file_dir="$(dirname ${file})"

        # Root folder
        if [[ "$base_folder" == "$file_dir" ]]; then
            ln -sf "$(realpath ${file})" "$dest/.$(basename $file)"
            echo "$file symlinked."
            continue
        fi

        new_file_dir="${file_dir/$base_folder\//$dest/.}"
        if [[ ! -d ${new_file_dir} ]]; then
            mkdir -p "$new_file_dir"
            echo "$new_file_dir created"
        fi

        ln -sf "$(realpath ${file})" "$new_file_dir"
        echo "$file symlinked."
    done


    print_title "Cleanup"

    if [[ "${IS_MACOS}" == true ]]; then
        brew cleanup
    elif command -v apt-get > /dev/null 2>&1; then
        sudo apt-get autoremove -y
        sudo apt-get clean all
    fi


    print_title "All done!"

    echo "Change your shell with the command:"
    echo
    echo "$ chsh -s \"$shell_fish\""
    echo
    echo "Then restart your shell and run in this folder:"
    echo
    echo "$ ./install.fish"
    echo
    echo "Install VIM plugins, in vim type :"
    echo
    echo ":PlugInstall"
    echo
}

main
