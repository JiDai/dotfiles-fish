#!/usr/bin/env fish

source helpers.fish

set SYMLINK_PATH "$HOME"

function main
	print_title "Remove symlinks"

	set base_folder "./symlinks"
	set dest "$HOME"

	for file in (find $base_folder -type f | grep -v '/\.')
		set new_file (string replace "$base_folder/" "$dest/." "$file")
		if test -L "$new_file"
			echo "Remove $new_file"
			rm -f "$new_file"
		end

		# Remove parent folder if empty
		set new_folder (dirname $new_file)
		if test "$new_folder" != "$HOME"
			echo "Remove $new_folder"
			rmdir $new_folder > /dev/null 2>&1
		end
	end


	print_title "Clean custom install"

	echo "Vim pLug"
	rm -f $HOME/.vim/autoload/plug.vim
	rm -rf $HOME/.vim/plugged
	rmdir $HOME/.vim > /dev/null 2>&1

	echo "Go"
	rmdir $HOME/GitHome/go > /dev/null 2>&1


	print_title "Uninstalls"

	if command -v brew > /dev/null 2>&1
		brew uninstall --ignore-dependencies \
			bat \
			curl \
			deno \
			fd \
			fish \
			fswatch \
			fzf \
				glow \
			git \
			gh \
			htop \
			httpie \
			n \
			ncdu \
			openssl \
			pass \
			pass-otp \
			pgcli \
			php \
			python \
			php \
			ripgrep \
			tmux \
			tree \
			twitchdev/twitch/twitch-cli \
			watch \
			yarn

		brew cleanup
		ruby -e (curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)
	end


	print_title "Remove shell in /etc/shells"

	sudo cat /etc/shells | grep -v $HOME/homebrew/bin/fish | sudo tee /etc/shells > /dev/null


	print_title "Cleaning"

	rm -rf "$HOME/opt"

	print_subtitle "All done!"

	echo "You can now change your shell to the the previous one, ex:"
	echo
	echo "   \$ chsh -s \"/bin/bash\""
	echo
	echo "And restart your shell"
	echo
end

main
