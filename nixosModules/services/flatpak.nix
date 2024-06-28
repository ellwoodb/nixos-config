{ inputs, config, pkgs, lib, ... }:

{
  options = {
    flatpak.enable =
      lib.mkEnableOption "enables Flatpak";
  };

  config = lib.mkIf config.flatpak.enable {
    services.flatpak = {
      enable = true;
    };
  };
}
