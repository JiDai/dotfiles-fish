maapps | while read -l app
    set -l name (echo "$app" | awk '{print $2}')
    set -l path (echo "$app" | awk '{print $3}')

    complete -c marebuild -a $name -f -d $path
end

complete -c marebuild -f
