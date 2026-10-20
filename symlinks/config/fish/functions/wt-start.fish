# ~/.config/fish/functions/wt-start.fish
function wt-start --description 'Lance wt-start puis cd dans le worktree à la sortie de Claude'
    command wt-start $argv
    set -l ret $status

    set -l slug (string lower -- "$argv[1]" \
        | string replace -ra '[^a-z0-9]+' '-' \
        | string trim -c '-' \
        | string sub -l 63)

    if test -n "$slug"; and test -d "$WT_ROOT/$slug"
        cd "$WT_ROOT/$slug"
    end

    return $ret
end
