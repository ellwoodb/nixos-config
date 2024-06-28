{ inputs, config, pkgs, lib, ... }:

{
  imports = [
    ./audio.nix
    ./avahi.nix
    ./bluetooth.nix
    ./coolercontrol.nix
    ./docker.nix
    ./flatpak.nix
    ./java.nix
    ./nvidia.nix
    ./ollama.nix
    ./ssh.nix
    ./tailscale.nix
  ];

  audio.enable =
    lib.mkDefault true;
  avahi.enable =
    lib.mkDefault true;
  bluetooth.enable =
    lib.mkDefault true;
  java.enable =
    lib.mkDefault true;
  ssh.enable =
    lib.mkDefault true;
}
