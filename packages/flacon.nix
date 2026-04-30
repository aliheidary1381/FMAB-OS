{ pkgs, ... }:

pkgs.stdenv.mkDerivation rec {
  pname = "flacon";
  version = "12.0.0";

  src = pkgs.fetchurl {
    url = "https://download.opensuse.org/repositories/home:/Sokoloff/Debian_13/amd64/${pname}_${version}-1_amd64.deb";
    hash = "sha256-PYH9pBO8+YFpu8aph9wHr/sYfGWyIczd4zwM8LcGjgo=";
  };

  nativeBuildInputs = with pkgs; [
    dpkg
    autoPatchelfHook
    qt5.wrapQtAppsHook
  ];

  buildInputs = with pkgs; [
    qt5.qtbase
    qt5.qtwayland
    libuchardet
    taglib
    stdenv.cc.cc.lib
    glibc
  ];

  # List all the runtime executables Flacon needs on its PATH.
  # The 'lib.getBin' helper gets the path to the package's 'out' output,
  # which contains the 'bin' directory.
  runtimeExecutables = with pkgs; [
    faac
    flac
    lame
    monkeysAudio
    vorbis-tools
    opus-tools
    sox
    ttaenc
    wavpack
    vorbisgain
    mp3gain
  ];

  unpackPhase = ''
    runHook preUnpack
    dpkg-deb -x $src .
    runHook postUnpack
  '';

  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin
    cp -r usr/bin/flacon $out/bin/flacon
    cp -r usr/share $out
    runHook postInstall
  '';

  # Use qtWrapperArgs to modify the wrapper script that wrapQtAppsHook creates.
  # We construct a new PATH that includes our runtime dependencies.
  qtWrapperArgs = [
    ''--prefix PATH : ${pkgs.lib.makeBinPath runtimeExecutables}''
  ];

  meta = with pkgs.lib; {
    description = "Audio file splitter and converter that extracts individual tracks from one big audio file containing the entire album";
    longDescription = ''
      Flacon extracts individual tracks from one big audio file containing the
      entire album of music and saves them as separate audio files. To do this,
      it uses information from the appropriate CUE file. Besides, Flacon makes
      it possible to conveniently revise or specify tags both for all tracks
      at once or for each tag separately.

      Supported input formats: WAV, FLAC, APE, WavPack, True Audio (TTA)
      Supported output formats: FLAC, WAV, WavPack, AAC, OGG or MP3
    '';
    homepage = "https://github.com/flacon/flacon";
    license = licenses.lgpl3Plus;
    maintainers = [ maintainers.unlisted ];
    platforms = platforms.linux;
    mainProgram = "flacon";
  };
}
