local conditions = require "lvim.core.lualine.conditions"

local M = {}

M.fileformat = { "fileformat", cond = conditions.hide_in_width }
M.filesize = { "filesize", cond = conditions.hide_in_width }
M.spaces = {
  function()
    if not vim.api.nvim_buf_get_option(0, "expandtab") then
      return "Tab size: " .. vim.api.nvim_buf_get_option(0, "tabstop") .. " "
    end
    local size = vim.api.nvim_buf_get_option(0, "shiftwidth")
    if size == 0 then
      size = vim.api.nvim_buf_get_option(0, "tabstop")
    end
    return "Spaces: " .. size .. " "
  end,
  cond = conditions.hide_in_width,
  color = {},
}

M.trailing_white = function()
  return vim.fn.search([[\s\+$]], "nw") ~= 0 and "TW" or ""
end

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
