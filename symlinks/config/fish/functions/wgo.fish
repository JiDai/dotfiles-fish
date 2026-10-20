function wgo --description "Navigue dans un worktree via numéro de ticket"
    set -l wt_root "$WT_ROOT"
    if test -z "$wt_root"
        echo "WT_ROOT non défini" >&2
        return 1
    end

    if test (count $argv) -eq 0
        ls -1 $wt_root
        return
    end

    set -l query $argv[1]

    # Dossier exact (via completion)
    if test -d "$wt_root/$query"
        cd "$wt_root/$query"
        return
    end

    # Recherche partielle
    set -l matches (ls -1 $wt_root | grep -i $query 2>/dev/null)

    switch (count $matches)
        case 0
            echo "Aucun worktree pour « $query »" >&2
            return 1
        case 1
            cd "$wt_root/$matches[1]"
        case '*'
            echo "Plusieurs résultats, précisez :" >&2
            string join \n $matches >&2
            return 1
    end
end
