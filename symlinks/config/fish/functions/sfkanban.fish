function sfkanban --description "[SF] Show MR to do"
  pushd ~/Work/kanban-alternative
  deno task start | glow
  popd
end
