{ inputs, config, pkgs, ... }:

{
  imports = [
    ./audio
    ./avahi
    ./bluetooth
    ./cider
    ./coolercontrol
    ./docker
    ./flatpak
    #./gnome
    ./hyprland
    ./java
    ./nvidia
    ./ollama
    ./osu
    ./plasma
    ./pog
    ./ssh
    ./steam
    ./tailscale
    ./vr
    ./zsh
  ];
}
