function sfyarn --description "[SF] Re-install frontend deps"
  sf
  pushd $SF_PATH/services/frontends
  yarn
  popd
end
