{
  pkgs,
  lib,
  config,
  ...
}:
{
  programs.fish = {
    enable = true;
    shellInit = builtins.readFile ./init.fish;
    interactiveShellInit = ''fish_config theme choose "Catppuccin ${lib.strings.toSentenceCase config.catppuccin.flavor}"'';
    shellAliases = {
      build = "sudo nixos-rebuild switch";
      build-hm = "home-manager switch --impure";
      boot = "sudo nixos-rebuild boot";
      gc = "sudo nix-env --delete-generations old && sudo nix-collect-garbage -d && sudo journalctl --rotate && sudo journalctl --vacuum-time=1s";
      proxy = "proxychains4 fish";
      update = "pushd /etc/nixos/ && nix flake update && popd";
      cp = "cp -i";
      mv = "mv -i";
      tree = ''broot --tree --cmd ":print_tree"'';
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
