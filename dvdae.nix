{ pkgs }:
let
  version = "8.7.0";
  flacPkgs = import (builtins.fetchGit {
    name = "old-nixpkgs-with-flac-1.4";
    url = "https://github.com/NixOS/nixpkgs/";
    ref = "refs/heads/nixpkgs-unstable";
    rev = "c5dd43934613ae0f8ff37c59f61c507c2e8f980d";
  }) { };
  # If not working, clone (& checkout) manually and then replace with:
  # flacPkgs = import /home/ali/nixpkgs-with-old-flac { };
  libjpegPkgs = import (builtins.fetchGit {
    name = "old-nixpkgs-with-libjpeg-8";
    url = "https://github.com/NixOS/nixpkgs/";
    ref = "refs/heads/nixpkgs-unstable";
    rev = "59e940007106305c938332ef60962e672a4281f2";
  }) { };
  # If not working, clone (& checkout) manually and then replace with:
  # libjpegPkgs = import /home/ali/nixpkgs-with-old-jpeg { };
  dvd-audio-extractor = pkgs.stdenv.mkDerivation {
    pname = "dvd-audio-extractor";
    version = version;

    src = pkgs.fetchurl {
      url = "https://www.dvdae.com/dvdae/dvdae_8.7.0_amd64.deb";
      sha256 = "0945ps2312qiz3qb1arnkql6wnlzsiawgjzm1fahw0ppgn434b4p";
    };

    nativeBuildInputs = with pkgs; [
      autoPatchelfHook
      wrapGAppsHook3
      dpkg
    ];

    buildInputs = with pkgs; [
      libvorbis
      libogg
      libcap
      alsa-lib
      lame
      flacPkgs.flac
      xorg.libX11
      xorg.libSM
      libxkbcommon
      gtk3
      cairo
      gdk-pixbuf
      pango
      glib
      fontconfig
      expat
      pcre2
      libpng
      libjpegPkgs.libjpeg_original
      zlib
      curl
      stdenv.cc.cc.lib
    ];

    unpackPhase = ''
      dpkg-deb -x $src unpacked
    '';

    installPhase = ''
      install -Dm755 unpacked/usr/bin/dvdae $out/bin/dvdae
      install -Dm755 unpacked/usr/bin/dvdae-gui $out/bin/dvdae-gui
      install -Dm644 unpacked/usr/share/dvdae/icon.png $out/share/icons/hicolor/256x256/apps/dvdae.png
      sed 's|^Icon=.*|Icon=dvdae|' unpacked/usr/share/applications/dvdae.desktop > dvdae.desktop
      install -Dm644 dvdae.desktop $out/share/applications/dvdae.desktop
      cp -r unpacked/usr/share/dvdae $out/share/dvdae
    '';

    meta = with pkgs.lib; {
      description = "Extract audios from your DVD and Bly-ray discs";
      homepage = "http://www.dvdae.com";
      license = licenses.unfree;
      maintainers = [ maintainers.unlisted ];
      platforms = platforms.linux;
      priority = "optional";
      mainProgram = "dvdae-gui";
    };
  };
in
{
  dvd-audio-extractor = dvd-audio-extractor;
  wrapper = {
    # open with sudo or add this to your flake.nix: security.wrappers = dvdae.wrapper.security.wrappers;
    security.wrappers.dvdae-gui = {
      source = "${dvd-audio-extractor}/bin/dvdae-gui";
      capabilities = "cap_dac_override,cap_sys_rawio+ep";
      owner = "root";
      group = "root";
    };
  };
}
