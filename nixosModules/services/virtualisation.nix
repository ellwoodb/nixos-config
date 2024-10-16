{ config, pkgs, lib, ... }:

{
  options = {
    virtualisation.enable =
      lib.mkEnableOption "enables libvirt and kvm";
  };

  config = lib.mkIf config.virtualisation.enable {
    virtualisation.libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        runAsRoot = true;
        swtpm.enable = true;
        ovmf = {
          enable = true;
          packages = [
            (pkgs.OVMF.override {
              secureBoot = true;
              tpmSupport = true;
            }).fd
          ];
        };
      };
    };
    programs.virt-manager.enable = true;
    programs.dconf.enable = true;
  };
}
