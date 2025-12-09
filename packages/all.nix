{
  lib,
  pkgs,
  ...
}:
let
  rtorrent = import ./rtorrent.nix { inherit pkgs; };
  lyrics-finder = import ./lyricsfinder.nix { inherit pkgs; };
  dvdae = import ./dvdae.nix { inherit pkgs; };
  # my-fonts = import ./fonts/proprietary.nix { inherit pkgs; };
  parastoo = import ./fonts/parastoo.nix { inherit pkgs; };
  estedad = import ./fonts/estedad.nix { inherit pkgs; };
  estedad-mad = import ./fonts/estedad-mad.nix { inherit pkgs; };
  gandom = import ./fonts/gandom.nix { inherit pkgs; };
  sahel = import ./fonts/sahel.nix { inherit pkgs; };
  lalezar = import ./fonts/lalezar.nix { inherit pkgs; };
  medmnist = import ./medmnist.nix {
    inherit lib;
    inherit (pkgs.python313Packages)
      buildPythonPackage
      fetchPypi
      setuptools
      numpy
      pandas
      scikit-learn
      scikit-image
      tqdm
      pillow
      fire
      torch
      torchvision
      ;
  };
  # jetbrains-plugin = pkgs.stdenv.mkDerivation {
  #   name = "jetbrains-java-agent-net-filter";
  #   version = "2024.0";
  #   src = ../proprietary/ja-netfilter-all;
  #   installPhase = "cp -r $src $out";
  # };
  # jetbrains-vmoptions-patch = lib.concatStringsSep "\n" [
  #   "-javaagent:${jetbrains-plugin}/ja-netfilter.jar=jetbrains"
  #   "--add-opens=java.base/jdk.internal.org.objectweb.asm=ALL-UNNAMED"
  #   "--add-opens=java.base/jdk.internal.org.objectweb.asm.tree=ALL-UNNAMED"
  # ];

  fmab-customizations = import ./fmab.nix { inherit pkgs; };
in
{
  config = {
    # ali.fonts.my-fonts = my-fonts;
    ali.fonts.parastoo = parastoo;
    ali.fonts.estedad = estedad;
    ali.fonts.estedad-mad = estedad-mad;
    ali.fonts.gandom = gandom;
    ali.fonts.sahel = sahel;
    ali.fonts.lalezar = lalezar;
    ali.packages.fmab-customizations = fmab-customizations;
    ali.packages.rtorrent = rtorrent;
    ali.packages.lyrics-finder = lyrics-finder;
    ali.packages.dvdae = dvdae.dvd-audio-extractor;
    security.wrappers = dvdae.wrapper.security.wrappers;
    ali.packages.medmnist = medmnist;
    # ali.jetbrains.vmoptions-patch = jetbrains-vmoptions-patch;

    nixpkgs.overlays = [
      (self: super: {
        goland =
          super.jetbrains.plugins.addPlugins super.jetbrains.goland
            # (super.jetbrains.goland.override {
            #   vmopts = jetbrains-vmoptions-patch;
            # })
            [
              # "org.jetbrains.junie"
              # "com.intellij.ml.llm"
              # "com.intellij.mcpServer"
              "catppuccin-theme"
              "catppuccin-icons"
              "nixidea" # "nix-idea"
              # "mobi.hsz.idea.gitignore"
              "ini" # "com.jetbrains.plugins.ini4idea"
              "-env-files" # "ru.adelf.idea.dotenv"
              "toml" # "org.toml.lang"
              "csv-editor" # "net.seesharpsoft.intellij.plugins.csv"
              # "com.intellij.kubernetes"
              "docker" # "Docker"
              "gitlab" # "org.jetbrains.plugins.gitlab"
              # "org.jetbrains.plugins.github"
              # "org.intellij.plugins.markdown"
              # "com.intellij.ideolog"
              "protocol-buffers" # "idea.plugin.protoeditor"
              # "com.intellij.grpc"
              # "org.jetbrains.plugins.yaml"
              # "com.intellij.microservices.ui"
              # "org.intellij.RegexpTester"
            ];
        clion =
          super.jetbrains.plugins.addPlugins super.jetbrains.clion
            # (super.jetbrains.clion.override {
            #   vmopts = jetbrains-vmoptions-patch;
            # })
            [
              "catppuccin-theme"
              "catppuccin-icons"
              "-env-files"
              "gitlab"
              # "name.kropp.intellij.makefile"
              # "com.intellij.qt"
              # "com.intellij.lang.qml"
            ];
        datagrip =
          super.jetbrains.plugins.addPlugins super.jetbrains.datagrip
            # (super.jetbrains.datagrip.override {
            #   vmopts = jetbrains-vmoptions-patch;
            # })
            [
              "catppuccin-theme"
              "catppuccin-icons"
            ];
        pycharm =
          super.jetbrains.plugins.addPlugins super.jetbrains.pycharm-professional
            # (super.jetbrains.pycharm-professional.override {
            #   vmopts = jetbrains-vmoptions-patch;
            # })
            [
              "catppuccin-theme"
              "catppuccin-icons"
              "-env-files"
              "gitlab"
              # "com.intellij.bigdatatools"
              # "com.intellij.bigdatatools.core"
              # "com.intellij.bigdatatools.binary.files"
              # "com.intellij.bigdatatools.kafka"
              # "R4Intellij"
              # "com.leinardi.pycharm.pylint"
              # "ru.meanmail.plugin.requirements"
            ];
        dataspell = super.jetbrains.dataspell;
        # super.jetbrains.dataspell.override {
        #   vmopts = jetbrains-vmoptions-patch;
        # };
        webstorm =
          super.jetbrains.plugins.addPlugins super.jetbrains.webstorm
            # (super.jetbrains.webstorm.override {
            #   vmopts = jetbrains-vmoptions-patch;
            # })
            [
              "catppuccin-theme"
              "catppuccin-icons"
              "-env-files"
              "gitlab"
              "protocol-buffers"
              # "NodeJS"
              # "deno"
              # "intellij.vitejs"
              # "org.jetbrains.plugins.astro"
              # "dev.blachut.svelte.lang"
              # "mdx.js"
              # "intellij.prettierJS"
              # "com.github.biomejs.intellijbiome"
            ];
        rustrover =
          super.jetbrains.plugins.addPlugins super.jetbrains.rust-rover
            # (super.jetbrains.rust-rover.override {
            #   vmopts = jetbrains-vmoptions-patch;
            # })
            [
              "catppuccin-theme"
              "catppuccin-icons"
              "-env-files"
              "toml"
              "gitlab"
            ];
      })
      # (final: prev: {
      #   python313Packages = prev.python313Packages // {
      #     torch = prev.python313Packages.torch.override {
      #       vulkanSupport = true;
      #     };
      #   };
      # })
    ];

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
        ExecStart = "${pkgs.proxychains}/bin/proxychains4 ${pkgs.rtorrent}/bin/rtorrent -o network.scgi.open_local=/home/ali/rpc.socket,system.daemon.set=true,system.file.allocate.set=1"; # TODO: a better rpc.socket path
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
        ExecStart = "${pkgs.flood}/bin/flood";
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
        ExecStart = "${pkgs.stirling-pdf}/bin/Stirling-PDF";
        ExecStop = "${pkgs.coreutils}/bin/kill -15 $MAINPID";
        SuccessExitStatus = 143;
      };
    };
  };

  options.ali = {
    # fonts.my-fonts = lib.mkOption { type = lib.types.package; };
    fonts.parastoo = lib.mkOption { type = lib.types.package; };
    fonts.estedad = lib.mkOption { type = lib.types.package; };
    fonts.estedad-mad = lib.mkOption { type = lib.types.package; };
    fonts.gandom = lib.mkOption { type = lib.types.package; };
    fonts.sahel = lib.mkOption { type = lib.types.package; };
    fonts.lalezar = lib.mkOption { type = lib.types.package; };
    packages.fmab-customizations = lib.mkOption { type = lib.types.package; };
    packages.rtorrent = lib.mkOption { type = lib.types.package; };
    packages.lyrics-finder = lib.mkOption { type = lib.types.package; };
    packages.dvdae = lib.mkOption { type = lib.types.package; };
    packages.medmnist = lib.mkOption { type = lib.types.package; };
    # jetbrains.vmoptions-patch = lib.mkOption { type = lib.types.lines; };
  };
}
