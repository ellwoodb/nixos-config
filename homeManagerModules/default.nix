{ inputs, config, pkgs, lib, ... }:

{
  imports = [
    ./easyeffects.nix
    ./firefox.nix
    ./git.nix
    ./gnome.nix
    ./vscode.nix
    ./zsh.nix
  ];
}
