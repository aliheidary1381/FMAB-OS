{
  pkgs,
  ...
}:
{
  programs.fish = {
    enable = true;
    shellInit = builtins.readFile ./init.fish;
    shellAliases = {
      build = "sudo nixos-rebuild switch";
      build-hm = "home-manager switch --impure --flake /etc/nixos";
      boot = "sudo nixos-rebuild boot";
      gc = "sudo nix-env -p /nix/var/nix/profiles/system --delete-generations old && sudo nix-env --delete-generations old && nix-collect-garbage -d && sudo journalctl --rotate && sudo journalctl --vacuum-time=1s && rm -rf ~/.MakeMKV && rm -rf ~/.dvdae && gtrash find --rm --force";
      config = "nix config show";
      proxy = "proxychains4 fish";
      update = "pushd /etc/nixos/ && nix flake update; popd";
      hash = "nix-prefetch-url";
      cp = "cp -i";
      mv = "mv -i";
      rm = "gtrash put --rm-mode -i -v";
      tree = ''broot --tree --cmd ":print_tree"'';
      wsh = "~/.local/share/waveterm/bin/wsh"; # config.xdg.dataHome is ~/.local/share
      ffmpeg = "ffmpeg -hide_banner";
      niri-with-noctalia = "rm ~/.config/niri/config.kdl && cp -L ~/.config/niri/config.noctalia.kdl ~/.config/niri/config.kdl && niri-session";
      niri-with-dms = "rm ~/.config/niri/config.kdl && cp -L ~/.config/niri/config.dms.kdl ~/.config/niri/config.kdl && niri-session";
    };
  };

  # users.defaultUserShell = pkgs.fish; # risky
  # There's also shellInit which includes loginShellInit
  programs.bash.interactiveShellInit = ''
    if [ "$(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm)" != "fish" ]; then
      case "$0" in
        -bash) LOGIN_OPTION="--login" ;;
        *) LOGIN_OPTION="" ;;
      esac
      exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
    fi
  '';
}
