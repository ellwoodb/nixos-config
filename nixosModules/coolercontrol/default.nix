{ inputs, config, pkgs, pkgs-unstable, nix-flatpak, ... }:

{
  programs.coolercontrol.enable = true;
  #programs.coolercontrol.nvidiaSupport = true;
}
