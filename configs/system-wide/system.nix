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
  # system.includeBuildDependencies = true;
  nix.optimise = {
    automatic = true;
    persistent = false;
  };
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [ "olm-3.2.16" ]; # for neochat

  networking = {
    hostName = "aliheydaripc"; # system.name follows this
    useDHCP = lib.mkDefault true;
    # proxy.default = "socks5://192.168.122.66:18888"; # schema reminder schema://user:password@proxy:port
    proxy.noProxy = "127.0.0.1,localhost";
    useNetworkd = true;
    nftables.enable = true;
    networkmanager = {
      enable = true;
      wifi.backend = "iwd";
      # wifi.macAddress = "random";
      # ethernet.macAddress = "random";
      plugins = with pkgs; [
        networkmanager-ssh
        networkmanager-openvpn
        networkmanager-l2tp
      ];
      # insertNameservers = [ "1.1.1.1" "8.8.8.8" ];
      # appendNameservers = [
      #   "1.1.1.1"
      #   "8.8.8.8"
      # ];
      # dns = "systemd-resolved";
    };
    nameservers = [
      # "178.22.122.100"
      # "185.51.200.2"
      # "1.1.1.1"
      # "8.8.8.8"
    ];
    hosts = {
      "192.168.0.1" = [ "login.modares.ac.ir" ];
    };
  };
  services.xl2tpd.enable = true; # Needed for networkmanager-l2tp IPsec Settings...
  services.strongswan = { # Needed for networkmanager-l2tp IPsec Settings...
    enable = true;
    secrets = [
      "ipsec.d/ipsec.nm-l2tp.secrets"
    ];
  };
  systemd.network.enable = true;
  systemd.network.wait-online.enable = true;
  services.firewalld.enable = true;
  services.resolved = {
    enable = true;
    settings.Resolve = {
      LMNR = "true";
      DNSSEC = "allow-downgrade";
      DNSOverTLS = "opportunistic";
      FallbackDNS = [
        # "178.22.122.100"
        # "185.51.200.2"
        # "1.1.1.1"
        # "8.8.8.8"
      ];
    };
  };
  # programs.captive-browser.enable = true;

  time.timeZone = "Asia/Tehran";
  location.latitude = 35.43;
  location.longitude = 51.24;

  # internationalisation
  i18n = {
    defaultLocale = "en_GB.UTF-8";
    extraLocaleSettings = {
      # LC_ALL = "en_GB.UTF-8";
      LC_TIME = "fa_IR";
    };
    extraLocales = [ "fa_IR/UTF-8" ];
  };

  # Bootloader
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
    theme = "fmab.${config.catppuccin.flavor}"; # available: matrix, breeze, breeze-text, catppuccin-frappe, catppuccin-latte, catppuccin-macchiato, catppuccin-mocha, details, fade-in, glow, script, solar, spinfinity, spinner, text, tribar
  };

  services.xserver.enable = false;
  services.displayManager = {
    plasma-login-manager.enable = true;
    defaultSession = "plasma";
  };
  services.desktopManager.plasma6.enable = true;

  catppuccin = {
    enable = true;
    flavor = lib.mkDefault "frappe";
    accent = "yellow";
    grub.enable = false;
    plymouth.enable = false;
  };

  specialisation = {
    dark.configuration = {
      catppuccin.flavor = "frappe";
    };
    light.configuration = {
      catppuccin.flavor = "latte";
    };
  };

  services.getty.autologinUser = "ali";
  # services.kmscon = {
  #   enable = true;
  #   hwRender = false;
  #   fonts = [{ name = "Fira Code Nerd Font Mono"; package = pkgs.nerd-fonts.fira-code; }];
  #   # useXkbConfig
  # };
  console.keyMap = "us";

  programs.niri = {
    enable = true;
    useNautilus = false;
  };
  programs.dms-shell = {
    enable = true;
    systemd.enable = false;
    enableSystemMonitoring = true;
    enableVPN = true;
    enableDynamicTheming = true;
    enableAudioWavelength = true;
    enableCalendarEvents = true;
    enableClipboardPaste = true;
    # optional: cups-pk-helper
    # to do: https://danklinux.com/docs/dankmaterialshell/nixos#plugins https://danklinux.com/plugins
  };
  programs.dsearch.enable = true;
  # xdg.portal.config.niri = {
  #   "default" = [ "kde" "gtk" ];
  #   "org.freedesktop.impl.portal.Access" = [ "kde" "gtk" ];
  #   "org.freedesktop.impl.portal.FileChooser" = [ "kde" "gtk" ];
  #   "org.freedesktop.impl.portal.Notification" = [ "kde" "gtk" ];
  #   "org.freedesktop.impl.portal.Secret" = [ "kde" ];
  #   "org.freedesktop.impl.portal.ScreenCast" = [ "kde" ];
  #   "org.freedesktop.impl.portal.Screenshot" = [ "kde" ];
  # };

  services.colord.enable = true;

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

  # services.envfs.enable = true;
  # programs.nix-ld.enable = true;
  programs.nix-index.enable = true;

  fonts.enableDefaultPackages = true; # installs dejavu_fonts freefont_ttf gyre-fonts liberation_ttf unifont noto-fonts-color-emoji
  # services.desktopManager.plasma6.notoPackage also installs noto-fonts
  fonts.packages =
    with pkgs;
    [
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
      config.ali.fonts.my-fonts
      config.ali.fonts.parastoo
      config.ali.fonts.estedad
      config.ali.fonts.estedad-mad
      config.ali.fonts.sahel
      config.ali.fonts.gandom
      config.ali.fonts.lalezar
    ];
  fonts.fontconfig.defaultFonts = {
    monospace = [ "FiraCode Nerd Font Mono" ];
    sansSerif = [ "IRANSansX Light" ];
  };

  users.users = {
    ali = {
      home = "/home/ali";
      description = "Ali Heydari";
      isNormalUser = true;
      createHome = true;
      hashedPassword = "$y$j9T$oet1b/sVBg4sP3S9UrJfE.$ISZnP2YDtde92p22ZO4lGDmXfZYLeG3j0L6sKnifbD1";
      extraGroups = [
        "networkmanager"
        "wheel"
        "podman"
        "libvirtd"
      ];
    };
    root = {
      home = "/root";
      description = "System administrator";
      isSystemUser = true;
      createHome = true;
      hashedPassword = "$y$j9T$CdMh4dAXoM0o5jKi4GE621$j5WAekGuzwcsQEjAGlxfNXVlUYouI3i9g45XxwFOY/C";
    };
  };

  security.sudo.wheelNeedsPassword = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
