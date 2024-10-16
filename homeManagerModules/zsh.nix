{ config, lib, ... }:

{
  options = {
    zsh-conf.enable =
      lib.mkEnableOption "enables ZSH config";
  };

  config = lib.mkIf config.zsh-conf.enable {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      oh-my-zsh = {
        enable = true;
        theme = "robbyrussell";
        plugins = [
          "git"
          "history"
        ];
      };
    };
  };
}
