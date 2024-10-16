{ inputs, config, pkgs, lib, ... }:

{
  options = {
    plasma.enable =
      lib.mkEnableOption "enables KDE Plasma DE";
  };

  config = lib.mkIf config.plasma.enable {
    # Enable the KDE Plasma Desktop Environment.
    services.displayManager.sddm.enable = true;
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
      kdePackages.partitionmanager
    ];
  };
}
