{
  lib,
  pkgs,
  ...
}:
let
  rtorrent = import ./rtorrent.nix { inherit pkgs; };
  lyrics-finder = import ./lyricsfinder.nix { inherit pkgs; };
  dvdae = import ./dvdae.nix { inherit pkgs; };
  my-fonts = pkgs.stdenv.mkDerivation {
    name = "my-custom-fonts";
    src = ./fonts;
    installPhase = ''
      mkdir -p $out/share/fonts/truetype
      cp -r $src/* $out/share/fonts/truetype/
    '';
  };
  sleekGrubThemePatched = pkgs.sleek-grub-theme.overrideAttrs (old: {
    buildInputs = (old.buildInputs or [ ]) ++ [ pkgs.gnused ];
    postInstall = old.postInstall or "" + ''
      cp ${./images/grub-background.png} $out/background.png
      ${pkgs.gnused}/bin/sed -i \
        -e 's/desktop-color: \"#121212\"/desktop-image: \"background.png\"/' \
        -e 's/color=\"#99C6FF\"/color=\"#e5c890\"/' \
        -e 's/color=\"#4286DD\"/color=\"#e5c890\"/' \
        -e 's/color=\"#171D20\"/color=\"#e5c890\"/' \
        -e 's/width = 400/width = 720/' \
        -e 's/left = 50%-200/left = 50%-360/' \
        "$out/theme.txt"
    '';
  });
  # jetbrains-plugin = pkgs.stdenv.mkDerivation {
  #   name = "jetbrains-java-agent-net-filter";
  #   version = "2024.0";
  #   src = ./ja-netfilter-all;
  #   installPhase = "cp -r $src $out";
  # };
  # jetbrains-vmoptions-patch = lib.concatStringsSep "\n" [
  #   "-javaagent:${jetbrains-plugin}/ja-netfilter.jar=jetbrains"
  #   "--add-opens=java.base/jdk.internal.org.objectweb.asm=ALL-UNNAMED"
  #   "--add-opens=java.base/jdk.internal.org.objectweb.asm.tree=ALL-UNNAMED"
  # ];

  my-pics = pkgs.stdenv.mkDerivation {
    name = "fmab-dist";
    src = ./images;
    installPhase = ''
      mkdir -p $out/share/wallpapers/fmab/contents/images
      mkdir -p $out/share/wallpapers/fmab/contents/images_dark
      cp $src/plasma-desktop-light-background.png $out/share/wallpapers/fmab/contents/images/1920x1080.png
      cp $src/plasma-desktop-dark-background.png $out/share/wallpapers/fmab/contents/images_dark/1920x1080.png
      cp $src/metadata.json $out/share/wallpapers/fmab/metadata.json
      mkdir -p $out/share/lockscreens/fmab/contents/images
      cp $src/sddm-and-plasma-screenlocker-background.png $out/share/lockscreens/fmab/contents/images/1920x1080.png
      mkdir -p $out/share/menu/fmab/contents/icons
      cp $src/icon.png $out/share/menu/fmab/contents/icons/icon.png
    '';
  };
  setPlasmaThemeScript = pkgs.writeShellScriptBin "set-plasma-theme-dynamic" ''
    #!${pkgs.bash}/bin/bash
    set -euo pipefail

    current_hour_int=$(date +%H)

    if [[ $current_hour_int -ge 7 && $current_hour_int -lt 18 ]]; then
      "/run/current-system/sw/bin/plasma-apply-lookandfeel" "org.kde.breeze.desktop"
      "/run/current-system/sw/bin/plasma-apply-colorscheme" "CatppuccinLatteYellow"
      "/run/current-system/sw/bin/plasma-apply-wallpaperimage" "${my-pics}/share/wallpapers/fmab/contents/images/1920x1080.png"
      "/run/current-system/sw/bin/plasma-apply-cursortheme" "breeze_cursors"
      "/run/current-system/sw/bin/plasma-apply-cursortheme" "Breeze_Light"
    else
      "/run/current-system/sw/bin/plasma-apply-lookandfeel" "org.kde.breezedark.desktop"
      "/run/current-system/sw/bin/plasma-apply-colorscheme" "CatppuccinFrappeYellow"
      "/run/current-system/sw/bin/plasma-apply-wallpaperimage" "${my-pics}/share/wallpapers/fmab/contents/images_dark/1920x1080.png"
      "/run/current-system/sw/bin/plasma-apply-cursortheme" "Breeze_Light"
      "/run/current-system/sw/bin/plasma-apply-cursortheme" "breeze_cursors"
    fi
  '';
in
{
  config = {
    ali.grub.sleekGrubThemePatched = sleekGrubThemePatched;
    ali.fonts.my-fonts = my-fonts;
    ali.packages.rtorrent = rtorrent.rtorrent;
    ali.packages.lyrics-finder = lyrics-finder.lyrics-finder;
    ali.packages.dvdae = dvdae.dvd-audio-extractor;
    security.wrappers = dvdae.wrapper.security.wrappers;
    # ali.jetbrains.vmoptions-patch = jetbrains-vmoptions-patch;

    # nixpkgs.overlays = [
    #   (self: super: {
    #     goland = super.jetbrains.goland.override {
    #       vmopts = jetbrains-vmoptions-patch;
    #     };
    #     clion = super.jetbrains.clion.override {
    #       vmopts = jetbrains-vmoptions-patch;
    #     };
    #     datagrip = super.jetbrains.datagrip.override {
    #       vmopts = jetbrains-vmoptions-patch;
    #     };
    #     pycharm = super.jetbrains.pycharm-professional.override {
    #       vmopts = jetbrains-vmoptions-patch;
    #     };
    #     dataspell = super.jetbrains.dataspell.override {
    #       vmopts = jetbrains-vmoptions-patch;
    #     };
    #     webstorm = super.jetbrains.webstorm.override {
    #       vmopts = jetbrains-vmoptions-patch;
    #     };
    #     rustrover = super.jetbrains.rust-rover.override {
    #       vmopts = jetbrains-vmoptions-patch;
    #     };
    #   })
    # ];

    systemd.services.rtorrent = {
      description = "rTorrent service";
      wants = [
        "network-online.target"
      ];
      after = [
        "network-online.target"
        "local-fs.target"
      ];
      wantedBy = [ "multi-user.target" ];

      serviceConfig = {
        User = "ali";
        Type = "simple";
        KillMode = "process";
        KillSignal = "SIGHUP";
        ExecStart = "/run/current-system/sw/bin/proxychains4 /run/current-system/sw/bin/rtorrent -o network.scgi.open_local=/home/ali/rpc.socket,system.daemon.set=true,system.file.allocate.set=1";
        Restart = "on-failure";
        RestartSec = 3;
      };
    };

    systemd.services.flood = {
      description = "Flood web UI";
      after = [ "network.target" ];
      wantedBy = [ "multi-user.target" ];
      serviceConfig = {
        User = "ali";
        Type = "simple";
        ExecStart = "/run/current-system/sw/bin/flood";
        StandardOutput = "journal";
        StandardError = "journal";
        Restart = "on-failure";
        RestartSec = 3;
      };
    };

    systemd.user.services.plasma-theme-switcher = {
      description = "Dynamic Plasma Theme Switcher Service";
      partOf = [ "plasma-theme-switcher.timer" ];
      path = [
        my-pics
        pkgs.bash
        pkgs.coreutils
        pkgs.kdePackages.plasma-workspace
      ];
      serviceConfig = {
        Type = "oneshot";
        ExecStart = "${setPlasmaThemeScript}/bin/set-plasma-theme-dynamic";
      };
      wantedBy = [
        "default.target"
        "plasma-workspace.target"
      ];
    };

    systemd.user.timers.plasma-theme-switcher = {
      description = "Timer for Plasma Theme Switcher (7 AM / 6 PM)";
      timerConfig = {
        Unit = "plasma-theme-switcher.service";
        OnCalendar = [
          "07:00"
          "18:00"
        ];
        Persistent = true;
      };
      wantedBy = [ "timers.target" ];
    };
  };

  options.ali = {
    grub.sleekGrubThemePatched = lib.mkOption { type = lib.types.package; };
    fonts.my-fonts = lib.mkOption { type = lib.types.package; };
    packages.rtorrent = lib.mkOption { type = lib.types.package; };
    packages.lyrics-finder = lib.mkOption { type = lib.types.package; };
    packages.dvdae = lib.mkOption { type = lib.types.package; };
    jetbrains.vmoptions-patch = lib.mkOption { type = lib.types.lines; };
  };
}
