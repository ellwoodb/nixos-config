{ inputs, config, pkgs, lib, ... }:

{
  imports = [
    ./cider
    ./pog.nix
    ./steam.nix
    ./vr.nix
    ./zsh.nix
  ];

  zsh.enable =
    lib.mkDefault true;
}
