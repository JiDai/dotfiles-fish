function marun_all_celery -d "[MA] Run all app celery in Tmux panes"
    if ! test -n "$TMUX"
        echo "You're not inside a tmux, exiting"
        return 1
    end

    sudo systemctl restart redis

    tmux split-window -h "cd ~/meilleursagents/apps/www; and make run-celery"
    tmux split-window -v "cd ~/meilleursagents/apps/MediaAPI; and make run-celery"
    tmux select-pane -t 1
    tmux split-window -v "cd ~/meilleursagents/apps/MyProAPI; and make run-celery"
end