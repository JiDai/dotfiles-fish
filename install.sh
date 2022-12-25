#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

export PATH="${HOME}/opt/bin:${PATH}"
export PATH="${HOME}/homebrew/sbin:${HOME}/homebrew/bin:${PATH}"

prerequisites() {
	if ! command -v brew >/dev/null 2>&1; then
		if [[ ! -d "${HOME}/homebrew" ]]; then
			mkdir "${HOME}/homebrew"
		fi
		curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C "${HOME}/homebrew"
	fi

	brew update
	brew upgrade
	# Installed packages must be also declared in uninstall.sh
	brew install \
		bat \
		curl \
		deno \
		fd \
		fish \
		fswatch \
		fzf \
		git \
		gh \
		glow \
		htop \
		httpie \
		n \
		ncdu \
		openssl \
		p7zip \
		pass \
		pass-otp \
		pgcli \
		php \
		python \
		php \
		ripgrep \
		timg \
		tmux \
		tree \
		twitchdev/twitch/twitch-cli \
		watch \
		yarn
}

main() {
	mkdir -p "${HOME}/opt/bin"

	if ! prerequisites; then
		echo "Error while installing prerequisites"
	fi

	./install.fish
}

main
