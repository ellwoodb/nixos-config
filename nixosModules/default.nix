{ inputs, config, pkgs, lib, ... }:

{
  imports = [
    ./desktops
    ./programs
    ./services
  ];
}
