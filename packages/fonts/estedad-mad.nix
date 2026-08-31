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

  nativeBuildInputs = [ pkgs.installFonts ];
  dontInstallWebfonts = true;

  meta = with pkgs.lib; {
    description = "An English-Arabic font.";
    homepage = "https://github.com/MohamadDarvishi/Estedad-Mad";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
