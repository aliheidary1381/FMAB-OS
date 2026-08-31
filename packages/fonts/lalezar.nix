{ pkgs }:
pkgs.stdenv.mkDerivation {
  pname = "lalezar-fonts";
  version = "1.004";

  src = pkgs.fetchFromGitHub {
    owner = "BornaIz";
    repo = "Lalezar";
    rev = "master";
    hash = "sha256-95z58ABTx53aREXRpj9xgclX9kuGiQiiKBwqwnF6f8g=";
  };

  nativeBuildInputs = [ pkgs.installFonts ];
  dontInstallWebfonts = true;

  meta = {
    description = "A multi-script display typeface for popular culture";
    homepage = "https://github.com/BornaIz/Lalezar";
    license = pkgs.lib.licenses.ofl;
    platforms = pkgs.lib.platforms.all;
  };
}
