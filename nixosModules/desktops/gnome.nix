{ inputs, config, pkgs, lib, ... }:

{
  options = {
    gnome.enable =
      lib.mkEnableOption "enables Gnome DE";
  };

  config = lib.mkIf config.gnome.enable {
    services.xserver.desktopManager.gnome.enable = true;
    services.xserver.displayManager.gdm.enable = true;
    programs.dconf.enable = true;

    environment.systemPackages = with pkgs; [
      gnome.adwaita-icon-theme
      gnome.gnome-settings-daemon
      gnome.gnome-tweaks
      gnome-extension-manager
      gnome.dconf-editor
    ];
  };

}
