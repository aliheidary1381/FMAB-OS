{ pkgs }:
pkgs.stdenv.mkDerivation rec {
  pname = "sahel-fonts";
  version = "3.4.0";

  src = pkgs.fetchzip {
    url = "https://github.com/rastikerdar/sahel-font/releases/download/v${version}/sahel-font-v${version}.zip";
    hash = "sha256-ygAHLKuH9NlZGA+mzfs6s6SSENv06E7einD3IOeGGZc=";
    stripRoot = false;
  };

  installPhase = ''
    install -Dm644 Sahel-VF.ttf $out/share/fonts/truetype/sahel.ttf
    install -Dm644 Without-Latin/Sahel-Black-WOL.ttf $out/share/fonts/truetype/sahel-black.ttf
    install -Dm644 Without-Latin/Sahel-Bold-WOL.ttf $out/share/fonts/truetype/sahel-bold.ttf
    install -Dm644 Without-Latin/Sahel-Light-WOL.ttf $out/share/fonts/truetype/sahel-light.ttf
    install -Dm644 Without-Latin/Sahel-SemiBold-WOL.ttf $out/share/fonts/truetype/sahel-semibold.ttf
    install -Dm644 Without-Latin/Sahel-WOL.ttf $out/share/fonts/truetype/sahel-regular.ttf
  '';

  meta = with pkgs.lib; {
    description = "Persian (farsi) Font";
    homepage = "https://github.com/rastikerdar/sahel-font";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
