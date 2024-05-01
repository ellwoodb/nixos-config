{ inputs, config, pkgs, pkgs-unstable, nix-flatpak, ... }:

{
  services.flatpak = {
    enable = true;
    packages = [

    ];
  };
}
