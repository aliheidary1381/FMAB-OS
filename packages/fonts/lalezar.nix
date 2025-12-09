{ pkgs }:
pkgs.stdenv.mkDerivation {
  pname = "lalezar-fonts";
  version = "unstable-2025-11-13";

  src = pkgs.fetchFromGitHub {
    owner = "BornaIz";
    repo = "Lalezar";
    rev = "master";
    hash = "sha256-95z58ABTx53aREXRpj9xgclX9kuGiQiiKBwqwnF6f8g=";
  };

  installPhase = ''
    install -Dm644 fonts/Lalezar-Regular.otf $out/share/fonts/opentype/lalezar.otf
  '';

  meta = {
    description = "A multi-script display typeface for popular culture";
    homepage = "https://github.com/BornaIz/Lalezar";
    license = pkgs.lib.licenses.ofl;
    platforms = pkgs.lib.platforms.all;
  };
}
