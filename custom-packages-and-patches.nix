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

  fmab-customizations = pkgs.runCommand "fmab-customizations" { } ''
    mkdir -p $out/share
    cp -r ${./fmab}/* $out/share/
  '';
in
{
  config = {
    ali.fonts.my-fonts = my-fonts;
    ali.packages.fmab-customizations = fmab-customizations;
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

    systemd.services.stirling = {
      description = "Stirling PDF web UI";
      after = [
        "syslog.target"
        "network.target"
      ];
      wantedBy = [ "multi-user.target" ];
      serviceConfig = {
        User = "root";
        Type = "simple";
        ExecStart = "/run/current-system/sw/bin/Stirling-PDF";
        ExecStop = "/run/current-system/sw/bin/kill -15 $MAINPID";
        SuccessExitStatus = 143;
      };
    };
  };
  options.ali = {
    fonts.my-fonts = lib.mkOption { type = lib.types.package; };
    packages.fmab-customizations = lib.mkOption { type = lib.types.package; };
    packages.rtorrent = lib.mkOption { type = lib.types.package; };
    packages.lyrics-finder = lib.mkOption { type = lib.types.package; };
    packages.dvdae = lib.mkOption { type = lib.types.package; };
    jetbrains.vmoptions-patch = lib.mkOption { type = lib.types.lines; };
  };
}
