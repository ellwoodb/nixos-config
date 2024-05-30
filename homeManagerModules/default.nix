{ inputs, config, pkgs, ... }:

{
  imports = [
    ./firefox
    ./git
    #./gnome
    ./zsh
  ];
}
