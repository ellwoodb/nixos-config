{ inputs, config, pkgs, lib, ... }:

{
  options = {
    netbird.enable =
      lib.mkEnableOption "enables Netbird";
  };

  config = lib.mkIf config.netbird.enable {
    services.netbird.enable = true; # for netbird service & CLI
    environment.systemPackages = with pkgs; [ netbird-ui ]; # for GUI
  };
}
