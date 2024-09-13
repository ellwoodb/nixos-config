{ inputs, config, pkgs, lib, ... }:

{
  imports = [
    ./cider
    ./nh.nix
    ./pog.nix
    ./steam.nix
    ./vr.nix
    ./zsh.nix
  ];

  zsh.enable =
    lib.mkDefault true;
  nh.enable =
    lib.mkDefault true;
}
