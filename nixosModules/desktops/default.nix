{ inputs, config, pkgs, lib, ... }:

{
  imports = [
    ./gnome.nix
    ./hyprland.nix
    ./plasma.nix
  ];

  plasma.enable =
    lib.mkDefault true;
}
