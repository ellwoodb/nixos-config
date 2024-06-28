{ inputs, config, pkgs, lib, ... }:

{
  options = {
    docker.enable =
      lib.mkEnableOption "enables Docker";
  };

  config = lib.mkIf config.docker.enable {
    users.users.matthias.extraGroups = [ "docker" ];

    # enable docker
    virtualisation.docker = {
      enable = true;
      enableNvidia = true;
    };

    systemd.enableUnifiedCgroupHierarchy = false;
  };
}
