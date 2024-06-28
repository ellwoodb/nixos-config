{ inputs, config, pkgs, ... }:

{
  users.users.matthias.extraGroups = [ "docker" ];

  # enable docker
  virtualisation.docker = {
    enable = true;
    enableNvidia = true;
  };

  systemd.enableUnifiedCgroupHierarchy = false;
}
