{ pkgs }:
pkgs.stdenv.mkDerivation {
  pname = "alis-fonts";
  version = "1";
  src = ../../proprietary/fonts;
  nativeBuildInputs = [ pkgs.installFonts ]; # to do: add azarmehr, hafez, bonyadekoodak, ahang, gramophone, kahroba
  dontInstallWebfonts = true;
  meta = {
    description = "My personal set of unfree fonts.";
    license = pkgs.lib.licenses.unfree;
    platforms = pkgs.lib.platforms.all;
  };
}
