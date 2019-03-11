#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source helpers.sh

SYMLINK_PATH="${HOME}"

main() {
    print_title "Remove symlinks"

    base_folder="./symlinks"
    dest="${HOME}/"
    for file in $(find ${base_folder} -type f | grep -v '/\.'); do
        file_dir="$(dirname ${file})"
        if [[ "$base_folder" == "$file_dir" ]]; then
            continue
        fi

        new_file="${file/$base_folder\//${HOME}/.}"
        echo "$new_file"
        if [[ -h "$new_file" ]]; then
            echo "Remove $new_file"
            rm -f "$new_file"
        fi
    done


#    print_title "Uninstalls"
#
#    brew uninstall \
#        htop \
#        curl \
#        ncdu \
#        git \
#        fswatch \
#        openssl \
#        tree \
#        hub \
#        httpie \
#        pass \
#        pass-otp \
#        mosh \
#        watch \
#        fish \
#        pgcli \
#        ripgrep \
#        gnupg \
#        fzf \
#        tmux
#
#
#    print_title "Cleanup"
#
#    if [[ "${IS_MACOS}" == true ]]; then
#        brew cleanup
#    elif command -v apt-get > /dev/null 2>&1; then
#        sudo apt-get autoremove -y
#        sudo apt-get clean all
#    fi
#
#
#    print_subtitle "All done!"
}

main
