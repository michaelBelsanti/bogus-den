{ den, ... }:
{
  den.hosts.x86_64-linux.bad = {
    displayScaling = 2;
    users.tux = { };
  };
  den.hosts.x86_64-linux.good = {
    displayScaling = 2;
    users.tux = { };
  };

  den.aspects.bad.includes = [ den.aspects.bad_cosmic ];
  den.aspects.good.includes = [
    den.aspects.good_cosmic
    den.aspects.wayland
  ];

  den.aspects = {
    wayland =
      { host, ... }:
      {
        nixos =
          { lib, ... }:
          {
            environment.variables.XCURSOR_SIZE = lib.mkForce (32 * host.displayScaling);
          };
      };

    bad_cosmic = {
      includes = [ den.aspects.wayland ];
      nixos.services = {
        desktopManager.cosmic.enable = true;
        displayManager.cosmic-greeter.enable = true;
      };
    };

    good_cosmic = {
      nixos.services = {
        desktopManager.cosmic.enable = true;
        displayManager.cosmic-greeter.enable = true;
      };
    };
  };
}
