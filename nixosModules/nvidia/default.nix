{ inputs, config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cudatoolkit
    nvtopPackages.nvidia
  ];


  # Enable OpenGL
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
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
    package = config.boot.kernelPackages.nvidiaPackages.beta;
  };

  boot.kernelModules = [ "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];

  boot.kernelParams = [ "nvidia.NVreg_PreserveVideoMemoryAllocations=1" "nvidia-drm.modeset=1" "nvidia-drm.fbdev=1" ];

  environment.sessionVariables = {
    # Force Wayland On Electron Apps
    NIXOS_OZONE_WL = "1";
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
  };
}
