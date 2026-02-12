{config, ...}:
{
  programs.helix = {
    enable = true;
    settings = {
      theme = "catppuccin_${config.catppuccin.flavor}";
      editor = {
        color-modes = true;
        true-color = true;
        shell = [
          "fish"
          "-c"
        ];
        line-number = "relative";
        cursorline = true;
        bufferline = "multiple";
        trim-final-newlines = true;
        trim-trailing-whitespace = true;
        lsp.display-inlay-hints = true;
        cursor-shape.insert = "bar";
        # whitespace.render = "all";
        indent-guides.render = true;
        inline-diagnostics.cursor-line = "hint";
        inline-diagnostics.other-lines = "hint";
      };
    };
  };
}
