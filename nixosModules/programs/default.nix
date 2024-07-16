{ inputs, config, pkgs, lib, ... }:

{
  imports = [
    ./cider
    ./pog.nix
    ./steam.nix
    ./vr.nix
    ./zsh.nix
    ./orca-slicer.nix
  ];

  zsh.enable =
    lib.mkDefault true;
}
