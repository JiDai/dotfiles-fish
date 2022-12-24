#!/usr/bin/env fish

source './symlinks/config/fish/functions/realpath.fish'
source './helpers.fish'

set SCRIPT_DIR (realpath '.')

print_title "Install fisher and plugins"
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fisher install PatrickF1/fzf.fish
fisher install kidonng/preview.fish

print_title "Installs and configure tools"

for file in $SCRIPT_DIR/install/*
	set basenameFile (string replace -r '(.*)\.[^.]+$' '$1' (basename $file))

	print_subtitle "Configure $basenameFile"

	test -r "$file"; and fish "$file"
end



print_title "Symlinks"

set base_folder "./symlinks"
set dest "$HOME"

for file in (find $base_folder -type f | grep -v '/\.')
	set file_dir (dirname $file)

	# Root folder
	if test "$base_folder" = "$file_dir"
		ln -sf (realpath $file) "$dest/."(basename $file)
		echo "$file symlinked."
		continue
	end

	#set new_file_dir "${file_dir/$base_folder\//}"
	set new_file_dir (string replace "$base_folder/" "$dest/." "$file_dir")
	if ! test -d $new_file_dir
		mkdir -p "$new_file_dir"
		echo "$new_file_dir created"
	end

	ln -sf (realpath $file) "$new_file_dir"
	echo "$file symlinked"
end



print_title "Changing shell..."

if command -v brew > /dev/null 2>&1
	set shell_fish (brew --prefix)"/bin/fish"
	if grep "$shell_fish" /etc/shells
		echo "Fish path already in /etc/shells"
	else
		echo "$shell_fish" | sudo tee -a /etc/shells
	end
else if command -v apt-get > /dev/null 2>&1
	set shell_fish "/usr/local/bin/fish"
	if grep "$shell_fish" /etc/shells
		echo "Fish path already in /etc/shells"
	else
		echo "$shell_fish" | sudo tee -a /etc/shells
	end
end


print_title "Cleanup"

if command -v brew > /dev/null 2>&1
	brew cleanup
else if command -v apt-get > /dev/null 2>&1
	sudo apt-get autoremove -y
	sudo apt-get clean all
end


print_title "All done!"

print_subtitle "Next steps to finish installation : "

echo "Change your shell with the command:"
echo
echo "   \$ chsh -s $shell_fish"
echo
echo "Then restart your shell"
echo
echo "Install VIM plugins, in vim type :"
echo
echo "   :PlugInstall"
echo
