{ pkgs }:
pkgs.stdenv.mkDerivation rec {
  pname = "estedad-font";
  version = "7.3";

  src = pkgs.fetchzip {
    url = "https://github.com/aminabedi68/Estedad/releases/download/${version}/Estedad-v${version}.zip";
    hash = "sha256-AHi60W1gGf0EvmamQt+VmPTTLE8dd0JQkE9CpKVOZR4=";
  };

  installPhase = ''
    install -Dm644 Variable/Estedad\[KSHD,wght\].ttf $out/share/fonts/truetype/estedad.ttf
    install -Dm644 ttf/Estedad-Black.ttf $out/share/fonts/truetype/estedad-black.ttf
    install -Dm644 ttf/Estedad-Bold.ttf $out/share/fonts/truetype/estedad-bold.ttf
    install -Dm644 ttf/Estedad-ExtraBold.ttf $out/share/fonts/truetype/estedad-extrabold.ttf
    install -Dm644 ttf/Estedad-ExtraLight.ttf $out/share/fonts/truetype/estedad-extralight.ttf
    install -Dm644 ttf/Estedad-Light.ttf $out/share/fonts/truetype/estedad-light.ttf
    install -Dm644 ttf/Estedad-Medium.ttf $out/share/fonts/truetype/estedad-medium.ttf
    install -Dm644 ttf/Estedad-Regular.ttf $out/share/fonts/truetype/estedad-regular.ttf
    install -Dm644 ttf/Estedad-SemiBold.ttf $out/share/fonts/truetype/estedad-semibold.ttf
    install -Dm644 ttf/Estedad-Thin.ttf $out/share/fonts/truetype/estedad-thin.ttf
  '';

  meta = with pkgs.lib; {
    description = "Sans Serif Arabic-Latin text typeface.";
    homepage = "https://github.com/aminabedi68/Estedad";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
