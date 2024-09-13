{ inputs, config, pkgs, lib, vars, ... }:

{
  options = {
    sops-hm.enable =
      lib.mkEnableOption "enables Sops secret management home manager module";
  };

  config = lib.mkIf config.sops-hm.enable {
    sops.defaultSopsFile = ../../secrets/secrets.yaml;
    sops.defaultSopsFormat = "yaml";

    sops.age.keyFile = "/home/${vars.username}/.config/sops/age/keys.txt";
  };
}
