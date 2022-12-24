function sfboot --description "[SF] Boot the stack"
  up.sh
  reset-local-database.sh

  cd $SF_PATH/services/frontends/
  yarn lerna run start --parallel --stream
end
