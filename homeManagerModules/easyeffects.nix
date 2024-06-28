{ inputs, config, pkgs, lib, ... }:

{
  options = {
    easyeffects-conf.enable =
      lib.mkEnableOption "enables Easyeffects config";
  };

  config = lib.mkIf config.easyeffects-conf.enable {
    home.packages = with pkgs; [
      #easyeffects
    ];

    services.easyeffects = {
      enable = true;
      preset = "noise-red";
    };
  };
}
