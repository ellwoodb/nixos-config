{ inputs, config, pkgs, pkgs-unstable, ... }:

{
  services.xserver.desktopManager.gnome.enable = true;

  environment.systemPackages = with pkgs; [
    gnome.adwaita-icon-theme
    gnome.gnome-settings-daemon
    gnome.gnome-tweaks
    gnome-extension-manager
    gnome.dconf-editor
  ];
}
