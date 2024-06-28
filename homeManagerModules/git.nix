{ inputs, config, pkgs, lib, vars, ... }:

{
  options = {
    git-conf.enable =
      lib.mkEnableOption "enables GIT config";
  };

  config = lib.mkIf config.git-conf.enable {
    programs.git = {
      enable = true;
      userName = "${vars.gitUsername}";
      userEmail = "${vars.email}";
      extraConfig = {
        init.defaultBranch = "main";
      };
    };
  };
}
