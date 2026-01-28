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

  onlyoffice-dark = "${config.home.homeDirectory}/.local/share/onlyoffice/desktopeditors/uithemes/catppuccin-frappe.json";
  # onlyoffice-light = "${config.home.homeDirectory}/.local/share/onlyoffice/desktopeditors/uithemes/catppuccin-latte.json";
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

  catppuccin = {
    enable = true;
    flavor = "frappe";
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
  };

  home.file.".config/fish/themes/Catppuccin Frappe.theme".source =
    "${sources.fish}/Catppuccin Frappe.theme";
  home.file.".config/fish/themes/Catppuccin Latte.theme".source =
    "${sources.fish}/Catppuccin Latte.theme";
  home.file.".jupyter/jupyter_notebook_config.py".source = ./jupyter_notebook.py;

  home.activation.streamripConfig = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    cp ${./streamrip.toml} "$HOME/.config/streamrip/config.toml" && chmod 600 "$HOME/.config/streamrip/config.toml"
  '';

  home.activation.copyFonts = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    mkdir -p ~/.local/share/fonts
    chown -R "$USER:$(id -gn)" ~/.local/share/fonts
    rm -rf ~/.local/share/fonts/*
    for fontPkg in ${builtins.concatStringsSep " " (map (pkg: "${pkg}/share/fonts") myFonts)}; do
      if [ -d "$fontPkg"/truetype ]; then
        cp -rL "$fontPkg"/truetype/*.[ot]tf ~/.local/share/fonts/
      fi
      if [ -d "$fontPkg"/opentype ]; then
        cp -rL "$fontPkg"/opentype/*.otf ~/.local/share/fonts/
      fi
      if [ -d "$fontPkg"/wine ]; then
        cp -rL "$fontPkg"/wine/*.ttf ~/.local/share/fonts/
      fi
      if [ -d "$fontPkg"/noto ]; then
        cp -rL "$fontPkg"/noto/*.ttf ~/.local/share/fonts/
      fi
      if [ -d "$fontPkg"/ir-standard-fonts ]; then
        cp -rL "$fontPkg"/ir-standard-fonts/*.ttf ~/.local/share/fonts/
      fi
    done
    chmod 644 ~/.local/share/fonts/*
    cp ~/.local/share/fonts/Times_New_Roman.ttf ~/.local/share/fonts/times.ttf
    cp ~/.local/share/fonts/Courier_New.ttf ~/.local/share/fonts/cour.ttf
    cp ~/.local/share/fonts/Arial.ttf ~/.local/share/fonts/arial.ttf
    ${pkgs.fontconfig}/bin/fc-cache -f ~/.local/share/fonts
  '';

  home.activation.installZoteroExtensionForLibreOffice = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if ! ${pkgs.libreoffice}/bin/unopkg list | grep "org.Zotero.integration.openoffice"; then
      ${pkgs.libreoffice}/bin/unopkg add ${pkgs.zotero}/usr/lib/zotero-bin-*/integration/libreoffice/Zotero_LibreOffice_Integration.oxt
    fi
  '';

  # home.activation.onlyofficeTheme = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
  #   conf="$HOME/.config/onlyoffice/DesktopEditors.conf"
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
  home.file = {
    ".face.icon" = {
      source = ../fmab/sddm/faces/.face.icon;
      executable = false;
    };
  };

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.
}
