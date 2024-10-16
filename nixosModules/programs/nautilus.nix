{ inputs, pkgs, config, lib, ... }:

{
  options = {
    nautilus.enable =
      lib.mkEnableOption "enables Nautilus File Manager";
  };

  config = lib.mkIf config.nautilus.enable {
    environment.systemPackages = with pkgs; [
      nautilus
    ];
    programs.nautilus-open-any-terminal = {
      enable = true;
      terminal = "alacritty";
    };
  };
}
