lvim.lang.markdown = {
  formatters = {
    {
      exe = "prettier",
    },
  },
  linters = {
    {
      exe = "markdownlint",
    },
  },
}

require("lsp.null-ls").setup "markdown"
