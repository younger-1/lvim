require("lsp.null-ls").setup "markdown"

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
