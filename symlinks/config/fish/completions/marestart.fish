maapps | while read -l app
    set -l name (echo "$app" | awk '{print $2}')
    set -l path (echo "$app" | awk '{print $3}')

    complete -c marestart -a $name -f -d $path
end

complete -c marestart -f
