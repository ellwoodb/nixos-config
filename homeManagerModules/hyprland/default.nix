{ inputs, config, pkgs, lib, ... }:

{
  options = {
    hyprland-conf.enable =
      lib.mkEnableOption "enables Hyprland config";
  };

  config = lib.mkIf config.hyprland-conf.enable {
    imports = [
      ./hyprland.nix
    ];
  };
}
