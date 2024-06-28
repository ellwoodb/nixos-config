{ inputs, config, pkgs, lib, vars, ... }:

{
  options = {
    docker.enable =
      lib.mkEnableOption "enables Docker";
  };

  config = lib.mkIf config.docker.enable {
    users.users.${vars.username}.extraGroups = [ "docker" ];

    # enable docker
    virtualisation.docker = {
      enable = true;
      enableNvidia = true;
    };

    systemd.enableUnifiedCgroupHierarchy = false;
  };
}
