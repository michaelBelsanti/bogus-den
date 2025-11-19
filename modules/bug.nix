{ den, ... }:
{

  den.hosts.x86_64-linux.test = {
    primaryDisplay.scaling = 2;
    users.tux = { };
  };

  den.aspects.test.includes = [ den.aspects.laptop ];
  den.aspects.laptop.includes = [ den.aspects.workstation ];
  den.aspects.workstation.includes = [
    den.aspects.browser
    # den.aspects.wayland._.cosmic
  ];

  den.aspects.browser.homeManager =
    { pkgs, ... }:
    {
      programs.firefox = {
        enable = true;
        package = pkgs.firefox;
      };
    };

  # den.aspects.wayland.provides = {
  #   base =
  #     { host, ... }:
  #     {
  #       nixos =
  #         { lib, ... }:
  #         {
  #           environment.sessionVariables = {
  #             XCURSOR_SIZE = lib.mkForce (builtins.ceil (32 * host.primaryDisplay.scaling));
  #             NIXOS_OZONE_WL = "1";
  #           };
  #         };
  #     };
  #   cosmic = den.lib.parametric {
  #     includes = [ den.aspects.wayland._.base ];
  #     nixos = {
  #       services.desktopManager.cosmic.enable = true;
  #       services.displayManager.cosmic-greeter.enable = true;
  #     };
  #   };
  # };
}
