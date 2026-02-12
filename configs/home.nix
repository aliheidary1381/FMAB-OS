{
  pkgs,
  config,
  lib,
  ...
}:
let
  inherit (config.catppuccin) sources;
  myFonts = [
    pkgs.corefonts
    pkgs.vista-fonts
    pkgs.wine64Packages.fonts
    pkgs.gyre-fonts
    pkgs.noto-fonts-lgc-plus
    pkgs.noto-fonts-color-emoji
    pkgs.dejavu_fonts
    pkgs.freefont_ttf
    pkgs.liberation_ttf
    pkgs.ir-standard-fonts
    config.ali.fonts.my-fonts
    config.ali.fonts.parastoo
    config.ali.fonts.estedad
    config.ali.fonts.estedad-mad
    config.ali.fonts.sahel
    config.ali.fonts.gandom
    config.ali.fonts.lalezar
  ];

  # onlyoffice-dark = "${config.xdg.dataHome}/onlyoffice/desktopeditors/uithemes/catppuccin-frappe.json";
  # onlyoffice-light = "${config.xdg.dataHome}/onlyoffice/desktopeditors/uithemes/catppuccin-latte.json";

  PhotoGIMP = pkgs.fetchFromGitHub {
    owner = "Diolinux";
    repo = "PhotoGIMP";
    tag = "master";
    hash = "sha256-OLEqtI2Hem2fTTL0KNf0aZsFfuwwhgE4etyRMcW5KiQ=";
  };
in
{
  programs.git = {
    enable = true;
    settings.user = {
      name = "Ali Heydari";
      email = "aliheidary1381@gmail.com";
    };
  };

  programs.eza.enable = true;
  programs.lsd.enable = true;
  programs.bat.enable = true;
  programs.fish.enable = true;
  programs.lazygit.enable = true;
  programs.fzf.enable = true;
  programs.zoxide.enable = true;
  programs.broot.enable = true;
  programs.sioyek.enable = true;

  catppuccin = {
    enable = true;
    flavor = lib.mkDefault "frappe";
    accent = "yellow";
    helix.enable = false; # No need. It's built-in
    zed.enable = false; # No need. It's configured
    starship.enable = false; # No need. It's configured
    fish.enable = false; # No need. It's configured
    bat.enable = true;
    fzf.enable = true;
    lazygit.enable = true;
    lsd.enable = true;
    eza.enable = true;
    # broot.enable = true;
    sioyek.enable = true;
  };

  # qt.kde.settings = {};
  # qt.qt6ctSettings = {};

  xdg.configFile."fish/themes/Catppuccin Frappe.theme".source =
    "${sources.fish}/Catppuccin Frappe.theme";
  xdg.configFile."fish/themes/Catppuccin Latte.theme".source =
    "${sources.fish}/Catppuccin Latte.theme";
  home.file.".jupyter/jupyter_notebook_config.py".source = ./jupyter_notebook.py;

  home.activation.streamripConfig = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    install -D --mode=600 --owner=${config.home.username} --group=users ${./streamrip.toml} "${config.xdg.configHome}/streamrip/config.toml"
  '';

  home.activation.copyFonts = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    rm -rf ${config.xdg.dataHome}/fonts
    mkdir ${config.xdg.dataHome}/fonts
    for fontPkg in ${builtins.concatStringsSep " " (map (pkg: "${pkg}/share/fonts") myFonts)}; do
      install --mode=644 --owner=${config.home.username} --group=users "$fontPkg"/*/*.[ot]tf ${config.xdg.dataHome}/fonts/
    done
    cp -L ${config.xdg.dataHome}/fonts/Times_New_Roman.ttf ${config.xdg.dataHome}/fonts/times.ttf
    cp -L ${config.xdg.dataHome}/fonts/Courier_New.ttf ${config.xdg.dataHome}/fonts/cour.ttf
    cp -L ${config.xdg.dataHome}/fonts/Arial.ttf ${config.xdg.dataHome}/fonts/arial.ttf
    ${pkgs.fontconfig}/bin/fc-cache -f ${config.xdg.dataHome}/fonts
  '';

  home.activation.installZoteroExtensionForLibreOffice = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if ! ${pkgs.libreoffice}/bin/unopkg list | grep "org.Zotero.integration.openoffice"; then
      ${pkgs.libreoffice}/bin/unopkg add ${pkgs.zotero}/usr/lib/zotero-bin-*/integration/libreoffice/Zotero_LibreOffice_Integration.oxt
    fi
  '';

  home.activation.installPhotoGIMPPatch = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    set -euo pipefail

    src="${PhotoGIMP}/.config/GIMP"
    dst="${config.xdg.configHome}/GIMP"

    rm -rf "$dst"
    mkdir -p "$dst"

    find "$src" -mindepth 1 -print0 | while IFS= read -r -d $'\0' path; do
        rel="$(printf "%s" "$path" | sed "s|^$src/||")"
        target="$dst/$rel"

        if [ -d "$path" ]; then
            mkdir -p "$target"
            chown "${config.home.username}:users" "$target"
            chmod 755 "$target"
        else
            install -D --mode=644 --owner="${config.home.username}" --group=users "$path" "$target"
        fi
    done
    rm -rf "${config.xdg.configHome}/GIMP/3.0/splashes"
  '';

  # home.activation.onlyofficeTheme = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
  #   conf="${config.xdg.configHome}/onlyoffice/DesktopEditors.conf"
  #   if [ -f "$conf" ]; then
  #     if grep -q '^UITheme=' "$conf"; then
  #       sed -i 's|^UITheme=.*|UITheme=${onlyoffice-dark}|' "$conf"
  #     else
  #       sed -i '/^\[General\]/a UITheme=${onlyoffice-dark}' "$conf"
  #     fi
  #   fi
  # '';

  home.username = "ali";
  home.homeDirectory = "/home/ali";
  home.file.".face.icon".source = ../fmab/sddm/faces/.face.icon;

  # xdg.desktopEntries = {};

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.
}
