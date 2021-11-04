-- [lualine](https://github.com/nvim-lualine/lualine.nvim/wiki/Introduction)
-- <https://github.com/jimcornmell/lvim/blob/main/lua/user/lualine.lua>

lvim.builtin.lualine.style = "lvim" -- or "default", "lvim", "none"

-- local custom_gruvbox = require "lualine.themes.gruvbox_dark"
-- custom_gruvbox.insert.b = { fg = custom_gruvbox.insert.a.bg, gui = "bold" }
-- custom_gruvbox.visual.b = { fg = custom_gruvbox.visual.a.bg, gui = "bold" }
-- custom_gruvbox.replace.b = { fg = custom_gruvbox.replace.a.bg, gui = "bold" }
-- custom_gruvbox.command.b = { fg = custom_gruvbox.command.a.bg, gui = "bold" }
-- lvim.builtin.lualine.options.theme = custom_gruvbox -- or "auto", "onedarker", "gruvbox"

-- LunarVim's components: mode, branch, filename, diff, python_env, diagnostics, treesitter, lsp, location, progress, spaces, encoding, filetype, scrollbar
-- local components = require "lvim.core.lualine.components"
-- lvim.builtin.lualine.sections.lualine_a = { "mode" }
-- lvim.builtin.lualine.sections.lualine_c = { "diff" }
-- lvim.builtin.lualine.sections.lualine_z = {
--   components.spaces,
--   components.location,
-- }

lvim.builtin.lualine.on_config_done = function(lualine)
  -- Or: local config = lvim.builtin.lualine
  local config = lualine.get_config()
  local components = require "lvim.core.lualine.components"
  local trailing_white = function()
    return vim.fn.search([[\s\+$]], "nw") ~= 0 and "TW" or ""
  end
  table.insert(config.sections.lualine_c, "lsp_progress")
  config.sections.lualine_y = {
    -- components.location,
    -- components.progress,
    components.spaces,
    -- components.encoding,
    "fileformat",
    trailing_white,
  }
  lualine.setup(config)
end

