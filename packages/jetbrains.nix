{
  lib,
  pkgs,
  nix-jetbrains-plugins,
  ...
}:
let
  jetbrains-plugin = pkgs.stdenv.mkDerivation {
    name = "jetbrains-java-agent-net-filter";
    version = "2025.12.10";
    src = ../proprietary/ja-netfilter-all;
    installPhase = "cp -r $src $out";
  };
  jetbrains-vmoptions-patch = lib.concatStringsSep "\n" [
    # "-javaagent:${jetbrains-plugin}/ja-netfilter.jar=jetbrains"
    "-javaagent:${jetbrains-plugin}/enc-sniarbtej-2025.12.10.jar=id=sniarbtej,user=Downloadly.ir,exp=2048-10-24,force=true"
    "--add-opens=java.base/jdk.internal.org.objectweb.asm=ALL-UNNAMED"
    "--add-opens=java.base/jdk.internal.org.objectweb.asm.tree=ALL-UNNAMED"
  ];
in
{
  config.ali.jetbrains = with nix-jetbrains-plugins.lib; {
    vmoptions-patch = jetbrains-vmoptions-patch;
    goland =
      buildIdeWithPlugins pkgs
        (pkgs.jetbrains.goland.override {
          vmopts = jetbrains-vmoptions-patch;
        })
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
      buildIdeWithPlugins pkgs
        (pkgs.jetbrains.clion.override {
          vmopts = jetbrains-vmoptions-patch;
        })
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
      buildIdeWithPlugins pkgs
        (pkgs.jetbrains.datagrip.override {
          vmopts = jetbrains-vmoptions-patch;
        })
        [
          "org.jetbrains.junie"
          "com.intellij.ml.llm"
          "com.intellij.mcpServer"
          "com.github.catppuccin.jetbrains"
          "com.github.catppuccin.jetbrains_icons"
        ];
    pycharm =
      buildIdeWithPlugins pkgs
        (pkgs.jetbrains.pycharm.override {
          vmopts = jetbrains-vmoptions-patch;
        })
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
          "com.jetbrains.plugins.webDeployment"
          # "ru.meanmail.plugin.requirements"
        ];
    dataspell =
      (pkgs.jetbrains.dataspell.override {
        vmopts = jetbrains-vmoptions-patch;
      });
      # buildIdeWithPlugins pkgs
      #   (pkgs.jetbrains.dataspell.override {
      #     vmopts = jetbrains-vmoptions-patch;
      #   })
      #   [
      #     "org.jetbrains.junie"
      #     "com.intellij.ml.llm"
      #     "com.intellij.mcpServer"
      #     "com.github.catppuccin.jetbrains"
      #     "com.github.catppuccin.jetbrains_icons"
      #     "ru.adelf.idea.dotenv"
      #     # "org.intellij.plugins.markdown"
      #     "com.intellij.ideolog"
      #     "com.intellij.bigdatatools"
      #     "com.intellij.bigdatatools.core"
      #     "com.intellij.bigdatatools.metastore.core"
      #     "com.intellij.bigdatatools.binary.files"
      #     "com.intellij.bigdatatools.rfs"
      #     "com.intellij.bigdatatools.spark"
      #     "com.intellij.bigdatatools.kafka"
      #     "com.intellij.bigdatatools.zeppelin"
      #     "com.intellij.bigdatatools.flink"
      #     # "R4Intellij"
      #   ];
    webstorm =
      buildIdeWithPlugins pkgs
        (pkgs.jetbrains.webstorm.override {
          vmopts = jetbrains-vmoptions-patch;
        })
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
      buildIdeWithPlugins pkgs
        (pkgs.jetbrains.rust-rover.override {
          vmopts = jetbrains-vmoptions-patch;
        })
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
  };
  options.ali.jetbrains = {
    vmoptions-patch = lib.mkOption { type = lib.types.lines; };
    goland = lib.mkOption { type = lib.types.package; };
    clion = lib.mkOption { type = lib.types.package; };
    datagrip = lib.mkOption { type = lib.types.package; };
    pycharm = lib.mkOption { type = lib.types.package; };
    dataspell = lib.mkOption { type = lib.types.package; };
    webstorm = lib.mkOption { type = lib.types.package; };
    rustrover = lib.mkOption { type = lib.types.package; };
  };
}
