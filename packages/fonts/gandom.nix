{ pkgs }:
pkgs.stdenv.mkDerivation rec {
  pname = "gandom-fonts";
  version = "0.8";

  src = pkgs.fetchzip {
    url = "https://github.com/rastikerdar/gandom-font/releases/download/v${version}/gandom-font-v${version}.zip";
    hash = "sha256-5Ck2oWW2o0F1Pt5Y66syGx7dfMMe3uWc6X4xvyLVa7c=";
    stripRoot = false;
  };

  installPhase = ''
    install -Dm644 Without-Latin/Gandom-WOL.ttf $out/share/fonts/truetype/gandom.ttf
  '';

  meta = with pkgs.lib; {
    description = "A Persian (farsi) Font";
    homepage = "https://github.com/rastikerdar/gandom-font";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
