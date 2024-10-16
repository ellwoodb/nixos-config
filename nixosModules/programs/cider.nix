# Might move to pkgs later
{ config, pkgs, lib, ... }:

let
  cider = pkgs.appimageTools.wrapType2 {
    name = "cider";
    version = "2.5.0";
    src = pkgs.fetchurl {
      url = "https://git.int.ellwoodb.de/ellwoodb/cider/raw/branch/main/Cider-v2.5.0.AppImage"; # Privately hosted
      hash = "sha256-HwfByY8av1AvI+t7wnaNbhDLXBxgzRKYiLG1hPUto9o=";
    };
  };
  ciderDesktopItem = pkgs.makeDesktopItem {
    name = "cider";
    desktopName = "Cider";
    exec = "${cider}/bin/cider";
    terminal = false;
    categories = [ "AudioVideo" ];
    icon = pkgs.fetchurl {
      url = "https://git.int.ellwoodb.de/ellwoodb/cider/raw/branch/main/cider_icon.png"; # Privately hosted
      hash = "sha256-j8fK5RETheFKdjLnsJYIfZjqM89uM8xlZ7O1MvctrCA=";
    };
  };
in
{
  options = {
    cider.enable =
      lib.mkEnableOption "enables Cider Apple Music client";
  };

  config = lib.mkIf config.cider.enable {
    users.users.matthias = {
      packages = [
        # Cider
        cider
        ciderDesktopItem
      ];
    };
  };
}
