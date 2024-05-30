{ inputs, config, pkgs, ... }:

{
  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.defaultSession = "plasma";
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.desktopManager.plasma6.enableQt5Integration = true;

  services.fwupd.enable = true;

  environment.systemPackages = with pkgs; [
    clinfo
    pciutils
    glxinfo
    vulkan-tools
    wayland-utils
    aha
  ];
}
