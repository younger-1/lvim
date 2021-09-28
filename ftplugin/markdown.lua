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

local keys = {
  -- ["K"] = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Show hover" },
  -- ["gd"] = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Goto Definition" },
  -- ["gD"] = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Goto declaration" },
  -- ["gr"] = { "<cmd>lua vim.lsp.buf.references()<CR>", "Goto references" },
  -- ["gI"] = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Goto Implementation" },
  -- ["gs"] = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "show signature help" },
  -- ["gp"] = { "<cmd>lua require'lsp.peek'.Peek('definition')<CR>", "Peek definition" },
  ["gl"] = { "<cmd>lua require'lsp.handlers'.show_line_diagnostics()<CR>", "Show line diagnostics" },
}
require("which-key").register(keys, { mode = "n", buffer = 0 })
