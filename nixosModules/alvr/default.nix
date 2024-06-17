{ inputs, config, pkgs, ... }:

{
  programs.alvr = {
    enable = true;
    package = inputs.lemonake.packages.${pkgs.system}.alvr;
    openFirewall = true;
  };
}
