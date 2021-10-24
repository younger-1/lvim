-- [null]
lvim.lang.markdown = {
  formatters = {
    {
      exe = "markdownlint",
      args = { "--config", vim.fn.expand "~/dotter/markdownlint.jsonc" },
    },
  },
  linters = {
    {
      exe = "markdownlint",
      args = { "--config", vim.fn.expand "~/dotter/markdownlint.jsonc" },
    },
  },
}
require("lsp.null-ls").setup "markdown"

-- <https://github.com/jose-elias-alvarez/null-ls.nvim/commit/d0fbe058a8286f4e73b9240f4f8e7b39881fc36b>
-- [manually setup]
-- local null_ls = require "null-ls"
-- local markdownlint = {
--   name = "markdownlint",
--   method = null_ls.methods.FORMATTING,
--   filetypes = { "markdown" },
--   generator = null_ls.formatter {
--     command = "markdownlint",
--     args = { "--fix", "$FILENAME" },
--     -- to_stdin = false,
--     -- doesn't support stdin for fixing, but we can use a temp file
--     to_temp_file = true,
--   },
-- }
-- null_ls.register(markdownlint)
-- null_ls.register(require("null-ls").builtins.diagnostics.markdownlint.with {
--   diagnostics_format = "[#{c}] #{m} (#{s})",
-- })

-- [which-key]
-- If not `pcall`, it will go wrong because "which-key" is lazy-load with 'BufWinEnter' event
-- So what happen here? Is pcall async?
local status_ok, wk = pcall(require, "which-key")
if not status_ok then
  -- print("1: which-key return from markdown ft")
  return
end

-- print("2: do which-key in markdown ft")
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
wk.register(keys, { mode = "n", buffer = 0 })
