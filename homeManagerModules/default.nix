{ inputs, config, pkgs, ... }:

{
  imports = [
    ./easyeffects
    ./firefox
    ./git
    #./gnome
    ./hyprland
    ./rofi
    ./vscode
    ./waybar
    ./zsh
  ];
}
