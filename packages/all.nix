{
  lib,
  pkgs,
  config,
  ...
}:
let
  fonts = import ./fonts/all.nix { inherit pkgs; };
  fmab-customizations = import ./fmab.nix { inherit pkgs; };
  dvdae = import ./dvdae.nix { inherit pkgs; };
  tabby-terminal = import ./tabby-terminal.nix { inherit pkgs; };
  varia = import ./varia.nix { inherit pkgs; };
  antigravity-acp = import ./antigravity-acp.nix { inherit pkgs; };
  devenvs = import ./dev-envs.nix { inherit pkgs config; };
  pylsp-mypy = import ./pylsp-mypy.nix { inherit pkgs; };
  pythonForJupyter = devenvs.pythonForJupyter;
  R = devenvs.R;
  julia = devenvs.julia;
  cantor = import ./cantor.nix { inherit pkgs pythonForJupyter R julia; };
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
    ali.packages.dvdae = dvdae.dvd-audio-extractor;
    ali.security.dvdae = dvdae.wrapper.security.wrappers;
    ali.packages.tabby-terminal = tabby-terminal;
    ali.packages.varia = varia;
    ali.packages.antigravity-acp = antigravity-acp;
    ali.packages.pylsp-mypy = pylsp-mypy;
    ali.packages.cantor = cantor;
    ali.packages.python = devenvs.python;
    ali.packages.pythonForJupyter = devenvs.pythonForJupyter;
    ali.packages.extraJupyterKernels = devenvs.extraJupyterKernels;
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
    packages.dvdae = lib.mkOption { type = lib.types.package; };
    security.dvdae = lib.mkOption { type = lib.types.attrs; };
    packages.tabby-terminal = lib.mkOption { type = lib.types.package; };
    packages.varia = lib.mkOption { type = lib.types.package; };
    packages.antigravity-acp = lib.mkOption { type = lib.types.package; };
    packages.cantor = lib.mkOption { type = lib.types.package; };
    packages.python = lib.mkOption { type = lib.types.package; };
    packages.pylsp-mypy = lib.mkOption { type = lib.types.package; };
    packages.pythonForJupyter = lib.mkOption { type = lib.types.package; };
    packages.extraJupyterKernels = lib.mkOption { type = lib.types.package; };
    packages.R = lib.mkOption { type = lib.types.package; };
  };
}
