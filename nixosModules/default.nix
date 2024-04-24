{ inputs, config, pkgs, pkgs-unstable, ... }:

{
  imports = [
    ./cider
    ./nvidia
    ./ollama
    ./steam
    ./tailscale
    ./gnome
  ];
}
