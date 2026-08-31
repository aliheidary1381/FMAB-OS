{
  xdg.dataFile."onlyoffice/desktopeditors/uithemes/catppuccin-latte.json".text = builtins.toJSON {
    name = "Catppuccin Latte";
    id = "theme-catppuccin-latte";
    type = "light";
    colors = {
      toolbar-header-document = "#1e66f5";
      toolbar-header-spreadsheet = "#40a02b";
      toolbar-header-presentation = "#fe640b";
      toolbar-header-pdf = "#d20f39";
      text-toolbar-header-on-background-document = "#eff1f5";
      text-toolbar-header-on-background-spreadsheet = "#eff1f5";
      text-toolbar-header-on-background-presentation = "#eff1f5";
      text-toolbar-header-on-background-pdf = "#eff1f5";

      background-normal = "#eff1f5";
      background-toolbar = "#e6e9ef";
      background-toolbar-additional = "#dce0e8";
      background-primary-dialog-button = "#8839ef";
      background-accent-button = "#1e66f5";
      background-tab-underline = "#dc8a78";
      background-notification-popover = "#ccd0da";
      background-notification-badge = "#d20f39";
      background-scrim = "rgba(220, 224, 232, 0.7)";
      background-loader = "rgba(239, 241, 245, 0.9)";

      highlight-button-hover = "#ccd0da";
      highlight-button-pressed = "#bcc0cc";
      highlight-button-pressed-hover = "#acb0be";
      highlight-primary-dialog-button-hover = "#7287fd";
      highlight-accent-button-hover = "#7287fd";
      highlight-text-select = "#bcc0cc";

      border-toolbar = "#ccd0da";
      border-divider = "#bcc0cc";
      border-regular-control = "#acb0be";
      border-control-focus = "#8839ef";
      border-error = "#d20f39";

      text-normal = "#4c4f69";
      text-normal-pressed = "#1e66f5";
      text-secondary = "#5c5f77";
      text-tertiary = "#6c6f85";
      text-link = "#1e66f5";
      text-inverse = "#eff1f5";
      text-toolbar-header = "#eff1f5";

      icon-normal = "#4c4f69";
      icon-normal-pressed = "#1e66f5";
      icon-success = "#40a02b";

      canvas-background = "#dce0e8";
      canvas-content-background = "#eff1f5";
      canvas-page-border = "#ccd0da";
      canvas-ruler-background = "#e6e9ef";
      canvas-ruler-mark = "#7c7f93";
      canvas-cell-border = "rgba(156, 160, 176, 0.3)";
      canvas-scroll-thumb = "#bcc0cc";
      canvas-scroll-thumb-hover = "#acb0be";
    };
  };
  xdg.dataFile."onlyoffice/desktopeditors/uithemes/catppuccin-frappe.json".text = builtins.toJSON {
    name = "Catppuccin Frappe";
    id = "theme-catppuccin-frappe";
    type = "dark";
    colors = {
      toolbar-header-document = "#8caaee";
      toolbar-header-spreadsheet = "#a6d189";
      toolbar-header-presentation = "#ef9f76";
      toolbar-header-pdf = "#e78284";
      text-toolbar-header-on-background-document = "#303446";
      text-toolbar-header-on-background-spreadsheet = "#303446";
      text-toolbar-header-on-background-presentation = "#303446";
      text-toolbar-header-on-background-pdf = "#303446";

      background-normal = "#303446";
      background-toolbar = "#292c3c";
      background-toolbar-additional = "#232634";
      background-primary-dialog-button = "#ca9ee6";
      background-accent-button = "#8caaee";
      background-tab-underline = "#f2d5cf";
      background-notification-popover = "#414559";
      background-notification-badge = "#e78284";
      background-scrim = "rgba(35, 38, 52, 0.7)";
      background-loader = "rgba(48, 52, 70, 0.9)";

      highlight-button-hover = "#414559";
      highlight-button-pressed = "#51576d";
      highlight-button-pressed-hover = "#626880";
      highlight-primary-dialog-button-hover = "#babbf1";
      highlight-accent-button-hover = "#babbf1";
      highlight-text-select = "#51576d";

      border-toolbar = "#414559";
      border-divider = "#51576d";
      border-regular-control = "#626880";
      border-control-focus = "#ca9ee6";
      border-error = "#e78284";

      text-normal = "#c6d0f5";
      text-normal-pressed = "#8caaee";
      text-secondary = "#b5bfe2";
      text-tertiary = "#a5adce";
      text-link = "#8caaee";
      text-inverse = "#303446";
      text-toolbar-header = "#303446";

      icon-normal = "#c6d0f5";
      icon-normal-pressed = "#8caaee";
      icon-success = "#a6d189";

      canvas-background = "#232634";
      canvas-content-background = "#303446";
      canvas-page-border = "#414559";
      canvas-ruler-background = "#292c3c";
      canvas-ruler-mark = "#949cbb";
      canvas-cell-border = "rgba(115, 121, 148, 0.3)";
      canvas-scroll-thumb = "#51576d";
      canvas-scroll-thumb-hover = "#626880";
    };
  };
}
