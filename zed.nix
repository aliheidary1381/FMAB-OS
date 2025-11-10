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
      # TODO: snippets
      # "mcp-server-context7"
      # "postgres-context-server"
      # "mcp-server-github"
      # "mcp-server-sequential-thinking"
      # "browser-tools-context-server"
      # "mcp-server-gitlab"
      # "mcp-server-grafana"
      # "mcp-server-markitdown"
      # "svelte-mcp"
      # "bun-docs-mcp"
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

      language_models = {
        ollama = {
          api_url = "http://localhost:11434";
          available_models = [
            {
              name = "gemma3n:e2b-it-q4_K_M";
              display_name = "Local Ollama - Gemma 3n (e2b-it-q4_K_M)";
              max_tokens = 32768;
              keep_alive = "1h";
              supports_tools = false;
              supports_thinking = false;
              supports_images = false;
            }
            # {
            #   name = "qwen3-coder:30b-a3b-q4_K_M";
            #   display_name = "Local Ollama - Qwen3 coder (30b-a3b-q4_K_M)";
            #   max_tokens = 262144;
            #   keep_alive = "1h";
            #   supports_tools = true;
            #   supports_thinking = false;
            #   supports_images = false;
            # }
            {
              name = "qwen3:4b-thinking-2507-q4_K_M";
              display_name = "Local Ollama - Qwen3 thinking (4b-thinking-2507-q4_K_M)";
              max_tokens = 262144;
              keep_alive = "1h";
              supports_tools = true;
              supports_thinking = true;
              supports_images = false;
            }
            {
              name = "qwen3:4b-instruct-2507-q4_K_M";
              display_name = "Local Ollama - Qwen3 instruct (4b-instruct-2507-q4_K_M)";
              max_tokens = 262144;
              keep_alive = "1h";
              supports_tools = true;
              supports_thinking = true;
              supports_images = false;
            }
            # {
            #   name = "qwen3-vl:2b-instruct-q4_K_M";
            #   display_name = "Local Ollama - Qwen3 vision instruct (2b-instruct-2507-q4_K_M)";
            #   max_tokens = 262144;
            #   keep_alive = "1h";
            #   supports_tools = false;
            #   supports_thinking = false;
            #   supports_images = true;
            # }
            # {
            #   name = "qwen3-vl:2b-thinking-q4_K_M";
            #   display_name = "Local Ollama - Qwen3 vision thinking (2b-thinking-2507-q4_K_M)";
            #   max_tokens = 262144;
            #   keep_alive = "1h";
            #   supports_tools = false;
            #   supports_thinking = false;
            #   supports_images = true;
            # }
            # {
            #   name = "qwen3-embedding:0.6b-q8_0";
            #   display_name = "Local Ollama - Qwen3 embedding (0.6b-q8_0)";
            #   max_tokens = 32768;
            #   keep_alive = "1h";
            #   supports_tools = false;
            #   supports_thinking = false;
            #   supports_images = false;
            # }
          ];
        };
      };
    };
  };
}
