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
      ];
    };
  };
}
