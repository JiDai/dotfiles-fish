function sffformat --description "[SF] Prettier all packages"
  pushd ~/Work/frontends
  yarn run lerna run --stream format
  popd
end
