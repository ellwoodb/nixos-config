{ inputs, config, pkgs-stable, lib, ... }:

{
  options = {
    orca-slicer.enable =
      lib.mkEnableOption "enables Orca-Slicer";
  };

  config = lib.mkIf config.orca-slicer.enable {
    environment.systemPackages = [ pkgs-stable.orca-slicer ];
  };
}
