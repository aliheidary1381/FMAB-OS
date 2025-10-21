{
  config,
  lib,
  pkgs,
  ...
}:
{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nixpkgs.config.allowUnfree = true;

  networking.hostName = "aliheydaripc";

  # Configure network proxy if necessary
  # networking.proxy.default  = "socks5://192.168.122.66:18888"; # schema reminder user:password@proxy:port
  networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  networking.useNetworkd = true;
  systemd.services.systemd-networkd-wait-online.enable = lib.mkForce false;

  # Set your time zone.
  time.timeZone = "Asia/Tehran";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LANG = "en_GB.UTF-8";
    LC_ALL = "en_GB.UTF-8";
    # LC_ADDRESS = "en_US.UTF-8";
    # LC_IDENTIFICATION = "en_US.UTF-8";
    # LC_MEASUREMENT = "en_US.UTF-8";
    # LC_MONETARY = "en_US.UTF-8";
    # LC_NAME = "en_US.UTF-8";
    # LC_NUMERIC = "en_US.UTF-8";
    # LC_PAPER = "en_US.UTF-8";
    # LC_TELEPHONE = "en_US.UTF-8";
    # LC_TIME = "en_US.UTF-8";
  };

  # Bootloader.
  # TODO: plymouth
  boot.loader.grub.enable = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.device = "nodev";
  boot.loader.efi.canTouchEfiVariables = true;

  # Configure display manager & desktop manager.
  services.xserver.enable = false;
  services.displayManager.sddm = {
    enable = true;
    autoNumlock = true;
    wayland.enable = true;
    wayland.compositor = "kwin";
    autoLogin.relogin = true;
  };
  services.displayManager.autoLogin = {
    enable = true;
    user = "ali";
  };
  services.desktopManager.plasma6.enable = true;
  services.displayManager.defaultSession = "plasma";

  catppuccin = {
    enable = true;
    flavor = "frappe";
    accent = "yellow";
    sddm.enable = false;
    grub.enable = false;
  };

  boot.loader.grub.splashImage = ./images/grub-background.png;
  boot.loader.grub.theme = config.ali.grub.sleekGrubThemePatched.override {
    withBanner = "Ali Heydari's personal laptop";
    withStyle = "orange";
  };

  # Configure console keymap
  console.keyMap = "us";

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  services.blueman.enable = false; # using Bluedevil instead

  networking.nameservers = [
    "1.1.1.1"
    "8.8.8.8"
  ];
  services.resolved = {
    enable = true;
    llmnr = "true";
    dnssec = "allow-downgrade";
    dnsovertls = "opportunistic";
    fallbackDns = [
      "1.1.1.1"
      "8.8.8.8"
    ];
  };

  programs.proxychains = {
    enable = true;
    proxies.windscribe = {
      type = "socks5";
      host = "192.168.122.66";
      port = 18888;
      enable = true;
    };
  };

  programs.firejail.enable = true;

  programs.git.enable = true;

  programs.dconf.enable = true;

  fonts.packages = [ config.ali.fonts.my-fonts ] ++ (with pkgs; [ nerd-fonts.fira-code ]);
  fonts.fontconfig.defaultFonts = {
    monospace = [ "FiraCode Nerd Font Mono" ];
    # sansSerif = [ "IRANSansX" ];
  };

  systemd.packages = with pkgs; [ cloudflare-warp ];
  systemd.targets.multi-user.wants = [ "warp-svc.service" ];

  systemd.targets.machines.enable = true;

  services.winboat.enable = true;
  virtualisation.docker.enable = true; # For WinBoat Windows containers
  virtualisation.waydroid.enable = true; # For Android containers https://wiki.nixos.org/wiki/Waydroid https://docs.waydro.id/usage/

  # https://nixos.wiki/wiki/Libvirt
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = [ "ali" ];
  virtualisation.libvirtd = {
    enable = true;
    qemu.vhostUserPackages = with pkgs; [ virtiofsd ];
  };
  virtualisation.spiceUSBRedirection.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.ali = {
    isNormalUser = true;
    description = "Ali Heydari";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
      "libvirtd"
    ];
  };

  security.sudo.extraConfig = ''
    %wheel ALL=(ALL) NOPASSWD: ALL
  '';

  security.polkit.extraConfig = ''
    polkit.addRule(function(action, subject) {
      if (subject.isInGroup("wheel")) {
        return polkit.Result.YES;
      }
    });
  '';

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
