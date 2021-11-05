-- Telescope
--[[ tips:
  <C-e> to put command to commandline, creates new file in current directory
  <C-q> to send all results to quickfix and <M-q> to send selected items
  -- TODO:
  https://github.com/rafamadriz/NeoCode/blob/main/lua/modules/plugins/telescope.lua
--]]
local actions = require "telescope.actions"
local _tele = require "user.telescope.utils"
lvim.builtin.telescope = vim.tbl_deep_extend("force", lvim.builtin.telescope, {
  defaults = {
    -- 🔍
    -- prompt_prefix = "  ",
    -- selection_caret = " ",
    -- selection_caret = "❯ ",
    entry_prefix = "  ",
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
    },
    file_ignore_patterns = {
      "node_modules",
      ".git[/\\]",
    },
    -- horizontal, center, cursor, vertical, flex, bottom_pane
    layout_strategy = "horizontal",
    layout_config = {
      width = 0.8,
      horizontal = { mirror = false, preview_width = 0.6 },
      vertical = { mirror = false },
    },
    winblend = 25,
    dynamic_preview_title = true,
    path_display = { truncate = 5 },
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
        ["<C-r>"] = actions.smart_send_to_loclist + actions.open_loclist,
        -- ["<C-_>"] = require("telescope.actions.generate").which_key {
        --   name_width = 20, -- typically leads to smaller floats
        --   max_height = 0.2, -- increase potential maximum height
        --   seperator = " ⇐ ", -- change sep between mode, keybind, and name
        --   close_with_action = false, -- do not close float on action
        -- },
      },
      n = {
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
        ["<C-r>"] = actions.smart_send_to_loclist + actions.open_loclist,
        ["<C-_>"] = actions.which_key, -- Keys to produce <C-/>
      },
    },
  },
  -- [feat: theme setting apply to all pickers](https://github.com/nvim-telescope/telescope.nvim/issues/938)
  pickers = {
    -- get_cursor(), get_dropdown(), get_ivy()
    -- find_files = require("telescope.themes").get_ivy(),
    autocommands = _tele.v1,
    buffers = { theme = "ivy" },
    colorscheme = _tele.h4,
    commands = { theme = "ivy" },
    current_buffer_fuzzy_find = _tele.v2,
    file_browser = _tele.h2,
    find_files = _tele.v1,
    git_bcommits = _tele.h3,
    git_commits = _tele.h3,
    git_files = _tele.h3,
    git_status = _tele.h3,
    grep_string = { theme = "ivy" },
    live_grep = _tele.h1,
    lsp_code_actions = { theme = "cursor" },
    lsp_range_code_actions = { theme = "cursor" },
    man_pages = _tele.h1,
    marks = _tele.h1,
    oldfiles = _tele.v4,
    git_branches = {
      mappings = {
        i = {
          ["<C-f>"] = actions.preview_scrolling_down,
        },
        n = {
          ["<C-f>"] = actions.preview_scrolling_down,
        },
      },
    },
  },
  extensions = {
    -- https://github.com/nvim-telescope/telescope-fzf-native.nvim
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
    },
    frecency = {
      -- db_root = "home/my_username/path/to/db_root",
      show_scores = true,
      show_unindexed = true,
      ignore_patterns = { "*.git/*", "*/tmp/*" },
      workspaces = {
        -- [](https://github.com/nvim-telescope/telescope-frecency.nvim/issues/21)
        ["conf"] = vim.fn.expand "~/.config",
        ["data"] = vim.fn.expand "~/.local/share",
        ["dot"] = vim.fn.expand "~/dotter",
        ["beauty"] = vim.fn.expand "~/Beauty",
        ["project"] = vim.fn.expand "~/projects",
        ["wiki"] = vim.fn.expand "~/wiki",
      },
    },
  },
})

lvim.builtin.telescope.on_config_done = function()
  local trouble = require "trouble.providers.telescope"
  lvim.builtin.telescope.defaults.mappings.i["<c-g>"] = trouble.open_with_trouble
  lvim.builtin.telescope.defaults.mappings.n["<c-g>"] = trouble.open_with_trouble
end
