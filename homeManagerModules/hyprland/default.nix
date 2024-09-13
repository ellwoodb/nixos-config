{ inputs, config, pkgs, lib, ... }:

{
  imports = [
    ./hyprland.nix
    ./waybar.nix
    ./hyprpaper.nix
    ./hyprlock.nix
    ./hypridle.nix
    ./walker.nix
  ];
}
