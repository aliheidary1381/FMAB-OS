{ config, ... }:
{
  programs.starship = {
    # https://starship.rs/config # https://www.nerdfonts.com/cheat-sheet
    enable = true;
    settings = {
      format = " $hostname$os$shell[ ](bg:maroon)$sudo$username[█](bg:mauve fg:maroon)$container$netns$nix_shell$c$cpp$cmake$rust$golang$nodejs$deno$python$rlang$helm[█](bg:yellow fg:mauve)$directory[█](bg:rosewater fg:yellow)$package[█](fg:rosewater bg:peach)$git_branch$git_status[█](fg:peach) ";
      right_format = "$character$status$cmd_duration$jobs[█](fg:lavender bg:pink)$localip[█](fg:flamingo bg:lavender)$time ";
      palette = "catppuccin_${config.catppuccin.flavor}";
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
        teal = "#81c8be"; # not used
        sky = "#99d1db"; # not used
        sapphire = "#85c1dc"; # not used
        blue = "#8caaee"; # not used
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
        style = "fg:crust bg:mauve";
        format = "[ $symbol($version)]($style)";
      };
      cpp = {
        disabled = false;
        symbol = "";
        style = "fg:crust bg:mauve";
        format = "[ $symbol($version)]($style)";
      };
      character = {
        disabled = false;
        format = "$symbol";
        success_symbol = "[](fg:green)[ ✔ ](fg:crust bg:green)[█](fg:pink bg:green)";
        error_symbol = "[█](fg:red)"; # leave it to status
        vimcmd_symbol = "[](fg:yellow)[  ](fg:crust bg:yellow)[█](fg:pink bg:yellow)";
        vimcmd_replace_one_symbol = "[](fg:yellow)[  replace_one ](fg:crust bg:yellow)[█](fg:pink bg:yellow)";
        vimcmd_replace_symbol = "[](fg:yellow)[  replace ](fg:crust bg:yellow)[█](fg:pink bg:yellow)";
        vimcmd_visual_symbol = "[](fg:yellow)[  visual ](fg:crust bg:yellow)[█](fg:pink bg:yellow)";
      };
      cmake = {
        disabled = false;
        symbol = "";
        style = "fg:crust bg:mauve";
        format = "[ $symbol($version)]($style)";
      };
      cmd_duration = {
        show_milliseconds = true;
        format = "[󰔟$duration ]($style)";
        style = "fg:crust bg:pink";
        disabled = false;
        show_notifications = true;
        min_time_to_notify = 45000;
      };
      container = {
        disabled = false;
        symbol = ""; # 
        style = "fg:crust bg:mauve";
        format = "[ $symbol$name]($style)";
      };
      deno = {
        disabled = false;
        symbol = "";
        style = "fg:crust bg:mauve";
        format = "[ $symbol($version)]($style)";
      };
      directory = {
        disabled = false;
        style = "fg:crust bg:yellow";
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
          "DataGripProjects" = "";
          "DataSpellProjects" = "";
          "GolandProjects" = "";
          "PycharmProjects" = "";
          "WebStormProjects" = "";
          "RustRoverProjects" = "";
          "OCamlProjects" = "";
          "QtProjects" = "";
          "Torrents" = "";
          "NixOS-config" = "";
          "/etc/nixos" = "";
        };
      };
      # docker_context = {};
      git_branch = {
        disabled = false;
        symbol = "";
        style = "fg:crust bg:peach";
        format = "[ $symbol$branch]($style)";
      };
      git_status = {
        disabled = false;
        style = "fg:crust bg:peach";
        format = "[ ($all_status $ahead_behind)]($style)";
      };
      golang = {
        disabled = false;
        symbol = "";
        style = "fg:crust bg:mauve";
        format = "[ $symbol($version)]($style)";
      };
      helm = {
        disabled = false;
        symbol = "";
        style = "fg:crust bg:mauve";
        format = "[ $symbol($version)]($style)";
      };
      hostname = {
        disabled = false;
        ssh_only = false;
        ssh_symbol = "";
        trim_at = "";
        style = "bg:maroon fg:crust";
        format = "[ $hostname]($style)";
      };
      jobs = {
        disabled = false;
        symbol = "[]";
        format = "[$symbol$number ]($style)";
        style = "fg:crust bg:pink";
      };
      # kubernetes = {};
      localip = {
        disabled = false;
        ssh_only = false;
        style = "bg:lavender fg:crust";
        format = "[󰩠$localipv4 ]($style)";
      };
      netns = {
        disabled = false;
        symbol = "󰛳";
        style = "fg:crust bg:mauve";
        format = "[$symbol$name]($style)";
      };
      nix_shell = {
        disabled = false;
        symbol = "󱄅";
        style = "bg:mauve fg:crust";
        format = "[ $symbol($name)]($style)";
      };
      nodejs = {
        disabled = false;
        symbol = "";
        style = "fg:crust bg:mauve";
        format = "[ $symbol($version)]($style)";
      };
      ocaml = {
        disabled = false;
        symbol = "";
        style = "fg:crust bg:mauve";
        format = "[ $symbol($version)( \($switch_indicator$switch_name\))]($style)";
      };
      os = {
        disabled = false;
        style = "fg:crust bg:maroon";
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
      package = {
        disabled = false;
        symbol = ""; # 󰏖 
        style = "fg:crust bg:rosewater";
        format = "[ $symbol($version)]($style)";
      };
      python = {
        disabled = false;
        symbol = "";
        style = "fg:crust bg:mauve";
        format = "[ $symbol($version)(\(#$virtualenv\))]($style)";
      };
      rlang = {
        disabled = false;
        symbol = "";
        style = "fg:crust bg:mauve";
        format = "[ $symbol($version)]($style)";
      };
      rust = {
        disabled = false;
        symbol = "";
        style = "fg:crust bg:mauve";
        format = "[ $symbol($version)]($style)";
      };
      shell = {
        disabled = false;
        style = "fg:crust bg:maroon";
        format = "[ $indicator]($style)";
        fish_indicator = "󰈺";
        bash_indicator = "";
      };
      status = {
        disabled = false;
        map_symbol = true;
        symbol = "";
        not_executable_symbol = ""; # 󰷆
        not_found_symbol = "󰍉"; # 󰮗
        sigint_symbol = "󰈆"; # 
        signal_symbol = "";
        style = "bg:red fg:crust";
        format = "[$symbol$status:( $common_meaning)($maybe_int)( SIG$signal_name) ]($style)[█](fg:pink bg:red)";
      };
      sudo = {
        disabled = false;
        style = "bg:maroon fg:crust";
        format = "[🥪 ]($style)";
      };
      time = {
        disabled = false;
        time_format = "%R";
        style = "fg:crust bg:flamingo";
        format = "[$time ]($style)";
      };
      username = {
        disabled = false;
        show_always = true;
        style_user = "bg:maroon fg:crust";
        style_root = "bg:maroon fg:crust bold blink";
        format = "[$user]($style)";
      };
    };
  };
}
