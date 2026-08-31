{ pkgs }:
pkgs.stdenv.mkDerivation {
  pname = "estedad-font";
  version = "8.6";

  src = pkgs.fetchFromGitHub {
    owner = "aminabedi68";
    repo = "Estedad";
    rev = "master";
    hash = "sha256-Tjcwmf/SLhjjX2Rb8IPa//hz1rTCR0ihL0GRJLgaVkY=";
  };

  nativeBuildInputs = [ pkgs.installFonts ];
  dontInstallWebfonts = true;

  meta = with pkgs.lib; {
    description = "Sans Serif Arabic-Latin text typeface.";
    homepage = "https://github.com/aminabedi68/Estedad";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
