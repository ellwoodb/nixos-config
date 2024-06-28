{ inputs, config, pkgs, lib, ... }:

{
  options = {
    ssh.enable =
      lib.mkEnableOption "enables SSH";
  };

  config = lib.mkIf config.ssh.enable {
    services.openssh.enable = true;
  };
}
