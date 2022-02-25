local builtin_list = vim.tbl_keys(require "telescope.builtin")
local extensions_list = vim.tbl_keys(require("telescope._extensions").manager)
local options_list = vim.tbl_keys(require("telescope.config").values)
local extensions_subcommand_dict = require("telescope.command").get_extensions_subcommand()
local actions = vim.tbl_keys(require "telescope.actions")

-- Telescope find_files
require("telescope.builtin").find_files()

-- Telescope find_files hidden=true layout_config={"prompt_position":"top"}
require("telescope.builtin").find_files { hidden = true, layout_config = { prompt_position = "top" } }

-- Telescope find_files layout_strategy=vertical layout_config={"width":0.5}
require("telescope.builtin").find_files { layout_strategy = "vertical", layout_config = { width = 0.5 } }

-- Telescope find_files theme=ivy
require("telescope.builtin").find_files(require("telescope.themes").get_ivy {})
require("telescope.builtin").find_files(require("telescope.themes").get_ivy { winblend = 10 })

-- Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_prefix=🔍
require("telescope.builtin").find_files {
  find_command = { "rg", "--ignore", "--hidden", "--files" },
  prompt_prefix = "🔍",
}

-- Telescope man_pages sections=2, (comma is required because it needs to be a list)
require("telescope.builtin").man_pages { sections = { "2" } }

-- extensions
-- Telescope sessions layout_config={"prompt_position":"top"}
require("telescope").extensions.sessions.sessions { layout_config = { prompt_position = "top" } }

-- Telescope sessions layout_strategy=bottom_pane layout_config={"prompt_position":"top"}
require("telescope").extensions.sessions.sessions {
  layout_strategy = "bottom_pane",
  layout_config = { prompt_position = "top" },
}

-- layout
local layout_config = {
  horizontal = {
    width = 0.8,
    height = 0.9,
    prompt_position = "bottom",
    preview_cutoff = 120,
  },
  vertical = {
    width = 0.8,
    height = 0.9,
    prompt_position = "bottom",
    preview_cutoff = 40,
  },
  center = {
    width = 0.8,
    height = 0.9,
    preview_cutoff = 40,
    prompt_position = "top",
  },
  cursor = {
    width = 0.8,
    height = 0.9,
    preview_cutoff = 40,
  },
  bottom_pane = {
    height = 25,
    prompt_position = "top",
  },
}

-- 1.horizontal
require("telescope.builtin").find_files {
  layout_strategy = "horizontal",
  layout_config = { preview_width = 0.6 },
}

require("telescope.builtin").find_files {
  layout_strategy = "horizontal",
  layout_config = { preview_width = 0.6, prompt_position = "top" },
  sorting_strategy = "ascending",
}

-- 2.vertical
require("telescope.builtin").find_files {
  layout_strategy = "vertical",
  layout_config = { preview_cutoff = 30, height = 0.99, preview_height = 0.6 },
}

require("telescope.builtin").find_files {
  layout_strategy = "vertical",
  layout_config = { prompt_position = "top" },
  sorting_strategy = "ascending",
}

require("telescope.builtin").find_files {
  layout_strategy = "vertical",
  layout_config = { preview_cutoff = 30, height = 0.99, preview_height = 0.6, prompt_position = "top" },
  sorting_strategy = "ascending",
}

require("telescope.builtin").find_files {
  layout_strategy = "vertical",
  layout_config = { preview_cutoff = 30, height = 0.99, preview_height = 0.6, prompt_position = "top", mirror = true },
  sorting_strategy = "ascending",
}

-- 3.center
require("telescope.builtin").find_files {
  layout_strategy = "center",
  layout_config = { prompt_position = "top" },
  sorting_strategy = "ascending",
}

-- 4.bottom_pane
require("telescope.builtin").find_files {
  layout_strategy = "bottom_pane",
  layout_config = { prompt_position = "top" },
  sorting_strategy = "ascending",
}

-- themes
require("telescope.themes").get_ivy {
  border = true,
  borderchars = {
    preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
    results = { " " },
  },
  layout_config = {
    height = 25,
  },
  layout_strategy = "bottom_pane",
  preview_title = "",
  sorting_strategy = "ascending",
  theme = "ivy",
}

require("telescope.themes").get_dropdown {
  border = true,
  borderchars = {
    preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
    results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
  },
  layout_config = {
    -- height = <function 2>,
    preview_cutoff = 1,
    -- width = <function 3>,
  },
  layout_strategy = "center",
  preview_title = "Preview",
  results_title = false,
  sorting_strategy = "ascending",
  theme = "dropdown",
}

require("telescope.themes").get_cursor {
  borderchars = {
    preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
    results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
  },
  layout_config = {
    height = 9,
    width = 80,
  },
  layout_strategy = "cursor",
  results_title = false,
  sorting_strategy = "ascending",
  theme = "cursor",
}

-- builtins
--[[
{
  autocommands = <function 1>,
  buffers = <function 2>,
  builtin = <function 3>,
  colorscheme = <function 4>,
  command_history = <function 5>,
  commands = <function 6>,
  current_buffer_fuzzy_find = <function 7>,
  current_buffer_tags = <function 8>,
  fd = <function 9>,
  file_browser = <function 10>,
  filetypes = <function 11>,
  find_files = <function 12>,
  git_bcommits = <function 13>,
  git_branches = <function 14>,
  git_commits = <function 15>,
  git_files = <function 16>,
  git_stash = <function 17>,
  git_status = <function 18>,
  grep_string = <function 19>,
  help_tags = <function 20>,
  highlights = <function 21>,
  jumplist = <function 22>,
  keymaps = <function 23>,
  live_grep = <function 24>,
  loclist = <function 25>,
  lsp_code_actions = <function 26>,
  lsp_definitions = <function 27>,
  lsp_document_diagnostics = <function 28>,
  lsp_document_symbols = <function 29>,
  lsp_dynamic_workspace_symbols = <function 30>,
  lsp_implementations = <function 31>,
  lsp_range_code_actions = <function 32>,
  lsp_references = <function 33>,
  lsp_type_definitions = <function 34>,
  lsp_workspace_diagnostics = <function 35>,
  lsp_workspace_symbols = <function 36>,
  man_pages = <function 37>,
  marks = <function 38>,
  oldfiles = <function 39>,
  pickers = <function 40>,
  planets = <function 41>,
  quickfix = <function 42>,
  registers = <function 43>,
  reloader = <function 44>,
  resume = <function 45>,
  search_history = <function 46>,
  spell_suggest = <function 47>,
  symbols = <function 48>,
  tags = <function 49>,
  tagstack = <function 50>,
  treesitter = <function 51>,
  vim_options = <function 52>
}
--]]

for name, plug in pairs(_G.packer_plugins) do
  if not plug.path then
    print(name)
  end
end
