-- [lualine](https://github.com/nvim-lualine/lualine.nvim/wiki/Introduction)

-- lualine's components:
-- branch (git branch)
-- buffers (shows currently available buffers)
-- diagnostics (diagnostics count from your prefered source)
-- diff (git diff status)
-- encoding (file encoding)
-- fileformat (file format)
-- filename
-- filesize
-- filetype
-- hostname
-- location (location in file in line:column format)
-- mode (vim mode)
-- progress (%progress in file)
-- tabs (shows currently available tabs)

-- LunarVim's components:
-- mode, branch, filename, diff, python_env, diagnostics, treesitter, lsp, location, progress, spaces, encoding, filetype, scrollbar

local M = {}

M.lvim = function()
  -- <https://www.lunarvim.org/configuration/06-statusline.html>
  -- <https://github.com/jimcornmell/lvim/blob/main/lua/user/lualine.lua>

  lvim.builtin.lualine.style = "lvim" -- or "default", "lvim", "none"

  -- local custom_gruvbox = require "lualine.themes.gruvbox_dark"
  -- custom_gruvbox.insert.b = { fg = custom_gruvbox.insert.a.bg, gui = "bold" }
  -- custom_gruvbox.visual.b = { fg = custom_gruvbox.visual.a.bg, gui = "bold" }
  -- custom_gruvbox.replace.b = { fg = custom_gruvbox.replace.a.bg, gui = "bold" }
  -- custom_gruvbox.command.b = { fg = custom_gruvbox.command.a.bg, gui = "bold" }
  -- lvim.builtin.lualine.options.theme = custom_gruvbox -- or "auto", "onedarker", "gruvbox"

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
    table.insert(config.sections.lualine_c, "lsp_progress")
    config.sections.lualine_y = {
      -- components.location,
      -- components.progress,
      -- components.spaces,
      -- components.encoding,
      "fileformat",
    }
    lualine.setup(config)
  end
end

M.arrow = function()
  local line = require "user.lualine.arrow"
  lvim.builtin.lualine = vim.tbl_deep_extend("force", lvim.builtin.lualine, line)
end

M.pencil = function()
  local line = require "user.lualine.arrow"
  line.options.component_separators = { left = "│", right = "│" }
  lvim.builtin.lualine = vim.tbl_deep_extend("force", lvim.builtin.lualine, line)
end

M.blank = function()
  local line = require "user.lualine.arrow"
  line.options.component_separators = { left = "", right = "" }
  line.options.section_separators = { left = "", right = "" }
  lvim.builtin.lualine = vim.tbl_deep_extend("force", lvim.builtin.lualine, line)
end

M.block = function()
  local line = require "user.lualine.arrow"
  line.options.component_separators = { left = "│", right = "│" }
  line.options.section_separators = { left = "", right = "" }
  lvim.builtin.lualine = vim.tbl_deep_extend("force", lvim.builtin.lualine, line)
end

M.arc = function()
  local line = require "user.lualine.arrow"
  line.options.component_separators = { left = "│", right = "│" }
  line.options.section_separators = { left = "", right = "" }
  lvim.builtin.lualine = vim.tbl_deep_extend("force", lvim.builtin.lualine, line)
end

M.bubbles = function()
  local line = require "user.lualine.arrow"
  line.options.component_separators = { left = "│", right = "│" }
  line.options.section_separators = { left = "", right = "" }
  local a = line.sections.lualine_a
  a[1].separator = { left = "", right = "" }
  local z = line.sections.lualine_z
  z[#z].separator = { left = "", right = "" }
  lvim.builtin.lualine = vim.tbl_deep_extend("force", lvim.builtin.lualine, line)
end

return M
