{ inputs, config, pkgs, pkgs-unstable, ... }:

{
  imports = [
    ./firefox
    ./git
    #./gnome
    ./hyprland
    ./zsh
  ];
}
