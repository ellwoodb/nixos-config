{ inputs, config, pkgs, lib, ... }:

{
  options = {
    hyprland.enable =
      lib.mkEnableOption "enables Hyprland VM";
  };

  config = lib.mkIf config.hyprland.enable {
    programs.hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    };
    environment.sessionVariables.NIXOS_OZONE_WL = "1";
    environment.systemPackages = with pkgs; [
      alacritty
      wofi
      nautilus
    ];
  };
}
