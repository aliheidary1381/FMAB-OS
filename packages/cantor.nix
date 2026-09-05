{
  pkgs,
  pythonForJupyter,
  R,
  julia
}:
let
  runtimeDeps = [
    pkgs.libqalculate
    pkgs.luajit
    julia
    pythonForJupyter
    R
    pkgs.texliveFull
  ];
in
pkgs.kdePackages.mkKdeDerivation {
  pname = "cantor";

  extraNativeBuildInputs = [
    pkgs.pkg-config
    pkgs.shared-mime-info
  ];

  extraBuildInputs = [
    pkgs.pcre2
    pkgs.kdePackages.qtsvg
    pkgs.kdePackages.qttools
    pkgs.kdePackages.qtwebengine

    pkgs.libspectre
    pkgs.kdePackages.poppler
    pkgs.libqalculate
    pkgs.luajit
    julia
    pythonForJupyter
    R
  ];

  extraCmakeFlags = [
    "-DR_EXECUTABLE=${pkgs.lib.getExe R}"
    "-DJULIA_EXECUTABLE=${pkgs.lib.getExe julia}"
    "-DPython3_EXECUTABLE=${pkgs.lib.getExe pythonForJupyter}"
    "-DPython3_ROOT_DIR=${pythonForJupyter}"
    "-DPython3_FIND_STRATEGY=LOCATION"
    "-DCMAKE_EXE_LINKER_FLAGS=-Wl,-rpath-link,${pkgs.lib.getLib pkgs.pcre2}/lib"
  ];

  preFixup = ''
    patchelf --add-rpath "${pkgs.lib.getLib R}/lib/R/lib" "$out/bin/cantor_rserver"
  '';

  qtWrapperArgs = [
    "--prefix PATH : ${pkgs.lib.makeBinPath runtimeDeps}"
  ];
}
