{ config, pkgs, lib, ... }:

{
  options = {
    gnome.enable =
      lib.mkEnableOption "enables Gnome DE";
  };

  config = lib.mkIf config.gnome.enable {
    services.xserver.desktopManager.gnome.enable = true;
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.displayManager.gdm.wayland = true;
    programs.dconf.enable = true;

    environment.systemPackages = with pkgs; [
      adwaita-icon-theme
      gnome-settings-daemon
      gnome-tweaks
      gnome-extension-manager
      dconf-editor
      eog
    ];
  };

}
