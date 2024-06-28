{ inputs, config, pkgs, lib, ... }:

{
  options = {
    vr.enable =
      lib.mkEnableOption "enables ALVR and settings for VR";
  };

  config = lib.mkIf config.vr.enable {
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
  };
}
