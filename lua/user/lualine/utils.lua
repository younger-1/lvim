local conditions = require "lvim.core.lualine.conditions"
local colors = require "lvim.core.lualine.colors"

local M = {}

M.mode = {
  function()
    return " "
  end,
  padding = { left = 0, right = 0 },
  color = {},
  cond = nil,
}

M.lock = {
  separator = { left = "", right = "" },
  function()
    if not vim.o.modifiable then
      return ""
    elseif vim.o.readonly then
      return ""
    else
      return ""
    end
  end,
  padding = 0,
  -- color = { fg = "#88c0d0", bg = "#bf616a" },
}

M.branch = {
  "b:gitsigns_head",
  icon = "",
  color = { gui = "bold" },
  cond = conditions.hide_in_width,
}

M.filename = {
  "filename",
  color = {},
  cond = nil,
}

local function diff_source()
  local gitsigns = vim.b.gitsigns_status_dict
  if gitsigns then
    return {
      added = gitsigns.added,
      modified = gitsigns.changed,
      removed = gitsigns.removed,
    }
  end
end

M.diff = {
  "diff",
  source = diff_source,
  symbols = { added = " ", modified = "柳 ", removed = " " },
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.yellow },
    removed = { fg = colors.red },
  },
  color = {},
  cond = nil,
}

M.diagnostics = {
  "diagnostics",
  sources = { "nvim_lsp" },
  symbols = { error = " ", warn = " ", info = " ", hint = " " },
  color = {},
  cond = conditions.hide_in_width,
}

M.treesitter = {
  function()
    local b = vim.api.nvim_get_current_buf()
    if next(vim.treesitter.highlighter.active[b]) then
      return ""
    end
    return ""
  end,
  color = { fg = colors.green },
  cond = conditions.hide_in_width,
}

M.filetype = {
  "filetype",
  cond = conditions.hide_in_width,
  color = {},
}

M.tab_space = {
  function()
    if not vim.api.nvim_buf_get_option(0, "expandtab") then
      return "TAB:" .. vim.api.nvim_buf_get_option(0, "tabstop")
    end
    local size = vim.api.nvim_buf_get_option(0, "shiftwidth")
    if size == 0 then
      size = vim.api.nvim_buf_get_option(0, "tabstop")
    end
    return "SPC:" .. size
  end,
  cond = conditions.hide_in_width,
  color = {},
  padding = { left = 1, right = 0 },
}

M.fileformat = {
  "fileformat",
  cond = conditions.hide_in_width,
  padding = { left = 1, right = 0 },
}

M.filesize = {
  "filesize",
  cond = conditions.hide_in_width,
  padding = { left = 1, right = 0 },
}

M.encoding = {
  "o:encoding",
  fmt = string.upper,
  color = {},
  cond = conditions.hide_in_width,
  padding = { left = 1, right = 0 },
}

M.trailing_white = {
  function()
    return vim.fn.search([[\s\+$]], "nw") ~= 0 and "TW" or ""
  end,
  padding = { left = 1, right = 0 },
}

M.location = {
  "location",
  cond = conditions.hide_in_width,
  padding = { left = 1, right = 0 },
  color = {},
}

M.scrollbar = {
  function()
    local current_line = vim.fn.line "."
    local total_lines = vim.fn.line "$"
    local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
    local line_ratio = current_line / total_lines
    local index = math.ceil(line_ratio * #chars)
    return chars[index]
  end,
  padding = { left = 0, right = 0 },
  color = { fg = colors.yellow, bg = colors.bg },
  cond = nil,
}

M.get_short_cwd = function()
  return vim.fn.fnamemodify(vim.fn.getcwd(), ":~")
end

local function is_loclist()
  return vim.fn.getloclist(0, { filewinid = 1 }).filewinid ~= 0
end

M.quickfix_label = function()
  return is_loclist() and "Location List" or "Quickfix List"
end

M.quickfix_title = function()
  if is_loclist() then
    return vim.fn.getloclist(0, { title = 0 }).title
  end
  return vim.fn.getqflist({ title = 0 }).title
end

local function trouble_text()
  return "Trouble"
end

local function trouble_type()
  local config = require "trouble.config"
  -- "lsp_workspace_diagnostics", "lsp_document_diagnostics", "quickfix", "lsp_references", "loclist"
  if config.options.mode == "lsp_workspace_diagnostics" then
    return " [Workspace Diagnostics]"
  elseif config.options.mode == "lsp_document_diagnostics" then
    return " [Document Diagnostics]"
  elseif config.options.mode == "lsp_definitions" then
    return " [Definitions]"
  elseif config.options.mode == "lsp_implementations" then
    return " [Implementations]"
  elseif config.options.mode == "lsp_references" then
    return " [References]"
  elseif config.options.mode == "quickfix" then
    return " [Quickfix]"
  elseif config.options.mode == "loclist" then
    return " [Loclist]"
  elseif config.options.mode == "todo" then
    return " [TODO]"
  else
    -- For other trouble providers
    return "[" .. config.options.mode .. "]"
  end
end

M.trouble = {
  filetypes = { "Trouble" },
  sections = {
    lualine_a = { { trouble_text, icon = "🚦" } },
    lualine_b = { trouble_type },
  },
}

return M
