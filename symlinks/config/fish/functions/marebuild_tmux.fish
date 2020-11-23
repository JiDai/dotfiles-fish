function marebuild_tmux --description "[MA] Rebuild all apps in Tmux windows in background"
    if ! test -n "$TMUX"
        echo "You're not inside a tmux, exiting"
        return 1
    end

    maapps | while read -l app
        set -l name (echo "$app" | awk '{print $1}')
        tmux new-window -n "$name" -d "marebuild $name; and sleep 10"
    end
end
