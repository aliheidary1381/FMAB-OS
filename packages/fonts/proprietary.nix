{ pkgs }:
pkgs.stdenv.mkDerivation {
  pname = "alis-fonts";
  version = "1";
  src = ../../proprietary/fonts;
  installPhase = ''
    install -Dm644 IranSansX3/desktop/otf/IRANSansXV.otf $out/share/fonts/opentype/iransans.ttf
    install -Dm644 IranSansX3/desktop/otf/IRANSansX-Black.otf $out/share/fonts/opentype/iransans-black.ttf
    install -Dm644 IranSansX3/desktop/otf/IRANSansX-Bold.otf $out/share/fonts/opentype/iransans-bold.ttf
    install -Dm644 IranSansX3/desktop/otf/IRANSansX-DemiBold.otf $out/share/fonts/opentype/iransans-demibold.ttf
    install -Dm644 IranSansX3/desktop/otf/IRANSansX-ExtraBlack.otf $out/share/fonts/opentype/iransans-extrablack.ttf
    install -Dm644 IranSansX3/desktop/otf/IRANSansX-ExtraBold.otf $out/share/fonts/opentype/iransans-extrabold.ttf
    install -Dm644 IranSansX3/desktop/otf/IRANSansX-Heavy.otf $out/share/fonts/opentype/iransans-heavy.ttf
    install -Dm644 IranSansX3/desktop/otf/IRANSansX-Light.otf $out/share/fonts/opentype/iransans-light.ttf
    install -Dm644 IranSansX3/desktop/otf/IRANSansX-Medium.otf $out/share/fonts/opentype/iransans-medium.ttf
    install -Dm644 IranSansX3/desktop/otf/IRANSansX-Regular.otf $out/share/fonts/opentype/iransans-regular.ttf
    install -Dm644 IranSansX3/desktop/otf/IRANSansX-Thin.otf $out/share/fonts/opentype/iransans-thin.ttf
    install -Dm644 IranSansX3/desktop/otf/IRANSansX-UltraLight.otf $out/share/fonts/opentype/iransans-ultralight.ttf
    install -Dm644 Parastoo/static/Parastoo-Bold.ttf $out/share/fonts/truetype/parastoo-bold.ttf
    install -Dm644 Parastoo/static/Parastoo-Medium.ttf $out/share/fonts/truetype/parastoo-medium.ttf
    install -Dm644 Parastoo/static/Parastoo-Regular.ttf $out/share/fonts/truetype/parastoo-regular.ttf
    install -Dm644 Parastoo/static/Parastoo-SemiBold.ttf $out/share/fonts/truetype/parastoo-semibold.ttf
    install -Dm644 LostLand/Lost-Land.ttf $out/share/fonts/truetype/lost-land.ttf
  ''; # TODO: add azarmehr, hafez, bonyadekoodak, ahang, gramophone, kahroba
  meta = {
    description = "My personal set of unfree fonts.";
    license = pkgs.lib.licenses.unfree;
    platforms = pkgs.lib.platforms.all;
  };
}
