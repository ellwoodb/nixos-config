{ config, pkgs, lib, ... }:

{
  options = {
    java.enable =
      lib.mkEnableOption "enables Java";
  };

  config = lib.mkIf config.java.enable {
    programs.java.enable = true;
    environment.systemPackages = with pkgs; [ jdk8 ];
  };
}
