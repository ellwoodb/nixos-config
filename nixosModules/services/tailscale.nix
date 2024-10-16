{ config, lib, ... }:

{
  options = {
    tailscale.enable =
      lib.mkEnableOption "enables Tailscale";
  };

  config = lib.mkIf config.tailscale.enable {
    services.tailscale = {
      enable = true;
      extraUpFlags = [
        "--ssh"
        "--accept-dns"
        "--operator=matthias"
      ];
    };
  };
}
