{ config, lib, ... }:

{
  options = {
    audio.enable =
      lib.mkEnableOption "enables system audio with pipewire";
  };

  config = lib.mkIf config.audio.enable {
    services.pipewire = {
      enable = true;
      pulse.enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
    };
    hardware.pulseaudio.enable = false;
  };
}
