{
  styx,
  inputs,
  ...
}:
{
  flake-file.inputs.nixconfig.url = "git+https://tangled.org/@belsanti.xyz/nixconfig?ref=den";
  imports = [ (inputs.den.namespace "styx" inputs.nixconfig) ];
  den.hosts.x86_64-linux.bad.users.quasi = { };
  den.hosts.x86_64-linux.good.users.quasi = { };
  den.aspects.bad.includes = [ styx.services._.ssh ];
  den.aspects.good.includes = [ styx.performance ];
}
