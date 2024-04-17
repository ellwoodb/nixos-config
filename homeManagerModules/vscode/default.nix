{ inputs, config, pkgs, pkgs-unstable, ... }:

{
  programs.vscode = {
    enable = true;
    extensions = with pkgs; [
      vscode-extensions.jnoortheen.nix-ide
      vscode-extensions.ms-vscode-remote.remote-ssh
      vscode-extensions.christian-kohler.path-intellisense
      vscode-extensions.pkief.material-icon-theme
      vscode-extensions.esbenp.prettier-vscode
    ];
    userSettings = {
      "editor.formatOnSave" = true;
      "explorer.compactFolders" = false;
      "workbench.colorTheme" = "Default Dark Modern";
    };
  };
}
