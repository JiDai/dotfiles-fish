for i in (seq (count $MA_APPS_SERVICES))
  complete -c malogs -a $MA_APPS_SERVICES[$i] -f -d $MA_APPS_PATHS[$i]
end
