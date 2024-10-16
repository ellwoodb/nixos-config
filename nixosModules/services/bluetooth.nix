{ config, lib, ... }:

{
  options = {
    bluetooth.enable =
      lib.mkEnableOption "enables various options for Bluetooth";
  };

  config = lib.mkIf config.bluetooth.enable {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          ControllerMode = "dual";
          Experimental = "true";
        };
        Policy = {
          AutoEnable = "true";
        };
      };
    };
  };
}
