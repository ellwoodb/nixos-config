{ inputs, config, pkgs, lib, ... }:

{
  options = {
    git-conf.enable =
      lib.mkEnableOption "enables GIT config";
  };

  config = lib.mkIf config.git-conf.enable {
    programs.git = {
      enable = true;
      userName = "ellwoodb";
      userEmail = "matthias@ellwoodb.de";
      extraConfig = {
        init.defaultBranch = "main";
      };
    };
  };
}
