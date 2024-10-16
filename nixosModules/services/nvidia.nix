{ inputs, config, pkgs, lib, ... }:

{
  options = {
    nvidia.enable =
      lib.mkEnableOption "enables NVIDIA drivers and settings";
  };

  config = lib.mkIf config.nvidia.enable {
    environment.systemPackages = with pkgs; [
      cudatoolkit
      nvtopPackages.nvidia
      tuxclocker
    ];

    hardware.graphics = {
      enable = true;
      #driSupport = true;
      #driSupport32Bit = true;
      enable32Bit = true;
    };

    # Load nvidia driver for Xorg and Wayland
    services.xserver.videoDrivers = [ "nvidia" ];

    hardware.nvidia = {
      modesetting.enable = true;

      powerManagement = {
        enable = true;
        finegrained = false;
      };

      open = false;

      nvidiaSettings = true;

      # Use Latest Nvidia-Drivers
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      #package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
      #  version = "555.58.02";
      #  sha256_64bit = "sha256-xctt4TPRlOJ6r5S54h5W6PT6/3Zy2R4ASNFPu8TSHKM=";
      #  sha256_aarch64 = "sha256-wb20isMrRg8PeQBU96lWJzBMkjfySAUaqt4EgZnhyF8=";
      #  openSha256 = "sha256-8hyRiGB+m2hL3c9MDA/Pon+Xl6E788MZ50WrrAGUVuY=";
      #  settingsSha256 = "sha256-ZpuVZybW6CFN/gz9rx+UJvQ715FZnAOYfHn5jt5Z2C8=";
      #  persistencedSha256 = "sha256-a1D7ZZmcKFWfPjjH1REqPM5j/YLWKnbkP9qfRyIyxAw=";
      #};
    };

    boot.kernelModules = [ "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];

    boot.kernelParams = [ "nvidia.NVreg_PreserveVideoMemoryAllocations=1" "nvidia-drm.modeset=1" "nvidia-drm.fbdev=1" ];

    environment.sessionVariables = {
      # Force Wayland On Electron Apps
      ELECTRON_OZONE_PLATFORM_HINT = "auto";
      # Webkit
      WEBKIT_DISABLE_DMABUF_RENDERER = "1";
      # Required To Run The Correct Gbm Backend For Nvidia GpUs On Wayland
      GBM_BACKEND = "nvidia-drm";
      # Apparently, Without This Nouveau May Attempt To Be Used Instead
      # (Despite It Being Blacklisted)
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      # Hardware Cursors Are Currently Broken On Nvidia
      WLR_NO_HARDWARE_CURSORS = "1";

      LIBVA_DRIVER_NAME = "nvidia";
    };
  };
}
