function sfftypecheck --description "[SF] Type check all packages"
  pushd ~/Work/frontends
  yarn run lerna run --stream --parallel typecheck
  popd
end
