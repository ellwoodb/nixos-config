{ inputs, config, pkgs, pkgs-unstable, ... }:

{
  imports = [
    ./cider
    ./coolercontrol
    ./flatpak
    ./gnome
    ./nvidia
    ./ollama
    ./steam
    ./tailscale
  ];
}
