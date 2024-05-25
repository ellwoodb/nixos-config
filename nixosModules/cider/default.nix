{ inputs, config, pkgs, pkgs-unstable, ... }:

let
  cider = pkgs.appimageTools.wrapType2 {
    name = "cider";
    src = /home/matthias/.dotfiles/nixosModules/cider/cider_data/cider-new.AppImage;
  };
  ciderDesktopItem = pkgs.makeDesktopItem {
    name = "cider";
    desktopName = "Cider";
    exec = "${cider}/bin/cider";
    terminal = false;
    categories = [ "AudioVideo" ];
    icon = /home/matthias/.dotfiles/nixosModules/cider/cider_data/cider_icon.png;
  };
in
{
  users.users.matthias = {
    packages =
      (with pkgs; [
        # Cider
        cider
        ciderDesktopItem
      ]);
  };
}
