function sfyarn --description "[SF] Re-install frontend deps"
  sf
  pushd ~Work/frontends
  yarn
  popd
end
