{ config, pkgs, ... }:
{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "catppuccin"
      "catppuccin-icons"
      "fish"
      "html"
      "toml"
      "dockerfile"
      "git-firefly"
      "sql"
      "make"
      "svelte"
      "latex"
      "lua"
      "zig"
      "astro"
      # "dart"
      # "kotlin"
      # "graphql"
      "nix"
      "qml"
      "kdl"
      "csv"
      "rainbow-csv"
      "proto"
      "neocmake"
      "ini"
      "r"
      "python-requirements"
      "assembly"
      "ocaml"
      # "solidity"
      "helm"
      # "odin"
      "verilog"
      "gosum"
      # "nim"
      "json5"
      "jq"
      # "mdx"
      "biome"
      "deno"
      "live-server"
      "marksman"
      "harper"
      # "postgres-language-server"
      "crates-lsp"
      "pyrefly"
      "mcp-server-context7"
      # "postgres-context-server"
      "mcp-server-github"
      "mcp-server-sequential-thinking"
      "browser-tools-context-server"
      # "mcp-server-gitlab"
      # "mcp-server-grafana"
      # "mcp-server-markitdown"
      # "svelte-mcp"
      # "bun-docs-mcp"
    ];
    extraPackages = with pkgs; [
      kdePackages.qtdeclarative
      nil
      nixd
      harper
      texlab
      sqls
      yaml-language-server
      deno
      package-version-server
      taplo
      marksman
      ocamlPackages.ocaml-lsp
      ocamlPackages.ocamlformat
      ocamlPackages.merlin
      basedpyright
      ruff
      pyrefly
      vscode-langservers-extracted
      biome
      vtsls
      tailwindcss-language-server
      gopls
      rustfmt
      clippy
      rust-analyzer
      crates-lsp
      neocmakelsp
      clang-tools
      direnv
    ];
    userSettings = {
      theme = {
        mode = "system";
        light = "Catppuccin Latte";
        dark = "Catppuccin Frappé";
      };
      icon_theme = "Catppuccin Frappé";
      base_keymap = "JetBrains";
      buffer_font_family = "FiraCode Nerd Font";
      inlay_hints.enabled = true;
      fast_scroll_sensitivity = 64.0;
      scroll_sensitivity = 16.0;
      show_signature_help_after_edits = true;
      auto_signature_help = true;
      hard_tabs = true;
      format_on_save = "on";
      go_to_definition_fallback = "none";
      diagnostics.inline.enabled = true;
      prettier.allowed = true;
      status_bar.active_encoding_button = "enabled";
      status_bar.line_endings_button = true;
      tabs.file_icons = true;
      tabs.git_status = true;
      terminal.bell = "system";
      terminal.blinking = "on";
      terminal.cursor_shape = "bar";
      agent.play_sound_when_agent_done = "when_hidden";
      agent.show_turn_stats = true;

      languages.SQL.language_servers = [ "sqls" ];
      lsp = {
        nil.binary.path = pkgs.lib.getExe pkgs.nil;
        nixd.binary.path = pkgs.lib.getExe pkgs.nixd;
        basedpyright.binary = {
          path = pkgs.lib.getExe' pkgs.basedpyright "basedpyright-langserver";
          arguments = [ "--stdio" ];
        };
        ruff.binary = {
          path = pkgs.lib.getExe pkgs.ruff;
          arguments = [ "server" ];
        };
        pyrefly.binary.path = pkgs.lib.getExe pkgs.pyrefly;
        vtsls.binary = {
          path = pkgs.lib.getExe pkgs.vtsls;
          arguments = [ "--stdio" ];
        };
        biome.binary = {
          path = pkgs.lib.getExe pkgs.biome;
          arguments = [ "lsp-proxy" ];
        };
        tailwindcss-language-server.binary.path = pkgs.lib.getExe pkgs.tailwindcss-language-server;
        vscode-html-language-server.binary = {
          path = pkgs.lib.getExe' pkgs.vscode-langservers-extracted "vscode-html-language-server";
          arguments = [ "--stdio" ];
        };
        vscode-css-language-server.binary = {
          path = pkgs.lib.getExe' pkgs.vscode-langservers-extracted "vscode-css-language-server";
          arguments = [ "--stdio" ];
        };
        json-language-server.binary = {
          path = pkgs.lib.getExe' pkgs.vscode-langservers-extracted "vscode-json-language-server";
          arguments = [ "--stdio" ];
        };
        eslint.binary = {
          path = pkgs.lib.getExe' pkgs.vscode-langservers-extracted "vscode-eslint-language-server";
          arguments = [ "--stdio" ];
        };
        deno.binary = {
          path = pkgs.lib.getExe pkgs.deno;
          arguments = [ "lsp" ];
        };
        gopls.binary.path = pkgs.lib.getExe pkgs.gopls;
        rust-analyzer.binary.path = pkgs.lib.getExe pkgs.rust-analyzer;
        crates.binary.path = pkgs.lib.getExe pkgs.crates-lsp;
        clangd.binary.path = pkgs.lib.getExe' pkgs.clang-tools "clangd";
        cmake.binary = {
          path = pkgs.lib.getExe pkgs.neocmakelsp;
          arguments = [ "stdio" ];
        };
        ocamllsp.binary.path = pkgs.lib.getExe' pkgs.ocamlPackages.ocaml-lsp "ocamllsp";
        marksman.binary.path = pkgs.lib.getExe pkgs.marksman;
        texlab.binary.path = pkgs.lib.getExe pkgs.texlab;
        taplo.binary.path = pkgs.lib.getExe pkgs.taplo;
        sqls.binary.path = pkgs.lib.getExe pkgs.sqls;
        package-version-server.binary.path = pkgs.lib.getExe pkgs.package-version-server;
        yaml-language-server.binary = {
          path = pkgs.lib.getExe pkgs.yaml-language-server;
          arguments = [ "--stdio" ];
        };
        harper-ls.binary = {
          path = pkgs.lib.getExe' pkgs.harper "harper-ls";
          arguments = [ "--stdio" ];
        };
        qmljs.binary.path = pkgs.lib.getExe' pkgs.kdePackages.qtdeclarative "qmlls";
      };

      agent_servers = {
        antigravity-acp = {
          type = "custom";
          command = "${pkgs.lib.getExe config.ali.packages.antigravity-acp}";
          args = [ "--uid=" ];
          env = { };
        };
      };

      # language_models = {
      #   ollama = {
      #     api_url = "http://localhost:11434";
      #     available_models = [
      #       {
      #         name = "qwen3:4b-instruct-2507-q4_K_M";
      #         display_name = "Local Ollama - Qwen3 instruct (4b-instruct-2507-q4_K_M)";
      #         max_tokens = 262144;
      #         keep_alive = "1h";
      #         supports_tools = true;
      #         supports_thinking = true;
      #         supports_images = false;
      #       }
      #       {
      #         name = "qwen3-embedding:0.6b-q8_0";
      #         display_name = "Local Ollama - Qwen3 embedding (0.6b-q8_0)";
      #         max_tokens = 32768;
      #         keep_alive = "1h";
      #         supports_tools = false;
      #         supports_thinking = false;
      #         supports_images = false;
      #       }
      #     ];
      #   };
      # };
    };

    userKeymaps = [
      {
        context = "Editor";
        bindings = {
          ctrl-w = [
            "pane::CloseActiveItem" # replaces JetBrains base
            {
              close_pinned = false;
            }
          ];
        };
      }
      {
        context = "Editor";
        bindings = {
          ctrl-shift-w = "editor::SelectLargerSyntaxNode"; # alternative for JetBrains base
        };
      }
      {
        context = "Editor";
        bindings = {
          ctrl-shift-enter = "editor::ToggleFoldAll";
        };
      }
    ];
  };
}
