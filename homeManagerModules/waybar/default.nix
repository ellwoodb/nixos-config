# waybar.nix - Nix Declarative Configuration File For Waybar Status-Bar
{ inputs, config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;

    settings = [{
      layer = "top";
      position = "top";

      modules-left = [
        "hyprland/workspaces"
      ];

      modules-center = [
        "clock#time"
        "clock#date"
      ];

      modules-right = [
        "tray"
        "pulseaudio/slider"
      ];

      "custom/nix-icon" = {
        format = "󱄅";
      };

      "hyprland/workspaces" = {
        format = "{icon}";
        format-icons = {
          "1" = "";
          "2" = "";
          "3" = "";
          "4" = "";
          "5" = "";
          "default" = "";
        };
        persistent-workspaces = {
          "*" = [ 1 2 3 4 ];
        };
      };

      "tray" = {
        icon-size = 15;
        spacing = 10;
      };

      "clock#time" = {
        format = "{:%H\n%M}";
      };

      "clock#date" = {
        format = "{:%d\n%m\n%y}";
      };

      "pulseaudio/slider" = {
        min = 0;
        max = 100;
        orientation = "vertical";
      };

      "custom/power" = {
        format = "";
        on-click = "";
      };
    }];

    #style = with config.colorScheme.palette; ''
    #  @import "${./style.css}";
    #'';
  };
}
