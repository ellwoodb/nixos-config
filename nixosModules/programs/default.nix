{ inputs, config, pkgs, lib, ... }:

{
  imports = [
    ./cider.nix
    ./nautilus.nix
    ./pog.nix
    ./stability-matrix.nix
    ./steam.nix
    ./vr.nix
    ./zsh.nix
  ];

  zsh.enable =
    lib.mkDefault true;
}
