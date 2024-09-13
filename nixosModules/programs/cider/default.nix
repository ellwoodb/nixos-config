{ inputs, config, pkgs, lib, vars, ... }:

let
  cider = pkgs.appimageTools.wrapType2 {
    name = "cider";
    src = /home/matthias/.dotfiles/nixosModules/programs/cider/cider_data/Cider-v2.4.AppImage;
  };
  ciderDesktopItem = pkgs.makeDesktopItem {
    name = "cider";
    desktopName = "Cider";
    exec = "${cider}/bin/cider";
    terminal = false;
    categories = [ "AudioVideo" ];
    icon = /home/matthias/.dotfiles/nixosModules/programs/cider/cider_data/cider_icon.png;
  };
in
{
  options = {
    cider.enable =
      lib.mkEnableOption "enables Cider Apple Music client";
  };

  config = lib.mkIf config.cider.enable {
    users.users.${vars.username} = {
      packages = [
        # Cider
        cider
        ciderDesktopItem
      ];
    };
  };
}
