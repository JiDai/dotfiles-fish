for i in (seq (count $MA_APPS_SERVICES))
    complete -c marebuild -n "__fish_is_first_token" -a $MA_APPS_SERVICES[$i] -f -d $MA_APPS_PATHS[$i]
end

complete -c marebuild -f
