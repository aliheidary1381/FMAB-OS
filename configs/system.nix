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
  nix.settings.substituters = [ "file:///var/cache/nix/local-cache" ];
  nix.settings.trusted-substituters = [ "file:///var/cache/nix/local-cache" ];

  nixpkgs.config.allowUnfree = true;

  networking.hostName = "aliheydaripc";

  # Configure network proxy if necessary
  # networking.proxy.default = "socks5://192.168.122.66:18888"; # schema reminder user:password@proxy:port
  networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  networking.useNetworkd = true;
  systemd.services.systemd-networkd-wait-online.enable = lib.mkForce false;

  # Set your time zone.
  time.timeZone = "Asia/Tehran";
  location.latitude = 35.43;
  location.longitude = 51.24;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LANG = "en_GB.UTF-8";
    LC_ALL = "en_GB.UTF-8";
  };

  # Bootloader.
  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    device = "nodev";
  };
  boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.grub2-theme = {
    enable = true;
    theme = "whitesur";
    icon = "color";
    splashImage = "${config.ali.packages.fmab-customizations}/share/grub/background.png";
    footer = true;
  };

  boot.plymouth = {
    enable = true;
    themePackages = with pkgs; [
      plymouth-matrix-theme
      kdePackages.breeze-plymouth
      config.ali.packages.fmab-customizations
    ];
    font = "${config.ali.fonts.my-fonts}/share/fonts/truetype/lost-land.ttf";
    theme = "fmab"; # available: matrix, breeze, breeze-text, catppuccin-frappe, catppuccin-latte, catppuccin-macchiato, catppuccin-mocha, details, fade-in, glow, script, solar, spinfinity, spinner, text, tribar
  };

  # Configure display manager & desktop manager.
  services.xserver.enable = false;
  services.displayManager.sddm = {
    enable = true;
    autoNumlock = true;
    autoLogin.relogin = true;
    theme = "${config.ali.packages.fmab-customizations}/share/sddm/themes/fmab";
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
    grub.enable = false;
    plymouth.enable = false;
    sddm.enable = false;
  };

  services.colord.enable = true;

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

  networking.nameservers = [
    # "178.22.122.100"
    # "185.51.200.2"
    "1.1.1.1"
    "8.8.8.8"
  ];
  services.resolved = {
    enable = true;
    llmnr = "true";
    dnssec = "allow-downgrade";
    dnsovertls = "opportunistic";
    fallbackDns = [
      # "178.22.122.100"
      # "185.51.200.2"
      "1.1.1.1"
      "8.8.8.8"
    ];
  };

  # services.envfs.enable = true;
  # programs.nix-ld.enable = true;
  programs.nix-index.enable = true;

  programs.proxychains = {
    enable = true;
    proxies.windscribe = {
      type = "socks5";
      host = "192.168.122.66";
      port = 18888;
      enable = false;
    };
    proxies.phone = {
      type = "socks5";
      host = "10.119.117.156";
      port = 1080;
      enable = true;
    };
  };

  fonts.enableDefaultPackages = true; # installs dejavu_fonts freefont_ttf gyre-fonts liberation_ttf unifont noto-fonts-color-emoji
  fonts.packages =
    with pkgs;
    [
      # Note: services.desktopManager.plasma6.notoPackage installs noto-fonts
      nerd-fonts.fira-code
      mplus-outline-fonts.githubRelease
      liberation-sans-narrow
      carlito
      aileron
      gelasio
      garamond-libre
      caladea
      ir-standard-fonts
    ]
    ++ [
      (pkgs.texliveFull.withPackages (
        ps: with ps; [
          gfsdidot
          palatino
          gfsbaskerville
          boisik
          librebaskerville
        ]
      )).fonts
      # config.ali.fonts.my-fonts
      config.ali.fonts.parastoo
      config.ali.fonts.estedad
      config.ali.fonts.estedad-mad
      config.ali.fonts.sahel
      config.ali.fonts.gandom
      config.ali.fonts.lalezar
    ];
  fonts.fontconfig.defaultFonts = {
    monospace = [ "FiraCode Nerd Font Mono" ];
    # sansSerif = [ "IRANSansX Light" ];
  };

  systemd.targets.machines.enable = true; # For nspawn Linux containers
  virtualisation.docker.enable = true; # For WinBoat Windows containers
  virtualisation.waydroid.enable = true; # For WayDroid Android containers https://wiki.nixos.org/wiki/Waydroid https://docs.waydro.id/usage/
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = [ "ali" ];
  virtualisation.libvirtd = {
    enable = true;
    qemu.package = pkgs.qemu_kvm;
    qemu.vhostUserPackages = [ pkgs.virtiofsd ];
  };
  virtualisation.spiceUSBRedirection.enable = true;

  users.users = {
    ali = {
      home = "/home/ali";
      description = "Ali Heydari";
      isNormalUser = true;
      createHome = true;
      # hashedPassword = "$y$j9T$oet1b/sVBg4sP3S9UrJfE.$ISZnP2YDtde92p22ZO4lGDmXfZYLeG3j0L6sKnifbD1";
      extraGroups = [
        "networkmanager"
        "wheel"
        "docker"
        "libvirtd"
      ];
    };
    root = {
      home = "/root";
      description = "System administrator";
      isSystemUser = true;
      createHome = true;
      # hashedPassword = "$y$j9T$CdMh4dAXoM0o5jKi4GE621$j5WAekGuzwcsQEjAGlxfNXVlUYouI3i9g45XxwFOY/C";
    };
  };

  security.sudo.wheelNeedsPassword = false;

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
