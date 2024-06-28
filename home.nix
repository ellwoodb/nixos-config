{ config, pkgs, nixpkgs-unstable, inputs, ... }:

{
  imports = [
    ./homeManagerModules
  ];
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
    # 3D Printing
    prusa-slicer
    orca-slicer

    # Discord Clients
    vesktop
    webcord-vencord

    # Games / Compatability
    heroic
    prismlauncher
    lutris
    bottles
    protonup-qt
    sidequest
    r2modman

    # Browsers
    chromium
    brave

    # Editors
    anytype
    zed-editor
    onlyoffice-bin

    # Terminals
    warp-terminal
    alacritty

    # Other
    filezilla
    easyeffects
    synology-drive-client
    uxplay
    blender
    nodejs
    tigervnc
    davinci-resolve
    fastfetch
    qdirstat
    krita
  ];

  nixpkgs.config.allowUnfreePredicate = _: true;
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
