{ pkgs }:
pkgs.stdenv.mkDerivation {
  pname = "gandom-fonts";
  version = "0.8";

  src = pkgs.fetchFromGitHub {
    owner = "rastikerdar";
    repo = "gandom-font";
    rev = "master";
    hash = "sha256-d1pEVQd1iGBD3pQqjyYlI9+JNEHrLUpM2NtxUxTBR8w=";
  };

  nativeBuildInputs = [ pkgs.installFonts ];
  dontInstallWebfonts = true;

  meta = with pkgs.lib; {
    description = "A Persian (farsi) Font";
    homepage = "https://github.com/rastikerdar/gandom-font";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
