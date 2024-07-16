{ inputs, config, pkgs, lib, vars, ... }:

{
  options = {
    virtualisation-conf.enable =
      lib.mkEnableOption "enables virtualisation config";
  };

  config = lib.mkIf config.virtualisation-conf.enable {
    dconf.settings = {
      "org/virt-manager/virt-manager/connections" = {
        autoconnect = [ "qemu:///system" ];
        uris = [ "qemu:///system" ];
      };
    };
  };
}
