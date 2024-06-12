{ inputs, config, pkgs, ... }:

{
  virtualisation.docker.enable = true;
  users.users.matthias.extraGroups = [ "docker" ];
}
