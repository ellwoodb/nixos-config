{ inputs, config, pkgs, ... }:

{
  programs.alvr = {
    enable = true;
    package = inputs.lemonake.packages.${pkgs.system}.alvr;
    openFirewall = true;
  };

  services.monado = {
    enable = true;
    defaultRuntime = true;
  };
  systemd.user.services.monado.environment = {
    STEAMVR_LH_ENABLE = "1";
    XRT_COMPOSITOR_COMPUTE = "1";
  };
}
