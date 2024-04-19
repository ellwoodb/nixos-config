{ inputs, config, pkgs, pkgs-unstable, ... }:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      la = "ls -la";
      update-nixos = "sudo nixos-rebuild switch --flake ~/.dotfiles#desktop";
      update-homeManager = "home-manager switch --flake ~/.dotfiles";
    };
    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };
  };
}
