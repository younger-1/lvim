local catppuccin = require "catppuccin"

-- colorscheme = "light_melya", -- dark_catppuccino, neon_latte, light_melya
catppuccin.setup {
  transparent_background = false,
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
      virtual_text = {
        errors = "italic",
        hints = "italic",
        warnings = "italic",
        information = "italic",
      },
      underlines = {
        errors = "underline",
        hints = "underline",
        warnings = "underline",
        information = "underline",
      },
    },
    lsp_trouble = true,
    lsp_saga = true,
    gitgutter = false,
    gitsigns = true,
    telescope = true,
    nvimtree = {
      enabled = true,
      show_root = true,
    },
    which_key = true,
    indent_blankline = {
      enabled = true,
      colored_indent_levels = true,
    },
    dashboard = true,
    neogit = true,
    vim_sneak = true,
    fern = false,
    barbar = true,
    bufferline = true,
    markdown = true,
    lightspeed = true,
    ts_rainbow = true,
    hop = true,
  },
}
