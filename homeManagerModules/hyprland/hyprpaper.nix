{ pkgs, ... }:

{
  services.hyprpaper = {
    enable = true;
    package = pkgs.hyprpaper;

    settings =
      let
        wallpaper = "/home/matthias/.dotfiles/wallpapers/mountains.jpg"; 
      in
      {
        ipc = "on";
        splash = false;
        preload = [ "${wallpaper}" ];
        wallpaper = [ "DP-4,${wallpaper}" "HDMI-A-2,${wallpaper}" ];
      };
  };
}
