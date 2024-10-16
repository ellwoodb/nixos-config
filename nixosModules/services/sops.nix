{ config, pkgs, lib, ... }:

{
  options = {
    sops.enable =
      lib.mkEnableOption "enables Sops secret management";
  };

  config = lib.mkIf config.sops.enable {
    environment.systemPackages = with pkgs; [ sops ];
    sops.defaultSopsFile = ../../secrets/secrets.yaml;
    sops.defaultSopsFormat = "yaml";

    sops.age.keyFile = "/home/matthias/.config/sops/age/keys.txt";

    sops.secrets."samba/alexandria/username" = {
      owner = "matthias";
    };
    sops.secrets."samba/alexandria/password" = {
      owner = "matthias";
    };
    sops.templates."alexandria-smb-credentials".content = ''
      username=${config.sops.placeholder."samba/alexandria/username"}
      password=${config.sops.placeholder."samba/alexandria/password"}
    '';
  };
}
