local utils = require "user.lualine.utils"
local components = require "lvim.core.lualine.components"

-- stylua: ignore start
local colors = {
  bg         = "#202328",
  fg         = "#bbc2cf",
  yellow     = "#ECBE7B",
  cyan       = "#008080",
  darkblue   = "#081633",
  green      = "#98be65",
  orange     = "#FF8800",
  violet     = "#a9a1e1",
  magenta    = "#c678dd",
  blue       = "#51afef",
  red        = "#ec5f67",
}
-- stylua: ignore end

local config = {
  extensions = { "nvim-tree", "quickfix", "fugitive", "toggleterm", utils.trouble },
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = "", right = "" },
    -- component_separators = {left = "║", right = "║"},
    -- component_separators = {left = "│", right = "│"},
    -- component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    -- section_separators = { left = "", right = "" },
    disabled_filetypes = { "dashboard", "Outline" },
  },
  sections = {
    lualine_a = {
      utils.mode,
      utils.lock,
    },
    lualine_b = {
      utils.branch,
      utils.filename,
    },
    lualine_c = {
      utils.diff,
      components.python_env,
    },
    lualine_x = {
      utils.diagnostics,
      utils.treesitter,
      components.lsp,
      utils.filetype,
    },
    lualine_y = {},
    lualine_z = {
      utils.tab_space,
      utils.fileformat,
      utils.filesize,
      utils.encoding,
      utils.trailing_white,
      utils.location,
      utils.scrollbar,
    },
  },
  inactive_sections = {
    lualine_a = { utils.filename },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

-- <https://github.com/arkav/lualine-lsp-progress>
ins_left {
  "lsp_progress",
  display_components = { "lsp_client_name", "spinner", { "title", "percentage", "message" } },
  colors = {
    percentage = colors.orange,
    title = colors.blue,
    message = colors.green,
    spinner = colors.cyan,
    lsp_client_name = colors.magenta,
    use = true,
  },
  separators = {
    component = " ",
    progress = " | ",
    percentage = { pre = "", post = "%% " },
    title = { pre = "", post = ": " },
    lsp_client_name = { pre = "[", post = "]" },
    spinner = { pre = "", post = "" },
    message = { pre = "(", post = ")" },
    -- message = { commenced = 'In Progress', completed = 'Completed' },
  },
  timer = { progress_enddelay = 500, spinner = 1000, lsp_client_name_enddelay = 1000 },
  spinner_symbols = { "🌑 ", "🌒 ", "🌓 ", "🌔 ", "🌕 ", "🌖 ", "🌗 ", "🌘 " },
}

return config
