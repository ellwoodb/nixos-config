{ config, lib, ... }:

{
  options = {
    avahi.enable =
      lib.mkEnableOption "enables Avahi service";
  };

  config = lib.mkIf config.avahi.enable {
    # Needed for uxplay for example
    services.avahi = {
      enable = true;
      nssmdns4 = true; # printing
      publish = {
        enable = true;
        addresses = true;
        workstation = true;
        userServices = true;
      };
    };
  };
}
