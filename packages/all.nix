{
  lib,
  pkgs,
  nix-jetbrains-plugins,
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

    nixpkgs.overlays = with nix-jetbrains-plugins.lib."${pkgs.stdenv.hostPlatform.system}"; [
      (self: super: {
        goland =
          buildIdeWithPlugins super.jetbrains
            super.jetbrains.goland
            # (super.jetbrains.goland.override {
            #   vmopts = jetbrains-vmoptions-patch;
            # })
            [
              "org.jetbrains.junie"
              "com.intellij.ml.llm"
              "com.intellij.mcpServer"
              "com.github.catppuccin.jetbrains"
              "com.github.catppuccin.jetbrains_icons"
              "nix-idea"
              # "org.fe3dback.nixlsp"
              "mobi.hsz.idea.gitignore"
              "com.jetbrains.plugins.ini4idea"
              "ru.adelf.idea.dotenv"
              "org.toml.lang"
              "net.seesharpsoft.intellij.plugins.csv"
              "com.intellij.kubernetes"
              "org.jetbrains.plugins.yaml"
              "Docker"
              "org.jetbrains.plugins.gitlab"
              "org.jetbrains.plugins.github"
              # "org.intellij.plugins.markdown"
              "com.intellij.ideolog"
              "idea.plugin.protoeditor"
              # "com.intellij.grpc"
              "com.intellij.microservices.ui"
              "org.intellij.RegexpTester"
            ];
        clion =
          buildIdeWithPlugins super.jetbrains
            # (super.jetbrains.clion.override {
            #   vmopts = jetbrains-vmoptions-patch;
            # })
            super.jetbrains.clion
            [
              "org.jetbrains.junie"
              "com.intellij.ml.llm"
              "com.intellij.mcpServer"
              "com.github.catppuccin.jetbrains"
              "com.github.catppuccin.jetbrains_icons"
              "mobi.hsz.idea.gitignore"
              "ru.adelf.idea.dotenv"
              "org.jetbrains.plugins.gitlab"
              "org.jetbrains.plugins.github"
              # "org.intellij.plugins.markdown"
              "com.intellij.ideolog"
              "name.kropp.intellij.makefile"
              "com.intellij.qt"
              "com.intellij.lang.qml"
            ];
        datagrip =
          buildIdeWithPlugins super.jetbrains
            # (super.jetbrains.datagrip.override {
            #   vmopts = jetbrains-vmoptions-patch;
            # })
            super.jetbrains.datagrip
            [
              "org.jetbrains.junie"
              "com.intellij.ml.llm"
              "com.intellij.mcpServer"
              "com.github.catppuccin.jetbrains"
              "com.github.catppuccin.jetbrains_icons"
            ];
        pycharm =
          buildIdeWithPlugins super.jetbrains
            # (super.jetbrains.pycharm.override {
            #   vmopts = jetbrains-vmoptions-patch;
            # })
            super.jetbrains.pycharm
            [
              "org.jetbrains.junie"
              "com.intellij.ml.llm"
              "com.intellij.mcpServer"
              "com.github.catppuccin.jetbrains"
              "com.github.catppuccin.jetbrains_icons"
              "mobi.hsz.idea.gitignore"
              "ru.adelf.idea.dotenv"
              "org.toml.lang"
              "org.jetbrains.plugins.gitlab"
              "org.jetbrains.plugins.github"
              # "org.intellij.plugins.markdown"
              "com.intellij.ideolog"
              # "ru.meanmail.plugin.requirements"
            ];
        dataspell =
          buildIdeWithPlugins super.jetbrains
            # (super.jetbrains.dataspell.override {
            #   vmopts = jetbrains-vmoptions-patch;
            # })
            super.jetbrains.dataspell
            [
              "org.jetbrains.junie"
              "com.intellij.ml.llm"
              "com.intellij.mcpServer"
              "com.github.catppuccin.jetbrains"
              "com.github.catppuccin.jetbrains_icons"
              "ru.adelf.idea.dotenv"
              # "org.intellij.plugins.markdown"
              "com.intellij.ideolog"
              "com.intellij.bigdatatools"
              "com.intellij.bigdatatools.core"
              "com.intellij.bigdatatools.metastore.core"
              "com.intellij.bigdatatools.binary.files"
              "com.intellij.bigdatatools.rfs"
              "com.intellij.bigdatatools.spark"
              "com.intellij.bigdatatools.kafka"
              "com.intellij.bigdatatools.zeppelin"
              "com.intellij.bigdatatools.flink"
              "R4Intellij"
            ];
        webstorm =
          buildIdeWithPlugins super.jetbrains
            # (super.jetbrains.webstorm.override {
            #   vmopts = jetbrains-vmoptions-patch;
            # })
            super.jetbrains.webstorm
            [
              "org.jetbrains.junie"
              "com.intellij.ml.llm"
              "com.intellij.mcpServer"
              "com.github.catppuccin.jetbrains"
              "com.github.catppuccin.jetbrains_icons"
              "mobi.hsz.idea.gitignore"
              "ru.adelf.idea.dotenv"
              "org.jetbrains.plugins.gitlab"
              "org.jetbrains.plugins.github"
              # "org.intellij.plugins.markdown"
              "com.intellij.ideolog"
              "idea.plugin.protoeditor"
              # "com.intellij.grpc"
              "NodeJS"
              "deno"
              "intellij.vitejs"
              "org.jetbrains.plugins.astro"
              "dev.blachut.svelte.lang"
              "mdx.js"
              "intellij.prettierJS"
            ];
        rustrover =
          buildIdeWithPlugins super.jetbrains
            # (super.jetbrains.rust-rover.override {
            #   vmopts = jetbrains-vmoptions-patch;
            # })
            super.jetbrains.rust-rover
            [
              "org.jetbrains.junie"
              "com.intellij.ml.llm"
              "com.intellij.mcpServer"
              "com.github.catppuccin.jetbrains"
              "com.github.catppuccin.jetbrains_icons"
              "mobi.hsz.idea.gitignore"
              "ru.adelf.idea.dotenv"
              "org.toml.lang"
              "org.jetbrains.plugins.gitlab"
              "org.jetbrains.plugins.github"
              # "org.intellij.plugins.markdown"
              "com.intellij.ideolog"
              "idea.plugin.protoeditor"
              # "com.intellij.grpc"
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
