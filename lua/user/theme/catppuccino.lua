local catppuccino = require "catppuccino"

catppuccino.setup {
  colorscheme = "light_melya", -- dark_catppuccino, neon_latte, light_melya
  transparency = false,
  term_colors = false,
  styles = {
    comments = "italic",
    functions = "italic",
    keywords = "italic",
    strings = "NONE",
    variables = "NONE",
  },
  integrations = {
    treesitter = true,
    native_lsp = {
      enabled = true,
      styles = {
        errors = "italic",
        hints = "italic",
        warnings = "italic",
        information = "italic",
      },
    },
    lsp_trouble = true,
    lsp_saga = false,
    gitgutter = false,
    gitsigns = false,
    telescope = true,
    nvimtree = {
      enabled = false,
      show_root = false,
    },
    which_key = false,
    indent_blankline = false,
    dashboard = false,
    neogit = false,
    vim_sneak = false,
    fern = false,
    barbar = false,
    bufferline = false,
    markdown = false,
  },
}
