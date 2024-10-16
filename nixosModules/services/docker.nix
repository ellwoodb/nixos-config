{ config, lib,  ... }:

{
  options = {
    docker.enable =
      lib.mkEnableOption "enables Docker";
  };

  config = lib.mkIf config.docker.enable {
    # enable docker
    virtualisation.docker = {
      enable = true;
    };

    hardware.nvidia-container-toolkit.enable = true;
  };
}
