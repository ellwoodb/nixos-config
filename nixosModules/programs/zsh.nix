{ inputs, config, pkgs, lib, ... }:

{
  options = {
    zsh.enable =
      lib.mkEnableOption "enables ZSH as default shell";
  };

  config = lib.mkIf config.zsh.enable {
    users.defaultUserShell = pkgs.zsh;
    environment.shells = with pkgs; [ zsh ];
    programs.zsh.enable = true;
  };
}
