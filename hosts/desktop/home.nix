{ pkgs, inputs, ... }:

{
  imports = [
    ../../homeManagerModules
    inputs.sops-nix.homeManagerModules.sops
  ];

  # Enable modules
  easyeffects-conf.enable = false;
  firefox-conf.enable = true;
  gnome-conf.enable = false;
  vscode-conf.enable = true;
  zsh-conf.enable = true;
  git-conf = {
    enable = true;
    username = "ellwoodb";
    email = "matthias@ellwoodb.de";
  };

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "matthias";
  home.homeDirectory = "/home/matthias";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # Chats
    vesktop
    element-desktop
    fractal

    # Games / Compatability
    heroic
    prismlauncher
    glfw-wayland-minecraft
    bottles
    protonplus
    sidequest
    r2modman
    mangohud
    gamemode

    # Browsers
    chromium
    brave
    inputs.zen-browser.packages."${system}".specific

    # Editors
    onlyoffice-bin

    # Terminals
    kitty
    xpipe

    # Other
    filezilla
    synology-drive-client
    uxplay
    blender
    nodejs
    fastfetch
    qdirstat
    krita
    audacity
    vlc
    hoppscotch
    xorg.xhost
    upscayl

    distrobox
  ];

  nixpkgs.config.allowUnfreePredicate = _: true;
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
