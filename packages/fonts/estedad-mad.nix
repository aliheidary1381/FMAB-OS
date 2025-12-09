{ pkgs }:
pkgs.stdenv.mkDerivation {
  pname = "estedad-mad-font";
  version = "1.1";

  src = pkgs.fetchFromGitHub {
    owner = "MohamadDarvishi";
    repo = "Estedad-Mad";
    rev = "master";
    hash = "sha256-xjgAfzDUY7wZxVVDj89+aS4R6oVTkDIpiAaVDDysuUE=";
  };

  installPhase = ''
    install -Dm644 Fonts/misc/Non-latin/Estedad-Mad-NL.ttf $out/share/fonts/truetype/estedad-mad.ttf
  '';

  meta = with pkgs.lib; {
    description = "An English-Arabic font.";
    homepage = "https://github.com/MohamadDarvishi/Estedad-Mad";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
