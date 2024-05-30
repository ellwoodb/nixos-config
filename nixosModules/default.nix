{ inputs, config, pkgs, pkgs-unstable, ... }:

{
  imports = [
    ./cider
    ./coolercontrol
    ./flatpak
    #./gnome
    ./nvidia
    ./ollama
    ./plasma
    ./steam
    ./tailscale
  ];
}
