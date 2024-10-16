{ inputs, config, lib, pkgs, ... }:
let 
stability-matrix = pkgs.callPackage ../../pkgs/stability-matrix/default.nix { };
in 
{
  options = {
    stability-matrix.enable =
      lib.mkEnableOption "enables stability-matrix";
  };

  config = lib.mkIf config.stability-matrix.enable {
    environment.systemPackages = [
      stability-matrix
    ];
  };
}
