{ inputs, config, pkgs, pkgs-unstable, ... }:

{
  services.tailscale = {
    enable = true;
    extraUpFlags = [
      "--ssh"
      "--accept-dns"
    ];
  };
}
