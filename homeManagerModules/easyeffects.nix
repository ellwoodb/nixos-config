{ config, lib, ... }:

{
  options = {
    easyeffects-conf.enable =
      lib.mkEnableOption "enables Easyeffects config";
  };

  config = lib.mkIf config.easyeffects-conf.enable {
    services.easyeffects = {
      enable = true;
      preset = "new mic";
    };
  };
}
