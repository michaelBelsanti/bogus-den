{ den, ... }:
{
  den.hosts.x86_64-linux.dupe = {
    displayScaling = 2;
    users.tux = { };
  };

  den.aspects.dupe.includes = [ den.aspects.wayland._.cosmic ];

  den.aspects = {
    wayland._.base =
      { host, ... }:
      {
        nixos =
          { lib, ... }:
          {
            environment.variables.XCURSOR_SIZE = lib.mkForce (32 * host.displayScaling);
          };
      };

    wayland._.cosmic = den.lib.parametric {
      includes = [ den.aspects.wayland._.base ];
      homeManager =
        { lib, pkgs, ... }:
        {
          gtk.iconTheme = {
            name = lib.mkForce "Cosmic";
            package = lib.mkForce pkgs.cosmic-icons;
          };
        };
      nixos.services = {
        desktopManager.cosmic.enable = true;
        displayManager.cosmic-greeter.enable = true;
      };
    };
  };
}
