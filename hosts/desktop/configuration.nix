{ lib, inputs, config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../nixosModules
      inputs.home-manager.nixosModules.default
      inputs.sops-nix.nixosModules.sops
    ];

  boot.kernelPackages = pkgs.linuxPackages;

  # Enable modules
  hyprland.enable = true;
  gnome.enable = false;
  plasma.enable = true;

  cider.enable = true;
  steam.enable = true;
  vr.enable = true;
  nautilus.enable = true;

  stability-matrix.enable = true;

  coolercontrol.enable = true;
  docker.enable = true;
  flatpak.enable = true;
  nvidia.enable = true;
  ollama.enable = true;
  tailscale.enable = true;
  virtualisation.enable = true;

  # Bootloader
  boot.loader = {
    systemd-boot.enable = false;
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
    };
    grub = {
      devices = [ "nodev" ];
      enable = true;
      efiSupport = true;
      useOSProber = true;
    };
  };

  networking.hostName = "nixos"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  systemd.services.NetworkManager-wait-online.enable = false;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.excludePackages = with pkgs; [
    xterm
  ];

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "de";
    variant = "nodeadkeys";
  };
  # Configure console keymap
  console.keyMap = "de-latin1-nodeadkeys";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users = {
    matthias = {
      isNormalUser = true;
      description = "matthias";
      extraGroups = [ "networkmanager" "wheel" "audio" "sound" "video" "docker" "libvirtd" ];
    };
  };

  home-manager = {
    extraSpecialArgs = {
      inherit inputs;
    };
    users = {
      "matthias" = import ./home.nix;
    };
  };

  # Allow unfree packages
  nixpkgs. config. allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = _: true;

  

  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [
    firefox
    wget
    curl
    git
    neovim
    nixpkgs-fmt
    distrobox
    pavucontrol
    wine
    wine-wayland
    winetricks
    timeshift
    python3
    htop
    pfetch
    eza
    tree
    ispell
    killall
    wl-clipboard
    lxappearance
  ];

  fonts.packages = with pkgs; [
    nerdfonts
    font-awesome
    noto-fonts-emoji
  ];

  programs.dconf.enable = true;

  # Nix settings
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings = {
    substituters = [
      "https://nix-gaming.cachix.org"
      "https://hyprland.cachix.org"
      "https://walker.cachix.org"
    ];
    trusted-public-keys = [
      "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
      "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
      "walker.cachix.org-1:fG8q+uAaMqhsMxWjwvk0IMb4mFPFLqHjuvfwQxE4oJM="
    ];
  };
  nix.optimise.automatic = true;

  # Needed for modern games to run
  boot.kernel.sysctl."vm.max_map_count" = 262144;

  environment.sessionVariables = {
    NIXOS_OZONE_WL = 1;
    __GL_THREADED_OPTIMIZATIONS = 0;
    MOZ_ENABLE_WAYLAND = 1;
    FLAKE = "/home/matthias/.dotfiles";
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
