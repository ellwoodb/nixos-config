# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, modulesPath, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "nvme" "ahci" "xhci_pci" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];
  boot.supportedFilesystems = [ "ntfs" ];

  fileSystems."/" =
    {
      device = "/dev/disk/by-uuid/1aae4ac0-a4c0-43e7-8b63-8c67c1420669";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-uuid/546E-2490";
      fsType = "vfat";
    };

  fileSystems."/mnt/Games" =
    {
      device = "/dev/disk/by-uuid/35C6DEAE2736D931";
      fsType = "ntfs-3g";
      options = [ "rw" "uid=1000" ];
    };
  fileSystems."/mnt/nas-home" =
    {
      device = "//192.168.1.2/home";
      fsType = "cifs";
      options = [ "credentials=${config.sops.templates."alexandria-smb-credentials".path}" "x-systemd.automount" "noauto" "uid=1000" "gid=1000" ];
    };

  swapDevices =
    [{
      device = "/dev/disk/by-uuid/d3ab6045-0cbf-42e8-add8-9620f057ecb1";
    }];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp12s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp13s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
