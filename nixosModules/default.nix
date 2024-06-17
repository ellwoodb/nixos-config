{ inputs, config, pkgs, ... }:

{
  imports = [
    ./alvr
    ./cider
    ./coolercontrol
    ./flatpak
    #./gnome
    ./hyprland
    ./nvidia
    ./ollama
    ./plasma
    ./steam
    ./pog
    ./tailscale
    ./docker
  ];
}
