{ config, lib, ... }:

{
  options = {
    coolercontrol.enable =
      lib.mkEnableOption "enables fan control with Coolercontrol";
  };

  config = lib.mkIf config.coolercontrol.enable {
    programs.coolercontrol = {
      enable = true;
      nvidiaSupport = true;
    };
  };
}
