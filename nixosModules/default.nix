{ inputs, config, pkgs, ... }:

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
    ./pog
    ./tailscale
  ];
}
