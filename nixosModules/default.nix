{ inputs, config, pkgs, pkgs-unstable, ... }:

{
  imports = [
    ./cider
    ./flatpak
    ./gnome
    ./nvidia
    ./ollama
    ./steam
    ./tailscale
  ];
}
