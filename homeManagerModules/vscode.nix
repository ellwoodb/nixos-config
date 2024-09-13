{ inputs, config, pkgs, lib, ... }:

{
  options = {
    vscode-conf.enable =
      lib.mkEnableOption "enables VSCode config";
  };

  config = lib.mkIf config.vscode-conf.enable {
    programs.vscode = {
      enable = true;
      package = pkgs.vscode;
      userSettings = {
        "editor.formatOnSave" = true;
        "svelte.enable-ts-plugin" = true;
        "workbench.iconTheme" = "material-icon-theme";
        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nixd";
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
        "[nix]" = {
          "editor.defaultFormatter" = "jnoortheen.nix-ide";
        };
        "window.titleBarStyle" = "custom";
        "cody.autocomplete.advanced.provider" = "experimental-ollama";
        "cody.autocomplete.advanced.serverEndpoint" = "http://localhost:11434";
        "editor.inlineSuggest.suppressSuggestions" = true;
      };
      extensions = with pkgs.vscode-extensions; [
        bbenoist.nix
        jnoortheen.nix-ide

        tailscale.vscode-tailscale
        ms-vscode-remote.remote-ssh

        esbenp.prettier-vscode
        christian-kohler.path-intellisense
        visualstudioexptteam.vscodeintellicode
        # NOT AVAILIABLE: sleistner.vscode-fileutils

        matthewpi.caddyfile-support

        # NOT AVAILIABLE: miguelsolorio.symbols

        bradlc.vscode-tailwindcss
        svelte.svelte-vscode
        # NOT AVAILIABLE: ardenivanov.svelte-intellisense
        # NOT AVAILIABLE: chanzhaoyu.svelte-5-snippets

        dbaeumer.vscode-eslint
        # NOT AVAILIABLE: rvest.vs-code-prettier-eslint
        pkief.material-icon-theme
        yoavbls.pretty-ts-errors
      ];
    };
  };
}
