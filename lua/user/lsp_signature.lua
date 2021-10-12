local M = {}

M.config = function()
  local status_ok, lsp_signature = pcall(require, "lsp_signature")
  if not status_ok then
    return
  end

  lsp_signature.setup {
    -- floating_window = true, -- show hint in a floating window, set to false for virtual text only mode
    -- hint_enable = true, -- virtual hint enable
    -- hint_prefix = "🐼 ", -- Panda for parameter
    -- use_lspsaga = false, -- set to true if you want to use lspsaga popup
    -- handler_opts = {
    --   border = "single",   -- double, single, shadow, none
    -- },
    transpancy = 20,
    toggle_key = "<C-l>",
  }
end

return M
