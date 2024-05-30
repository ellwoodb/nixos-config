{ inputs, config, pkgs, ... }:

{
  services.flatpak = {
    enable = true;
  };
}
