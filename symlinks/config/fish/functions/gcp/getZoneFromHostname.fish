function getZoneFromHostname --description "Return a zone from a given hostname"
    set -l gcp_env "$argv[1]"
    set -l host "$argv[2]"
    set -l zone_suffix (echo $host|rev|cut -d- -f2|rev)

    # If zone is a known zone
    if not contains $zone_suffix 1b 1c 1d
        set zone_suffix (echo $host|awk -F- '{print $NF}')
    end

    # Get zone from zone suffix
    # When not found, try resolve with gcloud
    switch $zone_suffix
        case "1b"
            echo 'europe-west1-b'
        case "1c"
            echo 'europe-west1-c'
        case "1d"
            echo 'europe-west1-d'
        case '*'
            echo (gls $gcp_env | grep $host | awk '{ print $2}')
    end
end
