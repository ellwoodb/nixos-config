{ inputs, config, pkgs, lib, ... }:

{
  options = {
    hyprland.enable =
      lib.mkEnableOption "enables Hyprland VM";
  };

  config = lib.mkIf config.hyprland.enable {
    programs.hyprland.enable = true;
  };
}
