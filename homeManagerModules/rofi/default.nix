# rofi.nix - Nix Declarative Configuration File For Rofi Run Launcher
{ inputs, config, pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;

    extraConfig = {
      modi = "drun";
      show-icons = true;
      display-drun = "";
    };
  };
}
