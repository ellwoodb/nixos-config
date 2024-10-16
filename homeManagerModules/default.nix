{ lib, ... }:

{
  imports = [
    ./hyprland
    ./easyeffects.nix
    ./firefox.nix
    ./git.nix
    ./gnome.nix
    ./sops.nix
    ./virtualisation.nix
    ./vscode.nix
    ./zsh.nix
  ];

  sops-hm.enable =
    lib.mkDefault true;
}
