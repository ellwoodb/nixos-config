{ inputs, config, pkgs, ... }:

{
  services.easyeffects = {
    enable = true;
    preset = "noise-red";
  };
}
