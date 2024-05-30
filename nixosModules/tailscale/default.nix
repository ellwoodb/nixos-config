{ inputs, config, pkgs, ... }:

{
  services.tailscale = {
    enable = true;
    extraUpFlags = [
      "--ssh"
      "--accept-dns"
    ];
  };
}
