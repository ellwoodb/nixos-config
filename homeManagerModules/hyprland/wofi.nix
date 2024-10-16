{ config, pkgs, ... }:

{
  programs.wofi = {
    enable = true;
    settings = {
      location = "top";
    };
  };
}
