{ inputs, config, pkgs, ... }:

{
  imports = [
    ./firefox
    ./git
    #./gnome
    ./hyprland
    ./zsh
  ];
}
