{ inputs, config, pkgs, lib, vars, ... }:

let
  version = "1.3.2";
  pog = pkgs.appimageTools.wrapType2 {
    name = "pog";
    src = pkgs.fetchurl {
      url = "https://github.com/JanLunge/pog/releases/download/v${version}/pog-${version}-x86_64.AppImage";
      sha512 = "ZRcjdGNm0KgGYZvx8E5QVMwDDvPvW9fCEukEfubm6h2xxp05qLG6b+v0Xxf1n0L/DYGctVV7KV22PkA7p9hMpQ==";
    };
  };
  iconURL = pkgs.fetchurl {
    url = "https://pog.heaper.de/img/icon.png";
    sha256 = "iOSe3WwsfG6TqUK3cu0cZP+36G95ZjtxRssxEKNBGIA=";
  };
  pogDesktopItem = pkgs.makeDesktopItem {
    name = "pog";
    desktopName = "Pog";
    exec = "${pog}/bin/pog";
    terminal = false;
    categories = [ "Development" ];
    icon = "${iconURL}";
  };
in
{
  options = {
    pog.enable =
      lib.mkEnableOption "enables POG kmk keyboard configurator";
  };

  config = lib.mkIf config.pog.enable {
    users.users.${vars.username} = {
      packages = [
        pog
        pogDesktopItem
      ];
    };
  };
}
