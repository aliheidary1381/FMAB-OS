{ pkgs }:
pkgs.stdenv.mkDerivation {
  pname = "parastoo-font";
  version = "unstable-2025-11-13";

  src = pkgs.fetchFromGitHub {
    owner = "googlefonts";
    repo = "parastoo-font";
    rev = "master";
    hash = "sha256-4MgM9DWm2O4xEOMe3cIp56gFjJ7t+a3t9B65VKa9HlY=";
  };

  installPhase = ''
    install -Dm644 fonts/variable/Parastoo\[wght\].ttf $out/share/fonts/truetype/parastoo.ttf
  '';

  meta = {
    description = "Google Fonts fork of Parastoo, a Persian (Farsi) font by @rastikerdar.";
    homepage = "https://github.com/googlefonts/parastoo-font";
    license = pkgs.lib.licenses.ofl;
    platforms = pkgs.lib.platforms.all;
  };
}
