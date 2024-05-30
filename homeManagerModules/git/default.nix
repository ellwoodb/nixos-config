{ inputs, config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "ellwoodb";
    userEmail = "matthias@ellwoodb.de";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
