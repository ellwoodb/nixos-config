{ config, lib, ... }:

{
  options = {
    sops-hm.enable =
      lib.mkEnableOption "enables Sops secret management home manager module";
  };

  config = lib.mkIf config.sops-hm.enable {
    sops.defaultSopsFile = ../../secrets/secrets.yaml;
    sops.defaultSopsFormat = "yaml";

    sops.age.keyFile = "/home/matthias/.config/sops/age/keys.txt";
  };
}
