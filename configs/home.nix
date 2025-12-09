{
  config,
  lib,
  ...
}:
let
  inherit (config.catppuccin) sources;
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
  # home.file.".config/streamrip/config.toml".source = ./streamrip-config.toml; # not writable

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
