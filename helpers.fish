
function print_title
  set line '--------------------------------'
  set light_blue '\033[1;34m'
  set reset '\033[0m' # No Color
  printf "\n$light_blue$line\n# $argv[1]\n$line$reset\n"
end

function print_subtitle
  set light_green '\033[1;32m'
  set reset '\033[0m' # No Color
  printf "\n$light_green## $argv[1]$reset\n"
end


function print_error
  set red '\033[0;31m'
  set reset '\033[0m' # No Color
  printf "\n$redError: $argv[1]$reset\n"
end


function print_green
  set green '\033[1;32m'
  set reset '\033[0m' # No Color
  printf "$green$argv[1]$reset\n"
end


function print_red
  set red '\033[0;31m'
  set reset '\033[0m' # No Color
  printf "$red$argv[1]$reset\n"
end
