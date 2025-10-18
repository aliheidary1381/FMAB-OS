{
  ...
}:
{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    opts = {
      number = true;
      relativenumber = true;
    };
    colorschemes.catppuccin.enable = true;
    colorschemes.catppuccin.settings.flavour = "frappe";
    withNodeJs = true;
    dependencies = {
      coreutils.enable = true;
      git.enable = true;
      lazygit.enable = true;
      curl.enable = true;
      fzf.enable = true;
      ripgrep.enable = true;
      bat.enable = true;
      fish.enable = true;
      gcc.enable = true;
      go.enable = true;
      sed.enable = true;
      tree-sitter.enable = true;
      which.enable = true;
    };
    plugins = {
      mini = {
        enable = true;
        modules = {
          icons.enable = true;
          icons.mockDevIcons = true;
          pairs.enable = true;
          ai.enable = true;
        };
      };
      web-devicons.enable = false;
      lazygit.enable = true;
      blink-cmp.enable = true;
      fzf-lua.enable = true;
      which-key.enable = true;
      telescope.enable = true;
      ts-comments.enable = true;
      lazydev.enable = true;
      grug-far.enable = true;
      flash.enable = true;
      gitsigns.enable = true;
      trouble.enable = true;
      todo-comments.enable = true;
      conform-nvim.enable = true;
      lint.enable = true;
      lspconfig.enable = true;
      treesitter.enable = true;
      ts-autotag.enable = true;
      treesitter-textobjects.enable = true;
      bufferline.enable = true;
      lualine.enable = true;
      noice.enable = true;
      nui.enable = true;
      snacks.enable = true;
      persistence.enable = true;
      indent-blankline.enable = true;
      colorizer.enable = true;
      luasnip.enable = true;
      friendly-snippets.enable = true;
      nvim-tree.enable = true;
      dashboard.enable = true;
      lsp.servers.prolog_ls.enable = true;
    };
    lsp.servers = {
      fish_lsp.enable = true;
      buf_ls.enable = true;
      svelte.enable = true;
      astro.enable = true;
      autotools_ls.enable = true;
    };
  };
}
