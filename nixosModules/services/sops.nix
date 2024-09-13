{ inputs, config, pkgs, lib, vars, ... }:

{
  options = {
    sops.enable =
      lib.mkEnableOption "enables Sops secret management";
  };

  config = lib.mkIf config.sops.enable {
    environment.systemPackages = with pkgs; [ sops ];
    sops.defaultSopsFile = ../../secrets/secrets.yaml;
    sops.defaultSopsFormat = "yaml";

    sops.age.keyFile = "/home/${vars.username}/.config/sops/age/keys.txt";

    sops.secrets."samba/alexandria/username" = {
      owner = vars.username;
    };
    sops.secrets."samba/alexandria/password" = {
      owner = vars.username;
    };
    sops.templates."alexandria-smb-credentials".content = ''
      username=${config.sops.placeholder."samba/alexandria/username"}
      password=${config.sops.placeholder."samba/alexandria/password"}
    '';

    # Not used
    sops.secrets."git/username" = {
      owner = vars.username;
    };
    sops.secrets."git/email" = {
      owner = vars.username;
    };
    sops.templates."git-credentials".content = ''
      [user]
        email = "${config.sops.placeholder."git/email"}"
        name = "${config.sops.placeholder."git/username"}"
    '';
  };
}
