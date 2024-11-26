function sfflint --description "[SF] Lint all packages"
  pushd ~/Work/frontends
  yarn run lerna run --stream --parallel lint
  popd
end
