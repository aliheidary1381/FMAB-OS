{
  lib,
  pkgs,
  ...
}:
let
  fonts = import ./fonts/all.nix { inherit pkgs; };
  fmab-customizations = import ./fmab.nix { inherit pkgs; };
  lyrics-finder = import ./lyricsfinder.nix { inherit pkgs; };
  dvdae = import ./dvdae.nix { inherit pkgs; };
  flacon = import ./flacon.nix { inherit pkgs; };
  tabby-terminal = import ./tabby-terminal.nix { inherit pkgs; };
  devenvs = import ./dev-envs.nix { inherit pkgs; };
in
{
  config = {
    ali.fonts.my-fonts = fonts.my-fonts;
    ali.fonts.parastoo = fonts.parastoo;
    ali.fonts.estedad = fonts.estedad;
    ali.fonts.estedad-mad = fonts.estedad-mad;
    ali.fonts.gandom = fonts.gandom;
    ali.fonts.sahel = fonts.sahel;
    ali.fonts.lalezar = fonts.lalezar;
    ali.packages.fmab-customizations = fmab-customizations;
    ali.packages.lyrics-finder = lyrics-finder;
    ali.packages.dvdae = dvdae.dvd-audio-extractor;
    ali.security.dvdae = dvdae.wrapper.security.wrappers;
    ali.packages.flacon = flacon;
    ali.packages.tabby-terminal = tabby-terminal;
    ali.packages.python = devenvs.python;
    ali.packages.pythonForJupyter = devenvs.pythonForJupyter;
    ali.packages.R = devenvs.R;
  };

  options.ali = {
    fonts.my-fonts = lib.mkOption { type = lib.types.package; };
    fonts.parastoo = lib.mkOption { type = lib.types.package; };
    fonts.estedad = lib.mkOption { type = lib.types.package; };
    fonts.estedad-mad = lib.mkOption { type = lib.types.package; };
    fonts.gandom = lib.mkOption { type = lib.types.package; };
    fonts.sahel = lib.mkOption { type = lib.types.package; };
    fonts.lalezar = lib.mkOption { type = lib.types.package; };
    packages.fmab-customizations = lib.mkOption { type = lib.types.package; };
    packages.lyrics-finder = lib.mkOption { type = lib.types.package; };
    packages.dvdae = lib.mkOption { type = lib.types.package; };
    packages.flacon = lib.mkOption { type = lib.types.package; };
    security.dvdae = lib.mkOption { type = lib.types.attrs; };
    packages.tabby-terminal = lib.mkOption { type = lib.types.package; };
    packages.python = lib.mkOption { type = lib.types.package; };
    packages.pythonForJupyter = lib.mkOption { type = lib.types.package; };
    packages.R = lib.mkOption { type = lib.types.package; };
  };
}
