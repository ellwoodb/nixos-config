{ inputs, config, pkgs, pkgs-unstable, ... }:

{
  services.desktopManager.plasma6.enable = true;
  services.xserver.displayManager.sddm.enable = true;
}
