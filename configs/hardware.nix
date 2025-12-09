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
    "ip_tables"
    "iptable_nat"
  ];
  boot.kernelParams = [
    "quiet"
    "splash"
    "boot.shell_on_fail"
    "udev.log_priority=3"
    "rd.systemd.show_status=auto"
  ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/e639f2fd-6601-49a3-9c4a-b8ceaff10782";
    fsType = "btrfs";
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

  fileSystems."/run/media/home/ali" = {
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
    device = "/run/media/home/ali/Desktop";
    fsType = "none";
    options = [ "bind" ];
  };
  fileSystems."/home/ali/Documents" = {
    device = "/run/media/home/ali/Documents";
    fsType = "none";
    options = [ "bind" ];
  };
  fileSystems."/home/ali/Downloads" = {
    device = "/run/media/home/ali/Downloads";
    fsType = "none";
    options = [ "bind" ];
  };
  fileSystems."/home/ali/Music" = {
    device = "/run/media/home/ali/Music";
    fsType = "none";
    options = [ "bind" ];
  };
  fileSystems."/home/ali/Pictures" = {
    device = "/run/media/home/ali/Pictures";
    fsType = "none";
    options = [ "bind" ];
  };
  fileSystems."/home/ali/Public" = {
    device = "/run/media/home/ali/Public";
    fsType = "none";
    options = [ "bind" ];
  };
  fileSystems."/home/ali/Templates" = {
    device = "/run/media/home/ali/Templates";
    fsType = "none";
    options = [ "bind" ];
  };
  fileSystems."/home/ali/Videos" = {
    device = "/run/media/home/ali/Videos";
    fsType = "none";
    options = [ "bind" ];
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
