{
  pkgs,
  ...
}:
{
  programs.fish = {
    enable = true;
    shellInit = ''
      set -g fish_greeting ""
      fish_config theme choose "Catppuccin Frappe"
      function run
        if test (count $argv) -eq 0
          echo "Usage: run <package>"
          return 1
        end
        nix run nixpkgs#$argv[1] -- $argv[2..-1]
      end
    '';
    shellAliases = {
      build = "sudo nixos-rebuild switch --flake /home/ali/Documents/NixOS-config --impure";
      boot = "sudo nixos-rebuild boot --flake /home/ali/Documents/NixOS-config --impure";
      gc = "sudo nix-env --delete-generations old && sudo nix-collect-garbage -d && sudo journalctl --rotate && sudo journalctl --vacuum-time=1s";
      proxy = "proxychains4 fish";
      update = "pushd /home/ali/Documents/NixOS-config && nix flake update && popd";
      cp = "cp -i";
      mv = "mv -i";
      tree = ''broot --tree --cmd ":print_tree"'';
    };
  };

  programs.starship = {
    # TODO
    # https://starship.rs/config # https://www.nerdfonts.com/cheat-sheet
    enable = true;
    presets = [ "nerd-font-symbols" ];
    settings = {
      format = " $os$shell$username[█](bg:peach fg:red)$directory[█](bg:yellow fg:peach)$git_branch$git_status[█](fg:yellow bg:green)$c$rust$golang$nodejs$php$java$kotlin$haskell$python[█](fg:green bg:sapphire)$conda[█](fg:sapphire) ";
      right_format = "$character$cmd_duration[█](fg:lavender bg:yellow)$time ";
      palette = "catppuccin_frappe";
      palettes.catppuccin_frappe = {
        rosewater = "#f2d5cf";
        flamingo = "#eebebe";
        pink = "#f4b8e4";
        mauve = "#ca9ee6";
        red = "#e78284";
        maroon = "#ea999c";
        peach = "#ef9f76";
        yellow = "#e5c890";
        green = "#a6d189";
        teal = "#81c8be";
        sky = "#99d1db";
        sapphire = "#85c1dc";
        blue = "#8caaee";
        lavender = "#babbf1";
        text = "#c6d0f5";
        subtext1 = "#b5bfe2";
        subtext0 = "#a5adce";
        overlay2 = "#949cbb";
        overlay1 = "#838ba7";
        overlay0 = "#737994";
        surface2 = "#626880";
        surface1 = "#51576d";
        surface0 = "#414559";
        base = "#303446";
        mantle = "#292c3c";
        crust = "#232634";
      };
      palettes.catppuccin_latte = {
        rosewater = "#dc8a78";
        flamingo = "#dd7878";
        pink = "#ea76cb";
        mauve = "#8839ef";
        red = "#d20f39";
        maroon = "#e64553";
        peach = "#fe640b";
        yellow = "#df8e1d";
        green = "#40a02b";
        teal = "#179299";
        sky = "#04a5e5";
        sapphire = "#209fb5";
        blue = "#1e66f5";
        lavender = "#7287fd";
        text = "#4c4f69";
        subtext1 = "#5c5f77";
        subtext0 = "#6c6f85";
        overlay2 = "#7c7f93";
        overlay1 = "#8c8fa1";
        overlay0 = "#9ca0b0";
        surface2 = "#acb0be";
        surface1 = "#bcc0cc";
        surface0 = "#ccd0da";
        base = "#eff1f5";
        mantle = "#e6e9ef";
        crust = "#dce0e8";
      };
      c = {
        disabled = false;
        symbol = "";
        style = "fg:crust bg:green";
        format = "[ $symbol ($version)]($style)";
      };
      cpp = {
        disabled = false;
        symbol = "";
        style = "fg:crust bg:green";
        format = "[ $symbol ($version)]($style)";
      };
      character = {
        disabled = false;
        format = "$symbol";
        success_symbol = "[](fg:green)[ ✔ ](fg:crust bg:green)[█](fg:yellow bg:green)";
        error_symbol = "[](fg:red)[  ](fg:crust bg:red)[█](fg:yellow bg:red)";
        vimcmd_symbol = "[](fg:yellow)[  ](fg:crust bg:yellow)";
        vimcmd_replace_one_symbol = "[](fg:yellow)[  replace_one ](fg:crust bg:yellow)";
        vimcmd_replace_symbol = "[](fg:yellow)[  replace ](fg:crust bg:yellow)";
        vimcmd_visual_symbol = "[](fg:yellow)[  visual ](fg:crust bg:yellow)";
      };
      #               cmake = {};
      cmd_duration = {
        show_milliseconds = true;
        format = "[took 󰔟$duration ]($style)";
        style = "fg:crust bg:yellow";
        disabled = false;
        show_notifications = true;
        min_time_to_notify = 45000;

      };
      #               container = {};
      #               deno = {};
      directory = {
        disabled = false;
        style = "fg:crust bg:peach";
        format = "[ $path]($style)";
        fish_style_pwd_dir_length = 1;
        truncation_length = 3;
        truncation_symbol = "…/";
        home_symbol = "";
        substitutions = {
          "Desktop" = "";
          "Documents" = "󰈙";
          "Downloads" = "";
          "Music" = "";
          "Pictures" = "";
          "Videos" = "";
          "Codes" = "";
          "CLionProjects" = "";
          "DataGripProjects" = "";
          "DataSpellProjects" = "";
          "GolandProjects" = "";
          "PycharmProjects" = "";
          "WebStormProjects" = "";
          "RustRoverProjects" = "";
          "OCamlProjects" = "";
          "QtProjects" = "";
          "Torrents" = "";
          "NixOS-config" = "";
        };
      };
      docker_context = {
        disabled = false;
        symbol = "";
        style = "fg:crust bg:sapphire";
        format = "[ $symbol ($context)]($style)";
      };
      git_branch = {
        disabled = false;
        symbol = "";
        style = "fg:crust bg:yellow";
        format = "[ $symbol $branch]($style)";
      };
      #               git_commit = {};
      #               git_metrics = {};
      #               git_state = {};
      git_status = {
        disabled = false;
        style = "fg:crust bg:yellow";
        format = "[ ($all_status $ahead_behind)]($style)";
      };
      golang = {
        disabled = false;
        symbol = "";
        style = "fg:crust bg:green";
        format = "[ $symbol ($version)]($style)";
      };
      #               hostname = {};
      #               jobs = {};
      #               kubernetes = {};
      #               localip = {};
      #               netns = {};
      #               nix_shell = {};
      nodejs = {
        disabled = false;
        symbol = "";
        style = "fg:crust bg:green";
        format = "[ $symbol ($version)]($style)";
      };
      #               ocaml = {};
      os = {
        disabled = false;
        style = "fg:crust bg:red";
        format = "[ $symbol]($style)";
        symbols = {
          Windows = "";
          Ubuntu = "󰕈";
          SUSE = "";
          Raspbian = "󰐿";
          Mint = "󰣭";
          Macos = "󰀵";
          Manjaro = "";
          Linux = "󰌽";
          Gentoo = "󰣨";
          Fedora = "󰣛";
          Alpine = "";
          Amazon = "";
          Android = "";
          Arch = "󰣇";
          Artix = "󰣇";
          CentOS = "";
          Debian = "󰣚";
          Redhat = "󱄛";
          RedHatEnterprise = "󱄛";
          NixOS = "";
        };
      };
      #               package = {};
      python = {
        disabled = false;
        symbol = "";
        style = "fg:crust bg:green";
        format = "[ $symbol ($version)(\(#$virtualenv\))]($style)";
      };
      rust = {
        disabled = false;
        symbol = "";
        style = "fg:crust bg:green";
        format = "[ $symbol( $version)]($style)";
      };
      shell = {
        disabled = false;
        style = "fg:crust bg:red";
        format = "[ $indicator]($style)";
        fish_indicator = "󰈺";
        bash_indicator = "";
      };
      #               status = {
      #                 disabled = false;
      #                 style = "bg:mauve fg:crust";
      #                 format = "[✘ $status ]($style)";
      #               };
      #               sudo = {};
      time = {
        disabled = false;
        time_format = "%R";
        style = "fg:crust bg:lavender";
        format = "[at $time ]($style)";
      };
      username = {
        disabled = false;
        show_always = true;
        style_user = "bg:red fg:crust";
        style_root = "bg:red fg:crust";
        format = "[ $user]($style)";
      };
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
