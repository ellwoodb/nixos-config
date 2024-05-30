{ inputs, config, pkgs, ... }:

{
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
}
