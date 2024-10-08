{ inputs, config, pkgs-stable, lib, ... }:

{
  options = {
    nh.enable =
      lib.mkEnableOption "enables nh NixOS helper";
  };

  config = lib.mkIf config.nh.enable {
    programs.nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 4d --keep 5";
      flake = "/home/matthias/.dotfiles";
    };
  };
}
