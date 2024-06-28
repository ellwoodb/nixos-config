{ inputs, config, pkgs, ... }:

{
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
}
