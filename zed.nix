{ ... }:
{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "catppuccin"
      "catppuccin-icons"
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
      "tombi"
      "jq"
      # "mdx"
      "biome"
      "deno"
      "live-server"
      "marksman"
      "harper"
      # "postgres-language-server"
      "crates-lsp"
      # TODO: MCP servers & snippets
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
    };
  };
}
