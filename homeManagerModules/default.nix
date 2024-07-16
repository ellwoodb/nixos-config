{ inputs, config, pkgs, lib, ... }:

{
  imports = [
    #./hyprland/hyprland.nix
    ./easyeffects.nix
    ./firefox.nix
    ./git.nix
    ./gnome.nix
    ./virtualisation.nix
    ./vscode.nix
    ./zsh.nix
  ];
}
