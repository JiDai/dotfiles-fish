function gls
   set -l env "$argv[1]"
   set -l project (getProjectByEnv "$env")
   set -l cache_file "/tmp/$MYUSER\_gssh_gls_cache_$project"
   set -l cmd "gcloud --project=$project compute instances list"
   eval $cmd
#    if [ -e "$cache_file" ]; then
#        case "$MYARCH" in
#            "Darwin")
#                set -l cache_file_creation_ts $(stat -f "%m" $cache_file)
#                ;;
#            *)
#                set -l cache_file_creation_ts $(stat --printf "%Y" $cache_file)
#                ;;
#        esac
#    else
#        set -l cache_file_creation_ts 0
#    fi
#    if [[ "$2" =~ ^[0-9]+$ ]]; then
#        set -l cache_file_expiration $2
#    else
#        set -l cache_file_expiration 3600
#    fi
#    set -l cache_file_timeout $(($cache_file_creation_ts + $cache_file_expiration))
#    set -l current_ts $(date +"%s")
#    if [ -f "$cache_file" ] && [ $cache_file_timeout -gt $current_ts ]; then
#        cat $cache_file
#    else
#        case "$MYSHELL" in
#            "zsh")
#                eval $cmd >! $cache_file
#                ;;
#            *)
#                eval $cmd > $cache_file
#                ;;
#        esac
#        cat $cache_file
#    fi
end