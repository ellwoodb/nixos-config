{ inputs, config, pkgs, pkgs-unstable, ... }:

{
  imports = [
    ./cider
    ./nvidia
    ./steam
    ./tailscale
    ./gnome
  ];
}
