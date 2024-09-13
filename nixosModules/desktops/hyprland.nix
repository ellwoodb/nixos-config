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

    environment.systemPackages = with pkgs; [
      dunst
      polkit-kde-agent
    ];

    services.displayManager.sddm.enable = true;

    security.rtkit.enable = true;
    security.pam.services.hyprlock = { };
  };
}
