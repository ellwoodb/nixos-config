{ inputs, config, pkgs, lib, ... }:

{
  options.git-conf = {
    enable =
      lib.mkEnableOption "enables GIT config";
    username = lib.mkOption {
      type = lib.types.str;
      default = "";
    };
    email = lib.mkOption {
      type = lib.types.str;
      default = "";
    };
  };

  config = lib.mkIf config.git-conf.enable {
    programs.git = {
      enable = true;
      userName = "${config.git-conf.username}";
      userEmail = "${config.git-conf.email}";
      extraConfig = {
        init.defaultBranch = "main";
      };
    };
  };
}
