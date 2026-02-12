{
  config,
  lib,
  modulesPath,
  ...
}:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.consoleLogLevel = 3;
  boot.initrd.availableKernelModules = [
    "xhci_pci"
    "ahci"
    "nvme"
    "usb_storage"
    "sd_mod"
    "rtsx_usb_sdmmc"
  ];
  boot.initrd.kernelModules = [ "i915" ];
  boot.initrd.verbose = false;

  boot.kernelModules = [
    "kvm-intel"
  ];
  boot.kernelParams = [
    "quiet"
    "splash"
    "boot.shell_on_fail"
    "udev.log_priority=3"
    "rd.systemd.show_status=auto"
  ];
  boot.extraModulePackages = [ ];

  # boot.supportedFilesystems = [ "bcachefs" ]; # https://wiki.nixos.org/wiki/Bcachefs

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/e639f2fd-6601-49a3-9c4a-b8ceaff10782";
    fsType = "btrfs"; # "bcachefs"
    options = [ "subvol=@" ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/9462-055D";
    fsType = "vfat";
    options = [
      "fmask=0077"
      "dmask=0077"
    ];
  };

  fileSystems."/mnt/hdd" = {
    device = "/dev/sda1";
    fsType = "exfat";
    options = [
      "defaults"
      "uid=1000"
      "gid=100"
      "umask=022"
    ];
    noCheck = true;
  };
  fileSystems."/home/ali/Desktop" = {
    device = "/mnt/hdd/Desktop";
    fsType = "none";
    options = [ "bind" ];
    depends = [ "/mnt/hdd" ];
  };
  fileSystems."/home/ali/Documents" = {
    device = "/mnt/hdd/Documents";
    fsType = "none";
    options = [ "bind" ];
    depends = [ "/mnt/hdd" ];
  };
  fileSystems."/home/ali/Downloads" = {
    device = "/mnt/hdd/Downloads";
    fsType = "none";
    options = [ "bind" ];
    depends = [ "/mnt/hdd" ];
  };
  fileSystems."/home/ali/Music" = {
    device = "/mnt/hdd/Music";
    fsType = "none";
    options = [ "bind" ];
    depends = [ "/mnt/hdd" ];
  };
  fileSystems."/home/ali/Pictures" = {
    device = "/mnt/hdd/Pictures";
    fsType = "none";
    options = [ "bind" ];
    depends = [ "/mnt/hdd" ];
  };
  fileSystems."/home/ali/Public" = {
    device = "/mnt/hdd/Public";
    fsType = "none";
    options = [ "bind" ];
    depends = [ "/mnt/hdd" ];
  };
  fileSystems."/home/ali/Templates" = {
    device = "/mnt/hdd/Templates";
    fsType = "none";
    options = [ "bind" ];
    depends = [ "/mnt/hdd" ];
  };
  fileSystems."/home/ali/Videos" = {
    device = "/mnt/hdd/Videos";
    fsType = "none";
    options = [ "bind" ];
    depends = [ "/mnt/hdd" ];
  };

  swapDevices = [
    { device = "/dev/disk/by-uuid/1d4f4246-8874-4b16-8908-75832d225503"; }
  ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp0s20f0u4.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp2s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp3s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  hardware.bluetooth.enable = true;
}
