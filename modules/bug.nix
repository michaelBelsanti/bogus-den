{ den, ... }:
{
  # Name is the number of duplicate imports created
  den.hosts.x86_64-linux.eight.users.tux = { };
  den.hosts.x86_64-linux.four.users.tux = { };
  den.hosts.x86_64-linux.two.users.tux = { };
  den.hosts.x86_64-linux.none.users.tux = { };

  den.aspects.eight.includes = [ den.aspects.some-specific-desktop ];

  den.aspects.four.includes = [ den.aspects.desktop ];

  den.aspects.two.includes = [ den.aspects.workstation ];

  den.aspects.none.includes = [ den.aspects.fish ];

  den.aspects.some-specific-desktop = den.lib.parametric {
    includes = [ den.aspects.desktop ];
  };

  den.aspects.desktop = den.lib.parametric {
    includes = [ den.aspects.workstation ];
  };

  den.aspects.workstation = den.lib.parametric {
    includes = [ den.aspects.fish ];
  };

  den.aspects.fish.nixos =
    { pkgs, ... }:
    {
      programs.fish.enable = true;
      programs.fish.package = pkgs.fish;
    };
}
