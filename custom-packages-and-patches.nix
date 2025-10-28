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
    mkdir -p $out/share/icons
    cp -Lr ${pkgs.kdePackages.breeze-icons}/share/icons/breeze $out/share/icons/fmab
    cp -Lr ${pkgs.kdePackages.breeze-icons}/share/icons/breeze-dark $out/share/icons/fmab-dark
    chmod 644 $out/share/icons/fmab/apps/22/plasma-symbolic.svg
    chmod 644 $out/share/icons/fmab/apps/22@2x/plasma-symbolic.svg
    chmod 644 $out/share/icons/fmab/apps/22@3x/plasma-symbolic.svg
    chmod 644 $out/share/icons/fmab/apps/24/plasma-symbolic.svg
    chmod 644 $out/share/icons/fmab/apps/24@2x/plasma-symbolic.svg
    chmod 644 $out/share/icons/fmab/apps/24@3x/plasma-symbolic.svg
    chmod 644 $out/share/icons/fmab/places/16/start-here-kde.svg
    chmod 644 $out/share/icons/fmab/places/16/start-here-kde-plasma.svg
    chmod 644 $out/share/icons/fmab/places/16/start-here-kde-plasma-symbolic.svg
    chmod 644 $out/share/icons/fmab/places/16/start-here-kde-symbolic.svg
    chmod 644 $out/share/icons/fmab/places/16/start-here-symbolic.svg
    chmod 644 $out/share/icons/fmab/places/16@2x/start-here-kde.svg
    chmod 644 $out/share/icons/fmab/places/16@2x/start-here-kde-plasma.svg
    chmod 644 $out/share/icons/fmab/places/16@2x/start-here-kde-plasma-symbolic.svg
    chmod 644 $out/share/icons/fmab/places/16@2x/start-here-kde-symbolic.svg
    chmod 644 $out/share/icons/fmab/places/16@2x/start-here-symbolic.svg
    chmod 644 $out/share/icons/fmab/places/16@3x/start-here-kde.svg
    chmod 644 $out/share/icons/fmab/places/16@3x/start-here-kde-plasma.svg
    chmod 644 $out/share/icons/fmab/places/16@3x/start-here-kde-plasma-symbolic.svg
    chmod 644 $out/share/icons/fmab/places/16@3x/start-here-kde-symbolic.svg
    chmod 644 $out/share/icons/fmab/places/16@3x/start-here-symbolic.svg
    chmod 644 $out/share/icons/fmab/places/22/start-here-kde.svg
    chmod 644 $out/share/icons/fmab/places/22/start-here-kde-plasma.svg
    chmod 644 $out/share/icons/fmab/places/22/start-here-kde-plasma-symbolic.svg
    chmod 644 $out/share/icons/fmab/places/22/start-here-kde-symbolic.svg
    chmod 644 $out/share/icons/fmab/places/22@2x/start-here-kde.svg
    chmod 644 $out/share/icons/fmab/places/22@2x/start-here-kde-plasma.svg
    chmod 644 $out/share/icons/fmab/places/22@2x/start-here-kde-plasma-symbolic.svg
    chmod 644 $out/share/icons/fmab/places/22@2x/start-here-kde-symbolic.svg
    chmod 644 $out/share/icons/fmab/places/22@3x/start-here-kde.svg
    chmod 644 $out/share/icons/fmab/places/22@3x/start-here-kde-plasma.svg
    chmod 644 $out/share/icons/fmab/places/22@3x/start-here-kde-plasma-symbolic.svg
    chmod 644 $out/share/icons/fmab/places/22@3x/start-here-kde-symbolic.svg
    chmod 644 $out/share/icons/fmab/places/24/start-here-kde.svg
    chmod 644 $out/share/icons/fmab/places/24/start-here-kde-plasma.svg
    chmod 644 $out/share/icons/fmab/places/24/start-here-kde-plasma-symbolic.svg
    chmod 644 $out/share/icons/fmab/places/24/start-here-kde-symbolic.svg
    chmod 644 $out/share/icons/fmab/places/24@2x/start-here-kde.svg
    chmod 644 $out/share/icons/fmab/places/24@2x/start-here-kde-plasma.svg
    chmod 644 $out/share/icons/fmab/places/24@2x/start-here-kde-plasma-symbolic.svg
    chmod 644 $out/share/icons/fmab/places/24@2x/start-here-kde-symbolic.svg
    chmod 644 $out/share/icons/fmab/places/24@3x/start-here-kde.svg
    chmod 644 $out/share/icons/fmab/places/24@3x/start-here-kde-plasma.svg
    chmod 644 $out/share/icons/fmab/places/24@3x/start-here-kde-plasma-symbolic.svg
    chmod 644 $out/share/icons/fmab/places/24@3x/start-here-kde-symbolic.svg
    chmod 644 $out/share/icons/fmab/places/32/start-here-kde.svg
    chmod 644 $out/share/icons/fmab/places/64/start-here-kde.svg
    chmod 644 $out/share/icons/fmab/places/64/start-here-kde-plasma.svg
    chmod 644 $out/share/icons/fmab/places/96/start-here-kde.svg
    chmod 644 $out/share/icons/fmab/places/96/start-here-kde-plasma.svg
    chmod 644 $out/share/icons/fmab-dark/apps/22/plasma-symbolic.svg
    chmod 644 $out/share/icons/fmab-dark/apps/22@2x/plasma-symbolic.svg
    chmod 644 $out/share/icons/fmab-dark/apps/22@3x/plasma-symbolic.svg
    chmod 644 $out/share/icons/fmab-dark/apps/24/plasma-symbolic.svg
    chmod 644 $out/share/icons/fmab-dark/apps/24@2x/plasma-symbolic.svg
    chmod 644 $out/share/icons/fmab-dark/apps/24@3x/plasma-symbolic.svg
    chmod 644 $out/share/icons/fmab-dark/places/16/start-here-kde.svg
    chmod 644 $out/share/icons/fmab-dark/places/16/start-here-kde-plasma.svg
    chmod 644 $out/share/icons/fmab-dark/places/16/start-here-kde-plasma-symbolic.svg
    chmod 644 $out/share/icons/fmab-dark/places/16/start-here-kde-symbolic.svg
    chmod 644 $out/share/icons/fmab-dark/places/16/start-here-symbolic.svg
    chmod 644 $out/share/icons/fmab-dark/places/16@2x/start-here-kde.svg
    chmod 644 $out/share/icons/fmab-dark/places/16@2x/start-here-kde-plasma.svg
    chmod 644 $out/share/icons/fmab-dark/places/16@2x/start-here-kde-plasma-symbolic.svg
    chmod 644 $out/share/icons/fmab-dark/places/16@2x/start-here-kde-symbolic.svg
    chmod 644 $out/share/icons/fmab-dark/places/16@2x/start-here-symbolic.svg
    chmod 644 $out/share/icons/fmab-dark/places/16@3x/start-here-kde.svg
    chmod 644 $out/share/icons/fmab-dark/places/16@3x/start-here-kde-plasma.svg
    chmod 644 $out/share/icons/fmab-dark/places/16@3x/start-here-kde-plasma-symbolic.svg
    chmod 644 $out/share/icons/fmab-dark/places/16@3x/start-here-kde-symbolic.svg
    chmod 644 $out/share/icons/fmab-dark/places/16@3x/start-here-symbolic.svg
    chmod 644 $out/share/icons/fmab-dark/places/22/start-here-kde.svg
    chmod 644 $out/share/icons/fmab-dark/places/22/start-here-kde-plasma.svg
    chmod 644 $out/share/icons/fmab-dark/places/22/start-here-kde-plasma-symbolic.svg
    chmod 644 $out/share/icons/fmab-dark/places/22/start-here-kde-symbolic.svg
    chmod 644 $out/share/icons/fmab-dark/places/22@2x/start-here-kde.svg
    chmod 644 $out/share/icons/fmab-dark/places/22@2x/start-here-kde-plasma.svg
    chmod 644 $out/share/icons/fmab-dark/places/22@2x/start-here-kde-plasma-symbolic.svg
    chmod 644 $out/share/icons/fmab-dark/places/22@2x/start-here-kde-symbolic.svg
    chmod 644 $out/share/icons/fmab-dark/places/22@3x/start-here-kde.svg
    chmod 644 $out/share/icons/fmab-dark/places/22@3x/start-here-kde-plasma.svg
    chmod 644 $out/share/icons/fmab-dark/places/22@3x/start-here-kde-plasma-symbolic.svg
    chmod 644 $out/share/icons/fmab-dark/places/22@3x/start-here-kde-symbolic.svg
    chmod 644 $out/share/icons/fmab-dark/places/24/start-here-kde.svg
    chmod 644 $out/share/icons/fmab-dark/places/24/start-here-kde-plasma.svg
    chmod 644 $out/share/icons/fmab-dark/places/24/start-here-kde-plasma-symbolic.svg
    chmod 644 $out/share/icons/fmab-dark/places/24/start-here-kde-symbolic.svg
    chmod 644 $out/share/icons/fmab-dark/places/24@2x/start-here-kde.svg
    chmod 644 $out/share/icons/fmab-dark/places/24@2x/start-here-kde-plasma.svg
    chmod 644 $out/share/icons/fmab-dark/places/24@2x/start-here-kde-plasma-symbolic.svg
    chmod 644 $out/share/icons/fmab-dark/places/24@2x/start-here-kde-symbolic.svg
    chmod 644 $out/share/icons/fmab-dark/places/24@3x/start-here-kde.svg
    chmod 644 $out/share/icons/fmab-dark/places/24@3x/start-here-kde-plasma.svg
    chmod 644 $out/share/icons/fmab-dark/places/24@3x/start-here-kde-plasma-symbolic.svg
    chmod 644 $out/share/icons/fmab-dark/places/24@3x/start-here-kde-symbolic.svg
    chmod 644 $out/share/icons/fmab-dark/places/32/start-here-kde.svg
    chmod 644 $out/share/icons/fmab-dark/places/64/start-here-kde.svg
    chmod 644 $out/share/icons/fmab-dark/places/64/start-here-kde-plasma.svg
    chmod 644 $out/share/icons/fmab-dark/places/96/start-here-kde.svg
    chmod 644 $out/share/icons/fmab-dark/places/96/start-here-kde-plasma.svg
    cp ${./fmab/icons/light.svg} $out/share/icons/fmab/apps/22/plasma-symbolic.svg
    cp ${./fmab/icons/light.svg} $out/share/icons/fmab/apps/22@2x/plasma-symbolic.svg
    cp ${./fmab/icons/light.svg} $out/share/icons/fmab/apps/22@3x/plasma-symbolic.svg
    cp ${./fmab/icons/light.svg} $out/share/icons/fmab/apps/24/plasma-symbolic.svg
    cp ${./fmab/icons/light.svg} $out/share/icons/fmab/apps/24@2x/plasma-symbolic.svg
    cp ${./fmab/icons/light.svg} $out/share/icons/fmab/apps/24@3x/plasma-symbolic.svg
    cp ${./fmab/icons/light.svg} $out/share/icons/fmab/places/16/start-here-kde.svg
    cp ${./fmab/icons/light.svg} $out/share/icons/fmab/places/16/start-here-kde-plasma.svg
    cp ${./fmab/icons/light.svg} $out/share/icons/fmab/places/16/start-here-kde-plasma-symbolic.svg
    cp ${./fmab/icons/light.svg} $out/share/icons/fmab/places/16/start-here-kde-symbolic.svg
    cp ${./fmab/icons/light.svg} $out/share/icons/fmab/places/16/start-here-symbolic.svg
    cp ${./fmab/icons/light.svg} $out/share/icons/fmab/places/16@2x/start-here-kde.svg
    cp ${./fmab/icons/light.svg} $out/share/icons/fmab/places/16@2x/start-here-kde-plasma.svg
    cp ${./fmab/icons/light.svg} $out/share/icons/fmab/places/16@2x/start-here-kde-plasma-symbolic.svg
    cp ${./fmab/icons/light.svg} $out/share/icons/fmab/places/16@2x/start-here-kde-symbolic.svg
    cp ${./fmab/icons/light.svg} $out/share/icons/fmab/places/16@2x/start-here-symbolic.svg
    cp ${./fmab/icons/light.svg} $out/share/icons/fmab/places/16@3x/start-here-kde.svg
    cp ${./fmab/icons/light.svg} $out/share/icons/fmab/places/16@3x/start-here-kde-plasma.svg
    cp ${./fmab/icons/light.svg} $out/share/icons/fmab/places/16@3x/start-here-kde-plasma-symbolic.svg
    cp ${./fmab/icons/light.svg} $out/share/icons/fmab/places/16@3x/start-here-kde-symbolic.svg
    cp ${./fmab/icons/light.svg} $out/share/icons/fmab/places/16@3x/start-here-symbolic.svg
    cp ${./fmab/icons/light.svg} $out/share/icons/fmab/places/22/start-here-kde.svg
    cp ${./fmab/icons/light.svg} $out/share/icons/fmab/places/22/start-here-kde-plasma.svg
    cp ${./fmab/icons/light.svg} $out/share/icons/fmab/places/22/start-here-kde-plasma-symbolic.svg
    cp ${./fmab/icons/light.svg} $out/share/icons/fmab/places/22/start-here-kde-symbolic.svg
    cp ${./fmab/icons/light.svg} $out/share/icons/fmab/places/22@2x/start-here-kde.svg
    cp ${./fmab/icons/light.svg} $out/share/icons/fmab/places/22@2x/start-here-kde-plasma.svg
    cp ${./fmab/icons/light.svg} $out/share/icons/fmab/places/22@2x/start-here-kde-plasma-symbolic.svg
    cp ${./fmab/icons/light.svg} $out/share/icons/fmab/places/22@2x/start-here-kde-symbolic.svg
    cp ${./fmab/icons/light.svg} $out/share/icons/fmab/places/22@3x/start-here-kde.svg
    cp ${./fmab/icons/light.svg} $out/share/icons/fmab/places/22@3x/start-here-kde-plasma.svg
    cp ${./fmab/icons/light.svg} $out/share/icons/fmab/places/22@3x/start-here-kde-plasma-symbolic.svg
    cp ${./fmab/icons/light.svg} $out/share/icons/fmab/places/22@3x/start-here-kde-symbolic.svg
    cp ${./fmab/icons/light.svg} $out/share/icons/fmab/places/24/start-here-kde.svg
    cp ${./fmab/icons/light.svg} $out/share/icons/fmab/places/24/start-here-kde-plasma.svg
    cp ${./fmab/icons/light.svg} $out/share/icons/fmab/places/24/start-here-kde-plasma-symbolic.svg
    cp ${./fmab/icons/light.svg} $out/share/icons/fmab/places/24/start-here-kde-symbolic.svg
    cp ${./fmab/icons/light.svg} $out/share/icons/fmab/places/24@2x/start-here-kde.svg
    cp ${./fmab/icons/light.svg} $out/share/icons/fmab/places/24@2x/start-here-kde-plasma.svg
    cp ${./fmab/icons/light.svg} $out/share/icons/fmab/places/24@2x/start-here-kde-plasma-symbolic.svg
    cp ${./fmab/icons/light.svg} $out/share/icons/fmab/places/24@2x/start-here-kde-symbolic.svg
    cp ${./fmab/icons/light.svg} $out/share/icons/fmab/places/24@3x/start-here-kde.svg
    cp ${./fmab/icons/light.svg} $out/share/icons/fmab/places/24@3x/start-here-kde-plasma.svg
    cp ${./fmab/icons/light.svg} $out/share/icons/fmab/places/24@3x/start-here-kde-plasma-symbolic.svg
    cp ${./fmab/icons/light.svg} $out/share/icons/fmab/places/24@3x/start-here-kde-symbolic.svg
    cp ${./fmab/icons/light.svg} $out/share/icons/fmab/places/32/start-here-kde.svg
    cp ${./fmab/icons/light.svg} $out/share/icons/fmab/places/64/start-here-kde.svg
    cp ${./fmab/icons/light.svg} $out/share/icons/fmab/places/64/start-here-kde-plasma.svg
    cp ${./fmab/icons/light.svg} $out/share/icons/fmab/places/96/start-here-kde.svg
    cp ${./fmab/icons/light.svg} $out/share/icons/fmab/places/96/start-here-kde-plasma.svg
    cp ${./fmab/icons/dark.svg} $out/share/icons/fmab-dark/apps/22/plasma-symbolic.svg
    cp ${./fmab/icons/dark.svg} $out/share/icons/fmab-dark/apps/22@2x/plasma-symbolic.svg
    cp ${./fmab/icons/dark.svg} $out/share/icons/fmab-dark/apps/22@3x/plasma-symbolic.svg
    cp ${./fmab/icons/dark.svg} $out/share/icons/fmab-dark/apps/24/plasma-symbolic.svg
    cp ${./fmab/icons/dark.svg} $out/share/icons/fmab-dark/apps/24@2x/plasma-symbolic.svg
    cp ${./fmab/icons/dark.svg} $out/share/icons/fmab-dark/apps/24@3x/plasma-symbolic.svg
    cp ${./fmab/icons/dark.svg} $out/share/icons/fmab-dark/places/16/start-here-kde.svg
    cp ${./fmab/icons/dark.svg} $out/share/icons/fmab-dark/places/16/start-here-kde-plasma.svg
    cp ${./fmab/icons/dark.svg} $out/share/icons/fmab-dark/places/16/start-here-kde-plasma-symbolic.svg
    cp ${./fmab/icons/dark.svg} $out/share/icons/fmab-dark/places/16/start-here-kde-symbolic.svg
    cp ${./fmab/icons/dark.svg} $out/share/icons/fmab-dark/places/16/start-here-symbolic.svg
    cp ${./fmab/icons/dark.svg} $out/share/icons/fmab-dark/places/16@2x/start-here-kde.svg
    cp ${./fmab/icons/dark.svg} $out/share/icons/fmab-dark/places/16@2x/start-here-kde-plasma.svg
    cp ${./fmab/icons/dark.svg} $out/share/icons/fmab-dark/places/16@2x/start-here-kde-plasma-symbolic.svg
    cp ${./fmab/icons/dark.svg} $out/share/icons/fmab-dark/places/16@2x/start-here-kde-symbolic.svg
    cp ${./fmab/icons/dark.svg} $out/share/icons/fmab-dark/places/16@2x/start-here-symbolic.svg
    cp ${./fmab/icons/dark.svg} $out/share/icons/fmab-dark/places/16@3x/start-here-kde.svg
    cp ${./fmab/icons/dark.svg} $out/share/icons/fmab-dark/places/16@3x/start-here-kde-plasma.svg
    cp ${./fmab/icons/dark.svg} $out/share/icons/fmab-dark/places/16@3x/start-here-kde-plasma-symbolic.svg
    cp ${./fmab/icons/dark.svg} $out/share/icons/fmab-dark/places/16@3x/start-here-kde-symbolic.svg
    cp ${./fmab/icons/dark.svg} $out/share/icons/fmab-dark/places/16@3x/start-here-symbolic.svg
    cp ${./fmab/icons/dark.svg} $out/share/icons/fmab-dark/places/22/start-here-kde.svg
    cp ${./fmab/icons/dark.svg} $out/share/icons/fmab-dark/places/22/start-here-kde-plasma.svg
    cp ${./fmab/icons/dark.svg} $out/share/icons/fmab-dark/places/22/start-here-kde-plasma-symbolic.svg
    cp ${./fmab/icons/dark.svg} $out/share/icons/fmab-dark/places/22/start-here-kde-symbolic.svg
    cp ${./fmab/icons/dark.svg} $out/share/icons/fmab-dark/places/22@2x/start-here-kde.svg
    cp ${./fmab/icons/dark.svg} $out/share/icons/fmab-dark/places/22@2x/start-here-kde-plasma.svg
    cp ${./fmab/icons/dark.svg} $out/share/icons/fmab-dark/places/22@2x/start-here-kde-plasma-symbolic.svg
    cp ${./fmab/icons/dark.svg} $out/share/icons/fmab-dark/places/22@2x/start-here-kde-symbolic.svg
    cp ${./fmab/icons/dark.svg} $out/share/icons/fmab-dark/places/22@3x/start-here-kde.svg
    cp ${./fmab/icons/dark.svg} $out/share/icons/fmab-dark/places/22@3x/start-here-kde-plasma.svg
    cp ${./fmab/icons/dark.svg} $out/share/icons/fmab-dark/places/22@3x/start-here-kde-plasma-symbolic.svg
    cp ${./fmab/icons/dark.svg} $out/share/icons/fmab-dark/places/22@3x/start-here-kde-symbolic.svg
    cp ${./fmab/icons/dark.svg} $out/share/icons/fmab-dark/places/24/start-here-kde.svg
    cp ${./fmab/icons/dark.svg} $out/share/icons/fmab-dark/places/24/start-here-kde-plasma.svg
    cp ${./fmab/icons/dark.svg} $out/share/icons/fmab-dark/places/24/start-here-kde-plasma-symbolic.svg
    cp ${./fmab/icons/dark.svg} $out/share/icons/fmab-dark/places/24/start-here-kde-symbolic.svg
    cp ${./fmab/icons/dark.svg} $out/share/icons/fmab-dark/places/24@2x/start-here-kde.svg
    cp ${./fmab/icons/dark.svg} $out/share/icons/fmab-dark/places/24@2x/start-here-kde-plasma.svg
    cp ${./fmab/icons/dark.svg} $out/share/icons/fmab-dark/places/24@2x/start-here-kde-plasma-symbolic.svg
    cp ${./fmab/icons/dark.svg} $out/share/icons/fmab-dark/places/24@2x/start-here-kde-symbolic.svg
    cp ${./fmab/icons/dark.svg} $out/share/icons/fmab-dark/places/24@3x/start-here-kde.svg
    cp ${./fmab/icons/dark.svg} $out/share/icons/fmab-dark/places/24@3x/start-here-kde-plasma.svg
    cp ${./fmab/icons/dark.svg} $out/share/icons/fmab-dark/places/24@3x/start-here-kde-plasma-symbolic.svg
    cp ${./fmab/icons/dark.svg} $out/share/icons/fmab-dark/places/24@3x/start-here-kde-symbolic.svg
    cp ${./fmab/icons/dark.svg} $out/share/icons/fmab-dark/places/32/start-here-kde.svg
    cp ${./fmab/icons/dark.svg} $out/share/icons/fmab-dark/places/64/start-here-kde.svg
    cp ${./fmab/icons/dark.svg} $out/share/icons/fmab-dark/places/64/start-here-kde-plasma.svg
    cp ${./fmab/icons/dark.svg} $out/share/icons/fmab-dark/places/96/start-here-kde.svg
    cp ${./fmab/icons/dark.svg} $out/share/icons/fmab-dark/places/96/start-here-kde-plasma.svg
    cp -r ${./fmab}/* $out/share/
    chmod -R u+w $out/share
    sed -i "s|ImageDir=.*|ImageDir=$out/share/plymouth/themes/fmab|" $out/share/plymouth/themes/fmab/fmab.plymouth
    sed -i "s|ScriptFile=.*|ScriptFile=$out/share/plymouth/themes/fmab/fmab.script|" $out/share/plymouth/themes/fmab/fmab.plymouth
    sed -i "s|logo=.*|logo=$out/share/sddm/themes/fmab/default-logo.svg|" $out/share/sddm/themes/fmab/theme.conf
    sed -i "s|background=.*|logo=$out/share/wallpapers/fmab-lock/contents/images/1920x1080.png|" $out/share/sddm/themes/fmab/theme.conf
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
        ExecStart = "${pkgs.proxychains}/bin/proxychains4 ${pkgs.rtorrent}/bin/rtorrent -o network.scgi.open_local=/home/ali/rpc.socket,system.daemon.set=true,system.file.allocate.set=1";
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
    fonts.my-fonts = lib.mkOption { type = lib.types.package; };
    packages.fmab-customizations = lib.mkOption { type = lib.types.package; };
    packages.rtorrent = lib.mkOption { type = lib.types.package; };
    packages.lyrics-finder = lib.mkOption { type = lib.types.package; };
    packages.dvdae = lib.mkOption { type = lib.types.package; };
    jetbrains.vmoptions-patch = lib.mkOption { type = lib.types.lines; };
  };
}
