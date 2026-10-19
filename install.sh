#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

export PATH="${HOME}/opt/bin:${PATH}"
export PATH="/opt/homebrew/sbin:/opt/homebrew/bin:${PATH}"

prerequisites() {
	if ! command -v brew >/dev/null 2>&1; then
		if [[ ! -d "/opt/homebrew" ]]; then
			mkdir "/opt/homebrew"
		fi
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	fi

	brew update
	brew upgrade
	# Installed packages must be also declared in uninstall.sh
	brew install \
		bat \
		caddy \
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
		jq \
		n \
		ncdu \
		openssl \
		p7zip \
		pass \
		pass-otp \
		pgcli \
		php \
		php \
		ripgrep \
		timg \
		tmux \
		tree \
		twitchdev/twitch/twitch-cli \
		watch \
		yarn

	brew install --cask warp
	curl -fsSL https://claude.ai/install.sh | bash
}

main() {
	mkdir -p "${HOME}/opt/bin"

	if ! prerequisites; then
		echo "Error while installing prerequisites"
	fi

	./install.fish
}

main
