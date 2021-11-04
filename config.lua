--  ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗
--  ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║
--  ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║
--  ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║
--  ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║
--  ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝

---[[--------------------------------------------]]---
--      config.lua - Configuration for LunarVim     --
--             Author: Younger-1@github             --
---[[--------------------------------------------]]---

--[[
  disable = boolean,           -- Mark a plugin as inactive
  as = string,                 -- Specifies an alias under which to install the plugin
  installer = function,        -- Specifies custom installer. See |packer-custom-installers|
  updater = function,          -- Specifies custom updater. See |packer-custom-installers|
  after = string or list,      -- Specifies plugins to load before this plugin.
  rtp = string,                -- Specifies a subdirectory of the plugin to add to runtimepath.
  opt = boolean,               -- Manually marks a plugin as optional.
  branch = string,             -- Specifies a git branch to use
  tag = string,                -- Specifies a git tag to use
  commit = string,             -- Specifies a git commit to use
  lock = boolean,              -- Skip this plugin in updates/syncs
  run = string, function, or table  -- Post-update/install hook. See |packer-plugin-hooks|
  requires = string or list    -- Specifies plugin dependencies. See |packer-plugin-dependencies|
  config = string or function, -- Specifies code to run after this plugin is loaded.
  rocks = string or list,      -- Specifies Luarocks dependencies for the plugin
  -- The following keys all imply lazy-loading
  cmd = string or list,        -- Specifies commands which load this plugin.  Can be an autocmd pattern.
  ft = string or list,         -- Specifies filetypes which load this plugin.
  keys = string or list,       -- Specifies maps which load this plugin. See |packer-plugin-keybindings|
  event = string or list,      -- Specifies autocommand events which load this plugin.
  fn = string or list          -- Specifies functions which load this plugin.
  cond = string, function, or list of strings/functions,   -- Specifies a conditional test to load this plugin
  setup = string or function,  -- Specifies code to run before this plugin is loaded.
  module = string or list      -- Specifies Lua module names for require. When requiring a string which starts
                               -- with one of these module names, the plugin will be loaded.
  module_pattern = string/list -- Specifies Lua pattern of Lua module names for require. When requiring a string
                               -- which matches one of these patterns, the plugin will be loaded.
--]]

require "user.cfg.global"
require "user.cfg.option"
require "user.theme.dash-pic"

young = "Young"

-- General
lvim.format_on_save = false
lvim.transparent_window = false
lvim.colorscheme = "onedarker"
lvim.log.level = "info"

lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.dap.active = true
lvim.builtin.notify.active = true
vim.notify = require("notify")
lvim.builtin.gitsigns.opts.numhl = true
lvim.builtin.gitsigns.opts.keymaps["x ih"] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>'
lvim.builtin.cmp.confirm_opts.select = false

-- [lualine](https://github.com/nvim-lualine/lualine.nvim/wiki/Introduction)
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

-- LSP
lvim.lsp.automatic_servers_installation = false
lvim.lsp.diagnostics.virtual_text = false

---@usage Select which servers should be configured manually. Requires `:LvimCacheRest` to take effect.
-- vim.list_extend(lvim.lsp.override, { "jdtls" })

-- require("user.json_schemas").setup()
-- [](https://github.com/LunarVim/LunarVim/issues/1639)
-- [jsonls](https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#jsonls)
-- merely add `require("lsp").setup "json"` to `ftplugin/jsonc.lua` doesn't work
-- lvim.lang.json.lsp.setup.filetypes = { "json", "jsonc" }

require("lvim.lsp.null-ls.formatters").setup {
  { exe = "stylua" },
  { exe = "markdownlint", args = { "--config", vim.fn.expand "~/dotter/markdownlint.jsonc" } },
  { exe = "prettier", filetypes = { "yaml" } },
  { exe = "clang_format", filetypes = { "cpp" } },
}
require("lvim.lsp.null-ls.linters").setup {
  -- { exe = "selene" },
  { exe = "markdownlint", args = { "--config", vim.fn.expand "~/dotter/markdownlint.jsonc" } },
  -- { exe = "cppcheck" },
}

-- Treesitter
-- for finding syntax ids for non TS enabled languages
vim.cmd [[
map <F3> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>
]]

lvim.builtin.treesitter = vim.tbl_deep_extend("force", lvim.builtin.treesitter, {
  ensure_installed = "maintained",
  ignore_install = { "haskell" },
  incremental_selection = {
    enable = true,
    keymaps = {
      -- init_selection = ";;",
      node_incremental = "]s",
      node_decremental = "[s",
      scope_incremental = "]S",
    },
  },
  textobjects = { -- <https://github.com/nvim-treesitter/nvim-treesitter-textobjects>
    move = {
      enable = true,
      set_jumps = false, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]1"] = "@block.inner",
        ["]2"] = "@block.outer",
        ["]-"] = "@call.inner",
        ["]="] = "@call.outer",
        ["]3"] = "@class.inner",
        ["]4"] = "@class.outer",
        ["]k"] = "@comment.outer",
        ["]7"] = "@conditional.inner",
        ["]8"] = "@conditional.outer",
        ["]m"] = "@function.inner",
        ["]f"] = "@function.outer",
        ["]9"] = "@loop.inner",
        ["]0"] = "@loop.outer",
        ["],"] = "@parameter.inner",
        ["]."] = "@parameter.outer",
      },
      -- goto_next_end = {
      --   [";]F"] = "@function.outer",
      --   [";]C"] = "@class.outer",
      -- },
      goto_previous_start = {
        ["[1"] = "@block.inner",
        ["[2"] = "@block.outer",
        ["[-"] = "@call.inner",
        ["[="] = "@call.outer",
        ["[3"] = "@class.inner",
        ["[4"] = "@class.outer",
        ["[k"] = "@comment.outer",
        ["[7"] = "@conditional.inner",
        ["[8"] = "@conditional.outer",
        ["[m"] = "@function.inner",
        ["[f"] = "@function.outer",
        ["[9"] = "@loop.inner",
        ["[0"] = "@loop.outer",
        ["[,"] = "@parameter.inner",
        ["[."] = "@parameter.outer",
      },
      -- goto_previous_end = {
      --   [";[F"] = "@function.outer",
      --   [";[C"] = "@class.outer",
      -- },
    },
    select = {
      enable = true,
      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,
      -- keymaps = textobj_sel_keymaps,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["i1"] = "@block.inner",
        ["a1"] = "@block.outer",
        ["i-"] = "@call.inner",
        ["a-"] = "@call.outer",
        ["i3"] = "@class.inner",
        ["a3"] = "@class.outer",
        ["ak"] = "@comment.outer",
        ["i7"] = "@conditional.inner",
        ["a7"] = "@conditional.outer",
        ["if"] = "@function.inner",
        ["af"] = "@function.outer",
        ["i9"] = "@loop.inner",
        ["a9"] = "@loop.outer",
        ["i,"] = "@parameter.inner",
        ["a."] = "@parameter.outer",
      },
    },
    swap = {
      enable = true,
      swap_next = {
        [";s"] = "@parameter.inner",
        -- [";nc"] = "@comment.outer",
        -- [";nd"] = "@conditional.outer",
        -- [";nb"] = "@conditional.inner",
      },
      swap_previous = {
        [";S"] = "@parameter.inner",
        -- [";pc"] = "@comment.outer",
        -- [";pd"] = "@conditional.outer",
        -- [";pb"] = "@conditional.inner",
      },
    },
    lsp_interop = {
      enable = true,
      border = "none",
      peek_definition_code = {
        ["gmf"] = "@function.outer",
        ["gmF"] = "@class.outer",
      },
    },
  },
  refactor = { -- <https://github.com/nvim-treesitter/nvim-treesitter-refactor>
    highlight_definitions = { enable = false },
    highlight_current_scope = { enable = false },
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "gmr",
      },
    },
    navigation = {
      enable = true,
      keymaps = {
        goto_definition = "gmd",
        list_definitions = "gmD",
        list_definitions_toc = "gmo",
        goto_next_usage = "]v",
        goto_previous_usage = "[v",
      },
    },
  },
  playground = { -- <https://github.com/nvim-treesitter/playground>
    enable = true,
    keybindings = {
      toggle_query_editor = "o",
      toggle_hl_groups = "i",
      toggle_injected_languages = "t",
      toggle_anonymous_nodes = "a",
      toggle_language_display = "I",
      focus_language = "f",
      unfocus_language = "F",
      update = "R",
      goto_node = "<cr>",
      show_help = "?",
    },
  },
  tree_docs = { -- <https://github.com/nvim-treesitter/nvim-tree-docs>
    enable = false,
  },
  textsubjects = { -- <https://github.com/RRethy/nvim-treesitter-textsubjects>
    enable = true,
    keymaps = { ["."] = "textsubjects-smart", [","] = "textsubjects-container-outer" },
  },
  autotag = { -- windwp/nvim-ts-autotag
    enable = true,
    filetypes = { "html", "xml" },
  },
  autopairs = { -- windwp/nvim-autopairs
    enable = true,
  },
  rainbow = { -- p00f/nvim-ts-rainbow
    enable = true,
    max_file_lines = 3000,
  },
})

-- Telescope
--[[ tips:
  <C-e> to put command to commandline, creates new file in current directory
  <C-q> to send all results to quickfix and <M-q> to send selected items
  -- TODO:
  https://github.com/rafamadriz/NeoCode/blob/main/lua/modules/plugins/telescope.lua
--]]
local actions = require "telescope.actions"
local _tele = require "user.telescope"
lvim.builtin.telescope = vim.tbl_deep_extend("force", lvim.builtin.telescope, {
  defaults = {
    -- 🔍
    -- prompt_prefix = "  ",
    -- selection_caret = " ",
    -- selection_caret = "❯ ",
    entry_prefix = "  ",
    vimgrep_arguments = {
      "rg",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
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

-- Project
lvim.builtin.project = vim.tbl_deep_extend("force", lvim.builtin.project, {
  exclude_dirs = {},
  -- Show hidden files in telescope
  show_hidden = false,
  -- When set to false, you will get a message when project.nvim changes your directory.
  silent_chdir = false,
})

-- Keymappings
-- View all the defaults by pressing <leader>Lk
-- lvim.leader = "space"
lvim.keys = vim.tbl_deep_extend("force", lvim.keys, {
  -- require("lvim.keymappings").append_to_defaults {
  -- <https://github.com/mskar/setup/blob/main/config.lua>
  insert_mode = {
    ["<C-U>"] = "<C-G>u<C-U>",
    ["<C-W>"] = "<C-G>u<C-W>",
    ["<C-V>"] = "<C-G>u<C-R><C-O>+",
    ["<C-a>"] = "<Home>",
    ["<C-e>"] = "<End>",
    -- ["<C-b>"] = "<Left>",
    -- ["<C-f>"] = "<Right>",
  },
  command_mode = {
    ["<C-V>"] = "<C-R>+",
    ["<C-a>"] = "<Home>",
  },
  normal_mode = {
    Y = "y$",
    ZA = ":wqa<CR>",
    ["g<C-l>"] = "<cmd>nohlsearch<cr><C-l>",
    ["]e"] = ":lnext<CR>",
    ["[e"] = ":lprev<CR>",
    ["<C-e>"] = ":call LocListToggle()<CR>",
    ["+"] = ":SymbolsOutline<cr>",
    k = { "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true } },
    j = { "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true } },
  },
  term_mode = {
    JJ = "<C-\\><C-N>",
    JK = "<C-\\><C-N>",
  },
  visual_mode = {
    Y = [["+y]],
    d = [["_d]],
    X = [["+x]],
  },
  -- visual_block_mode = {},
})

vim.cmd [[
onoremap H ^
vnoremap H ^
onoremap L $
vnoremap L $

nnoremap & :<c-u>/g<home>%s/<c-r><c-w>/

" Open in VSCode from Vim
command! OpenInVSCode exe '!code --goto "' . expand('%') . ':' . line('.') . ':' . col('.') . '"' | redraw!
" Open in VSCode from Vim and preserve the working directory
command! OpenCwdInVSCode exe 'silent !code "' . getcwd() . '" --goto "' . expand('%') . ':' . line('.') . ':' . col('.') . '"' | redraw!

function! TabMessage(cmd)
  redir => message
  silent execute a:cmd
  redir END
  if empty(message)
    echoerr "This command do NOT have output"
  else
    " Use "new" instead of "tabnew" below if you prefer split windows instead of tabs
    tabnew
    setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted nomodified
    silent put=message
  endif
endfunction

command! -nargs=+ -complete=command TabMessage call TabMessage(<q-args>)
]]

-- Whichkey
-- :h keycodes
-- [operators motions objects](https://github.com/folke/which-key.nvim/blob/main/lua/which-key/plugins/presets/init.lua)
-- [g z nav windows](https://github.com/folke/which-key.nvim/blob/main/lua/which-key/plugins/presets/misc.lua)
--[[
:WhichKey " show all mappings
:WhichKey <leader> " show all <leader> mappings
:WhichKey <leader> v " show all <leader> mappings for VISUAL mode
:WhichKey '' v " show ALL mappings for VISUAL mode
--]]
lvim.builtin.which_key = vim.tbl_deep_extend("force", lvim.builtin.which_key, {
  setup = {
    plugins = {
      -- The presets plugin, adds help for a bunch of default keybindings in Neovim
      -- No actual key bindings are created
      presets = {
        operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
        motions = true, -- adds help for motions
        text_objects = true, -- help for text objects triggered after entering an operator
      },
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    operators = { gc = "Comments" },
    key_labels = {
      -- override the label used to display some keys. It doesn't effect WK in any other way.
      -- ["<space>"] = "<SPC>",
      -- ["<cr>"] = "<RET>",
      -- ["<Tab>"] = "<TAB>",
    },
    ignore_missing = false,
  },
  -- NOTE: Prefer using : over <cmd> as the latter avoids going back in normal-mode.
  -- see https://neovim.io/doc/user/map.html#:map-cmd
  vmappings = {
    ["/"] = { ":CommentToggle<CR>", "Comment" },
    g = {
      name = "git",
      y = "Link",
    },
    l = {
      name = "lsp",
      f = { "<Cmd>vim.lsp.buf.range_formatting()<CR>", "Format" },
    },
    p = {
      name = "pack",
      I = { 'y:lua pp(<C-r>")', "Inspect" },
    },
    s = {
      name = "search",
      f = { 'y<cmd>Telescope fd<CR><C-r>"', "Find files" },
      g = { 'y<cmd>Telescope live_grep<CR><C-r>"', "Grep" },
      y = { "dh<cmd>Telescope neoclip<CR>", "Clipboard" },
    },
  },

  mappings = {
    ["?"] = {
      name = "Vim",
      ["?"] = { ":h reference_toc<CR>", "❓" },
      i = { ":h index<CR>", "Index" },
      I = { ":h insert-index<CR>", "Insert Index" },
      n = { ":viu<CR>", "Normal Index" },
      t = { ":h objects<CR>", "Text objects" },
      w = { ":h ctrl-w<CR>", "Windows Index" },
      y = { ":h [<CR>", "[ ] Index" },
      g = { ":h g<CR>", "g Index" },
      z = { ":h z<CR>", "z Index" },
      x = { ":h visual-index<CR>", "Visual Index" },
      e = { ":exu<CR>", "Ex-cmd Index" },
      E = { ":h ex-edit-index<CR>", "Ex-edit Index" },
      [" "] = { ":h api<CR>", "Api" },
      h = { ":h help-tags<CR>", "Help tags" },
      H = { ":h help-summary<CR>", "Help" },
      N = { ":h notation<CR>", "Notation" },
      k = { ":h key-codes<CR>", "Key Codes" },
      u = { ":h user-manual<CR>", "User Manual" },
      s = { ":h startup<CR>", "Startup" },
      o = { ":options<CR>", "Options" },
      O = { ":h option-list<CR>", "Option List" },
      q = { ":h quickref<CR>", "Quick Reference" },
      f = { ":h vim-function<CR>", "Functions" },
      F = { ":h function-list<CR>", "Function List" },
      m = { ":h vim-modes<CR>", "Modes" },
      M = { ":h map-modes<CR>", "Map Modes" },
      v = { ":h vim-variable<CR>", "Vim Variable" },
      a = { ":h vim-arguments<CR>", "Vim Arguments" },
      A = { ":h vim-additions<CR>", "Vim Additions" },
      d = { ":h nvim-defaults<CR>", "Defaults" },
      p = { ":h local-additions<CR>", "Plugin" },
      T = { ":h tips<CR>", "Tips" },
      l = { ":h lua<CR>", "Lua" },
      L = { ":h lsp<CR>", "LSP" },
    },
    C = { ":call OpenLastClosed()<CR>", "which_key_ignore" },
    f = { "<cmd>lua require('lir.float').toggle()<cr>", "Files" },
    g = {
      -- ["<tab>"] = {},
      [" "] = {
        name = "gist",
        a = { "<cmd>Gist -b -a<cr>", "Create Anon" },
        d = { "<cmd>Gist -d<cr>", "Delete" },
        f = { "<cmd>Gist -f<cr>", "Fork" },
        g = { "<cmd>Gist -b<cr>", "Create" },
        l = { "<cmd>Gist -l<cr>", "List" },
        p = { "<cmd>Gist -b -p<cr>", "Create Private" },
      },
      ["<C-q>"] = {
        name = "quickfix",
        c = { "<cmd>Gitsigns setqflist<cr>", "Current" },
        b = { "<cmd>lua require 'gitsigns'.setqflist('attached')<cr>", "Buffers" },
        a = { "<cmd>lua require 'gitsigns'.setqflist('all')<cr>", "All Git" },
      },
      ["<C-e>"] = {
        name = "loclist",
        c = { "<cmd>Gitsigns setloclist<cr>", "Current" },
        b = { "<cmd>lua require 'gitsigns'.setloclist('attached')<cr>", "Buffers" },
        a = { "<cmd>lua require 'gitsigns'.setloclist('all')<cr>", "All Git" },
      },
      ["'"] = { "<cmd>Gitsigns toggle_linehl<cr>", "Highlight" },
      ['"'] = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Blames" },
      a = { "<cmd>Telescope git_stash<CR>", "Stash" },
      f = { "<cmd>Telescope git_files<CR>", "Files" },
      h = {
        name = "github",
        -- :lua require('telescope').extensions.gh.issues()
        -- [](https://github.com/nvim-telescope/telescope-github.nvim#options)
        i = { "<cmd>Telescope gh issues<cr>", "Issues" },
        p = { "<cmd>Telescope gh pull_request<cr>", "Pull_request" },
        g = { "<cmd>Telescope gh gist<cr>", "Gist" },
        r = { "<cmd>Telescope gh run<cr>", "Run" },
      },
      n = {
        name = "neogit",
        n = { "<cmd>Neogit<cr>", "♐" },
        c = { "<cmd>lua require('neogit').open({ 'commit' })<cr>", "Commit" },
        s = { "<cmd>lua require('neogit').open({ kind = 'split' })<cr>", "Commit" },
        v = { "<cmd>lua require('neogit').open({ kind = 'vsplit' })<cr>", "Commit" },
      },
      S = { "<cmd>Gitsigns stage_buffer<cr>", "Stage Buffer" },
      U = { "<cmd>Gitsigns reset_buffer_index<cr>", "Reset Buffer Index" },
      y = "Link",
      Y = { "<cmd>lua require'gitlinker'.get_repo_url()<cr>", "Link(Repo)" },
    },
    h = { ":nohlsearch<CR>", "which_key_ignore" },
    j = {
      name = "justify",
    },
    k = {
      name = "kit",
    },
    l = {
      -- c = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
      c = { "<cmd>CodeActionMenu<cr>", "Code Action" },
      -- d = { "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics{ show_header = false, border = 'single' }<cr>", "Diagnostics" },
      ["<C-e>"] = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Diagnostics LocList" },
      W = { "<cmd>lua pp(vim.lsp.buf.list_workspace_folders())<cr>", "Workspace folders" },
      -- f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
      F = {
        function()
          vim.lsp.buf.formatting_sync()
          vim.cmd "write"
        end,
        "Format",
      },
      s = { "<Cmd>lua vim.lsp.buf.document_symbol()<CR>", "Document Symbols" },
      S = { "<Cmd>lua vim.lsp.buf.workspace_symbol()<CR>", "Workspace Symbols" },
      O = { "<Cmd>lua vim.lsp.buf.outgoing_calls()<CR>", "Outgoing Calls" },
      -- I = { "<Cmd>lua vim.lsp.buf.incoming_calls()<CR>", "Incoming Calls" },
      [" "] = {
        name = "Telescope",
        -- DIR
        D = { "<cmd>Telescope lsp_definitions<cr>", "Def" },
        I = { "<cmd>Telescope lsp_implementations<cr>", "Impl" },
        R = { "<cmd>Telescope lsp_references<cr>", "Ref" },
        --
        a = { "<cmd>Telescope lsp_code_actions<cr>", "Code Action" },
        A = { "<cmd>Telescope lsp_range_code_actions<cr>", "Range Action" },
        d = { "<cmd>Telescope lsp_document_diagnostics<cr>", "Document Diagnostics" },
        w = { "<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics" },
        s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
        S = {
          "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
          "Workspace Symbols",
        },
      },
      o = { "<cmd>SymbolsOutline<cr>", "Outline" },
      q = { "", "which_key_ignore" },
      v = { "<cmd>Vista!!<cr>", "Vista" },
      n = { "<cmd>NullLsInfo<cr>", "Null LS" },
    },
    L = {
      C = { "<cmd>LuaCacheClear<cr>", "LuaCache Clear" },
      L = { "<cmd>LuaCacheLog<cr>", "LuaCache Log" },
      P = { "<cmd>LuaCacheProfile<cr>", "LuaCache Profile" },
      R = { "<cmd>LvimCacheReset<cr>", "LvimCache Reset" },
      -- u = { "<cmd>lua require'user.tools'.update_lunarvim()<cr>", "Update LunarVim" },
      b = {
        "<cmd>lua require('telescope.builtin').git_commits { cwd = _G.get_runtime_dir() .. '/lvim' }<cr>",
        "LunarVim Git Branch",
      },
    },
    p = {
      C = { "<cmd>PackerCompile profile=true<cr>", "Compile+" },
      I = { ":lua pp()<left>", "Inspect" },
      s = { "<cmd>PackerStatus<cr>", "Status" },
      S = { "<cmd>PackerSync<cr>", "Sync" },
      -- FIXME:Search list of files of package(under cursor)
      -- o = { "", "Package Files" },
      p = {
        "<cmd>lua require('telescope').extensions.packer.plugins { layout_config = { preview_width = 0.5} }<cr>",
        "Telescope Packer",
      },
      P = { "<cmd>PackerProfile<cr>", "Profile" },
    },
    Q = { ":tabclose<CR>", "which_key_ignore" },
    r = {
      name = "replace",
      r = { "<cmd>lua require('spectre').open()<cr>", "Replace" },
      w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Replace Word" },
      f = { "<cmd>lua require('spectre').open_file_search()<cr>", "Replace Buffer" },
    },
    s = {
      [" "] = { "<cmd>Telescope resume<CR>", "♻️" },
      ["<tab>"] = { "<cmd>Telescope<CR>", "🧙" },
      ["<C-q>"] = { "<cmd>Telescope quickfix<CR>", "QuickList" },
      ["<C-e>"] = { "<cmd>Telescope loclist<CR>", "LocList Bug" },
      ["'"] = { "<cmd>Telescope marks<CR>", "Marks" },
      ['"'] = { "<cmd>Telescope registers<CR>", "Registers" },
      ["/"] = { "<cmd>Telescope search_history<CR>", "Search History" },
      ["?"] = { "<cmd>Telescope help_tags<CR>", "Help" },
      [":"] = { "<cmd>Telescope command_history<CR>", "Command History" },
      ["."] = { "<cmd>Telescope file_browser hidden=v:true<CR>", "Browser" },
      a = { "<cmd>Telescope autocommands<CR>", "Autocommands" },
      b = { "<cmd>Telescope current_buffer_fuzzy_find<CR>", "Buffer String" },
      c = { "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>", "Colorscheme" },
      -- TODO:
      f = { "<cmd>Telescope find_files hidden=v:true no_ignore=v:true<cr>", "Find files" },
      g = { "<cmd>Telescope live_grep <cr>", "Grep" },
      G = { "<cmd>Telescope live_grep grep_open_files=v:true<cr>", "Grep in opened buffer" },
      H = { "<cmd>Telescope highlights<cr>", "Highlights" },
      j = { "<cmd>Telescope jumplist<cr>", "Gump List" },
      m = {
        name = "MRU",
        -- :Telescope frecency frecency default_text=:project:
        c = { "<Cmd>lua require('telescope').extensions.frecency.frecency{ default_text = ':CWD:' }<CR>", "CWD" },
        l = { "<Cmd>lua require('telescope').extensions.frecency.frecency{ default_text = ':LSP:' }<CR>", "LSP" },
        m = { "<Cmd>lua require('telescope').extensions.frecency.frecency()<CR>", "Frecency" },
      },
      n = { "<cmd>Telescope notify<cr>", "Notify" },
      o = {
        [[<cmd>Telescope sessions layout_strategy=bottom_pane layout_config={"prompt_position":"top"}<CR>]],
        "Sessions",
      },
      p = { "<cmd>Telescope projects<CR>", "Projects" },
      P = { "<cmd>Telescope pickers<CR>", "<Pickers>" },
      R = { "<cmd>Telescope reloader<CR>", "Reload Module" },
      s = {
        name = "symbol",
        s = { "<cmd>Telescope symbols<CR>", "Symbols" },
        e = { "<cmd>lua require'telescope.builtin'.symbols{ sources = {'emoji'} }<CR>", "Emoji" },
        g = { "<cmd>lua require'telescope.builtin'.symbols{ sources = {'gitmoji'} }<CR>", "Git" },
        j = { "<cmd>lua require'telescope.builtin'.symbols{ sources = {'julia'} }<CR>", "Julia" },
        k = { "<cmd>lua require'telescope.builtin'.symbols{ sources = {'kaomoji'} }<CR>", "Kaomoji" },
        m = { "<cmd>lua require'telescope.builtin'.symbols{ sources = {'math'} }<CR>", "Math" },
        l = { "<cmd>lua require'telescope.builtin'.symbols{ sources = {'latex'} }<CR>", "LaTeX" },
      },
      S = { "<cmd>Telescope spell_suggest<CR>", "Spell" },
      v = {
        name = "vim",
        c = { "<cmd>Telescope commands<cr>", "Commands" },
        o = { "<cmd>Telescope vim_options<CR>", "Options" },
        f = { "<cmd>Telescope filetypes<CR>", "FileTypes" },
        t = { "<cmd>Telescope current_buffer_tags<CR>", "Tags" },
        T = { "<cmd>Telescope tags<CR>", "All Tags" },
      },
      t = { "<cmd>TodoTelescope<CR>", "Todo" },
      T = { "<cmd>Telescope grep_string<CR>", "Text under cursor" },
      y = { "<cmd>Telescope neoclip<CR>", "Clipboard" },
      z = { "<cmd>lua require'telescope'.extensions.zoxide.list{}<CR>", "Z" },
      -- z = { "<cmd>lua require'telescope'.extensions.z.list{ cmd = {'zoxide', 'query', '-ls'} }<CR>", "Z" },
    },
    t = {
      name = "tog",
      m = { "<cmd>MinimapToggle<cr>", "Minimap" },
      t = { "<cmd>TodoQuickFix<cr>", "Todo" },
    },
    T = {
      t = { "<cmd>Telescope treesitter<CR>", "Telescope" },
      T = { "<cmd>TSHighlightCapturesUnderCursor<cr>", "Highlight" },
      I = { ":TSModuleInfo<CR>", "Telescope" },
      p = { ":TSPlaygroundToggle<cr>", "Playground" },
      r = { ":TSBufToggle rainbow<CR>", "Toggle Rainbow" },
      h = { ":TSBufToggle highlight<CR>", "Toggle Highlight(Buffer)" },
    },
    x = {
      name = "trouble",
      ["<C-q>"] = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
      ["<C-e>"] = { "<cmd>Trouble loclist<cr>", "LocList" },
      ["."] = { "<cmd>Trouble telescope<cr>", "Telescope" },
      x = { "<cmd>TroubleToggle<cr>", "Open" },
      -- DIR
      D = { "<cmd>Trouble lsp_definitions<cr>", "Def" },
      I = { "<cmd>Trouble lsp_implementations<cr>", "Impl" },
      R = { "<cmd>Trouble lsp_references<cr>", "Ref" },
      d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
      w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Workspace Diagnostics" },
      t = { "<cmd>TodoTrouble<cr>", "Todo" },
    },
    z = { "<cmd>ZenMode<cr>", "Zen" },
  },
})

lvim.builtin.which_key.on_config_done = function()
  local which_key = require "which-key"
  local opts = {
    mode = "n", -- NORMAL mode
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
  }
  local mymappings = {
    ["]"] = {
      d = {
        "<cmd>lua vim.lsp.diagnostic.goto_next({popup_opts = {border = lvim.lsp.popup_border}})<cr>",
        "Next Diagnostic",
      },
      c = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
      x = { [[<cmd>lua require('trouble').next({skip_groups=true, jump=true})<CR>]], "Next Trouble" },
    },
    ["["] = {
      d = {
        "<cmd>lua vim.lsp.diagnostic.goto_prev({popup_opts = {border = lvim.lsp.popup_border}})<cr>",
        "Prev Diagnostic",
      },
      c = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
      x = { [[<cmd>lua require('trouble').previous({skip_groups=true, jump=true})<CR>]], "Prev Trouble" },
    },
    ["<C-w>"] = {
      m = "Zoom",
      [" "] = { "<cmd>lua require('focus').focus_toggle()<cr>", "FocusToggle" },
      -- e = "",
      -- t = "",
      -- b = "",
      -- a = "",
      -- d = "",
    },
    ["<C-y>"] = {},
    ["<C-p>"] = {},
    ["<C-s>"] = {},
    -- Must
    ["<C-z>"] = {},
    -- ["<C-a>"] = {},
    -- ["<C-x>"] = {},
    -- ["<C-f>"] = {},
    -- ["<C-b>"] = {},
    -- ["<C-n>"] = {},
    y = {
      c = {
        name = "colorscheme",
        m = { "<cmd>lua require('material.functions').toggle_style()<cr>", "Material" },
        c = { "<cmd>lua require('user.theme').toggle_style()<cr>", "Style" },
      },
      o = {
        name = "options",
        n = { "<cmd>setlocal number!<cr>", "number" },
        r = { "<cmd>setlocal relativenumber!<cr>", "relativenumber" },
        ["|"] = { "<cmd>setlocal cursorcolumn!<cr>", "column" },
        ["-"] = { "<cmd>setlocal cursorline!<cr>", "line" },
        l = { "<cmd>setlocal list!<cr>", "list" },
        s = { "<cmd>setlocal spell!<cr>", "spell" },
        w = { "<cmd>setlocal wrap!<cr>", "wrap" },
        h = { "<cmd>set hls!<cr>", "hightlight" },
        b = { [[:set background=<C-R>=&background == "dark" ? "light" : "dark"<CR><cr>]], "background" },
        m = { [[:set mouse=<C-R>=&mouse == "a" ? "" : "a"<CR><cr>]], "mouse" },
      },
    },
    [","] = {
      f = {
        name = "fzf",
        [" "] = { "<cmd>lua require('fzf-lua').live_grep_resume()<CR>", "Grep" },
        ["<C-q>"] = { "<cmd>lua require('fzf-lua').quickfix()<CR>", "Quickfix" },
        ["<C-e>"] = { "<cmd>lua require('fzf-lua').loclist()<CR>", "Loclist" },
        f = { "<cmd>lua require('fzf-lua').files()<CR>", "Files" },
        b = { "<cmd>lua require('fzf-lua').buffers()<CR>", "Buffers" },
        r = { "<cmd>lua require('fzf-lua').files_resume()<CR>", "Resume" },
        m = { "<cmd>lua require('fzf-lua').oldfiles()<CR>", "MRU" },
        l = { "<cmd>lua require('fzf-lua').blines()<CR>", "Lines" },
        L = { "<cmd>lua require('fzf-lua').lines()<CR>", "Lines" },
        T = { "<cmd>lua require('fzf-lua').tab()<CR>", "Tab" },
        g = { "<cmd>lua require('fzf-lua').live_grep()<CR>", "Grep" },
        s = { "<cmd>lua require('fzf-lua').grep()<CR>", "Grep" },
        o = { "<cmd>lua require('fzf-lua').git_status()<CR>", "Git Status" },
        c = { "<cmd>lua require('fzf-lua').git_commits()<CR>", "Commits" },
        p = { "<cmd>lua require('fzf-lua').colorschemes()<CR>", "Colorschemes" },
      },
      s = {
        name = "seek",
        c = { "<cmd>Telescope cheat fd<cr>", "Cheatsheet" },
        v = { "<cmd>Cheatsheet<cr>", "Vim Cheatsheet" },
      },
    },
  }
  which_key.register(mymappings, opts)
end

-- Additional Plugins
lvim.plugins = {
  {
    "mfussenegger/nvim-jdtls",
    module = "jdtls",
  },
  -- { "ChristianChiarulli/vim-solidity" },
  {
    -- Note for this to work you need to create a pat and put it in `~/.gist-vim` as <token XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX>
    -- You will also need to set github username like:
    --
    -- [user]
    --	 email = chris.machine@pm.me
    --   name = Christian Chiarulli
    -- [github]
    --   user = ChristianChiarulli
    "mattn/vim-gist",
    requires = "mattn/webapi-vim",
    config = function()
      vim.g.gist_open_browser_after_post = 1
    end,
  },
  -- {
  --   "nvim-telescope/telescope-project.nvim",
  --   event = "BufWinEnter",
  --   setup = function()
  --     vim.cmd [[packadd telescope.nvim]]
  --   end,
  -- },
  {
    "vuki656/package-info.nvim",
    ft = "json",
    requires = { { "MunifTanjim/nui.nvim", module = "nui" } },
    config = function()
      require "user.package-info"
    end,
  },
  -- {
  --   "rcarriga/nvim-notify",
  --   event = "BufRead",
  --   config = function()
  --     require("user.notify").config()
  --   end,
  -- },
  -- TODO: maybe oneday
  -- { "gelguy/wilder.nvim",
  --   config = function ()
  --     vim.cmd("source $HOME/.config/lvim/lua/user/wilder.vim")
  --   end
  -- },
  -- {
  --   "folke/twilight.nvim",
  --   config = function()
  --     require("user.twilight").config()
  --   end,
  --   -- cmd = "ZenMode",
  -- },
  -- {
  --   "tzachar/cmp-tabnine",
  --   config = function()
  --     local tabnine = require "cmp_tabnine.config"
  --     tabnine:setup {
  --       max_lines = 1000,
  --       max_num_results = 20,
  --       sort = true,
  --     }
  --   end,

  --   run = "./install.sh",
  --   requires = "hrsh7th/nvim-cmp",
  -- },
  {
    "dccsillag/magma-nvim",
    disable = true,
  },
  {
    "metakirby5/codi.vim",
    cmd = "Codi",
  },
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
  },
  -- younger
  -- { "gelguy/wilder.nvim", run = ":UpdateRemotePlugins", event = "CmdlineEnter", config = require "user.wilder" },
  -- [Appearance]
  {
    {
      "lukas-reineke/indent-blankline.nvim",
      -- event = "BufReadPre",
      config = function()
        require "user.blankline"
      end,
    },
    { "p00f/nvim-ts-rainbow" },
    {
      "norcalli/nvim-colorizer.lua",
      config = function()
        require("user.colorizer").config()
      end,
    },
  },
  {
    "mvllow/modes.nvim",
    opt = true,
    -- event = "BufRead",
    config = function()
      vim.opt.cursorline = true
      require("modes").setup {
        colors = {
          insert = "#78ccc5",
          visual = "#f5c359",
          delete = "#c75c6a",
          copy = "#9745be",
        },
        line_opacity = 0.2,
        focus_only = false,
      }
    end,
  },
  -- [Treesitter]
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "0.5-compat",
    event = "BufRead",
  },
  {
    "nvim-treesitter/playground",
    event = "BufRead",
  },
  {
    "nvim-treesitter/nvim-treesitter-refactor",
    event = "BufRead",
  },
  {
    "RRethy/nvim-treesitter-textsubjects",
    event = "BufRead",
  },
  {
    "romgrk/nvim-treesitter-context",
    cmd = "TSContextToggle",
    config = function()
      require("treesitter-context").setup {
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        throttle = true, -- Throttles plugin updates (may improve performance)
        max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
        patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
          -- For all filetypes
          -- Note that setting an entry here replaces all other patterns for this entry.
          -- By setting the 'default' entry below, you can control which nodes you want to
          -- appear in the context window.
          default = {
            "class",
            "function",
            "method",
            -- 'for', -- These won't appear in the context
            -- 'while',
            -- 'if',
            -- 'switch',
            -- 'case',
          },
          -- Example for a specific filetype.
          --   rust = {
          --       'impl_item',
          --   },
        },
      }
    end,
  },
  -- [Text Object]
  -- {},
  -- [Motion]
  {
    {
      "unblevable/quick-scope",
      event = "BufRead",
      config = function()
        require "user.quickscope"
      end,
      disable = true,
    },
    {
      "abecodes/tabout.nvim",
      config = function()
        require("user.tabout").config()
      end,
      wants = { "nvim-treesitter" }, -- or require if not used so far
      after = { "nvim-cmp", "LuaSnip" }, -- if a completion plugin is using tabs load it before
      disable = true,
    },
    {
      "chaoren/vim-wordmotion",
      event = "CursorMoved",
      setup = function()
        vim.g.wordmotion_prefix = ";"
      end,
    },
    {
      "andymass/vim-matchup",
      event = "CursorMoved",
      config = function()
        require "user.matchup"
      end,
    },
    {
      "haya14busa/vim-asterisk",
      config = function()
        require "user.asterisk"
      end,
    },
    {
      "phaazon/hop.nvim",
      event = "BufRead",
      config = function()
        require("user.hop").config()
      end,
      disable = true,
    },
    {
      "ggandor/lightspeed.nvim",
      event = "BufRead",
      config = function()
        require "user.lightspeed"
      end,
    },
    {
      "nacro90/numb.nvim",
      event = "BufRead",
      config = function()
        require("user.numb").config()
      end,
    },
    {
      "karb94/neoscroll.nvim",
      config = function()
        require "user.neoscroll"
      end,
    },
  },
  -- [Change]
  {
    -- TODO:use { "machakann/vim-sandwich" } because `vim-surround` occupies `d` which cause `dz%` doesn't work
    { "tpope/vim-surround" },
    { "tpope/vim-repeat" },
    { "AndrewRadev/splitjoin.vim", keys = { "gS", "gJ" } },
    {
      "mg979/vim-visual-multi",
      config = function()
        require "user.multi-cursor"
      end,
    },
    {
      "junegunn/vim-easy-align",
      config = function()
        require "user.easy-align"
      end,
    },
    {
      "monaqa/dial.nvim",
      event = "BufRead",
      config = function()
        require "user.dial"
      end,
    },
    {
      "dhruvasagar/vim-table-mode",
      cmd = "TableModeToggle",
      keys = ",tm",
      setup = function()
        vim.g.table_mode_map_prefix = ",t"
      end,
    },
    {
      "arthurxavierx/vim-caser",
      setup = function()
        vim.g.caser_prefix = ";c"
      end,
    },
  },
  -- [Vim Helper]
  {
    { "tpope/vim-scriptease" },
    { "tpope/vim-unimpaired", commit = "825a3ee64", opt = true },
    {
      "dstein64/vim-startuptime",
      cmd = "StartupTime",
      setup = function()
        vim.g.startuptime_use_blocks = 0
      end,
    },
    {
      "nathom/filetype.nvim",
      -- opt = true,
      setup = function() end,
      config = function()
        require "user.filetype"
      end,
    },
    {
      "sheerun/vim-polyglot",
      opt = true,
      setup = function()
        vim.g.polyglot_disabled = { "autoindent", "ftdetect", "markdown" }
      end,
    },
    {
      "max397574/better-escape.nvim",
      event = "InsertEnter",
      setup = function()
        vim.cmd [[
          silent! iunmap jk
          silent! iunmap kj
          silent! iunmap jj
        ]]
      end,
      config = function()
        require("better_escape").setup {
          mapping = { "jk", "jj" }, -- a table with mappings to use
          timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
          keys = "<Esc>", -- keys used for escaping, if it is a function will use the result everytime
        }
      end,
    },
  },
  {
    "folke/lua-dev.nvim",
    opt = true,
    -- ft = "lua",
    config = function()
      local luadev = require("lua-dev").setup {
        -- options that will be merged in the final lsp config
        lspconfig = lvim.lang.lua.lsp.setup,
        library = {
          vimruntime = false, -- runtime path
          types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
          -- plugins = true, -- installed opt or start plugins in packpath
          -- you can also specify the list of plugins to make available as a workspace library
          plugins = { "nvim-treesitter", "focus.nvim", "telescope.nvim" },
        },
      }
      require("lspconfig").sumneko_lua.setup(luadev)
    end,
  },
  -- [Buffer | Window | Tab]
  {
    {
      "beauwilliams/focus.nvim",
      -- event = "BufRead",
      -- cmd = "FocusToggle",
      module = "focus",
      config = function()
        require("focus").setup {
          signcolumn = false,
          -- number = false,
          -- relativenumber = true,
          -- hybridnumber = true,
          excluded_filetypes = { "lir", "toggleterm" },
          excluded_buftypes = { "nofile", "prompt", "help", "quickfix" },
        }
        require("focus").focus_toggle()
        vim.api.nvim_set_keymap("n", "<C-h>", ":lua require'focus'.split_command('h')<CR>", { silent = true })
        vim.api.nvim_set_keymap("n", "<C-j>", ":lua require'focus'.split_command('j')<CR>", { silent = true })
        vim.api.nvim_set_keymap("n", "<C-k>", ":lua require'focus'.split_command('k')<CR>", { silent = true })
        vim.api.nvim_set_keymap("n", "<C-l>", ":lua require'focus'.split_command('l')<CR>", { silent = true })
      end,
    },
    { "dhruvasagar/vim-zoom", keys = "<C-w>m" },
    {
      "sindrets/winshift.nvim",
      cmd = "WinShift",
      setup = function()
        vim.cmd [[
          nnoremap <C-W><C-M> <Cmd>WinShift<CR>
          nnoremap <C-M-H> <Cmd>WinShift left<CR>
          nnoremap <C-M-J> <Cmd>WinShift down<CR>
          nnoremap <C-M-K> <Cmd>WinShift up<CR>
          nnoremap <C-M-L> <Cmd>WinShift right<CR>
        ]]
      end,
      config = function()
        require("winshift").setup {
          highlight_moving_win = true, -- Highlight the window being moved
          focused_hl_group = "Visual", -- The highlight group used for the moving window
          moving_win_options = {
            -- These are local options applied to the moving window while it's
            -- being moved. They are unset when you leave Win-Move mode.
            wrap = false,
            cursorline = false,
            cursorcolumn = false,
            colorcolumn = "",
          },
        }
      end,
    },
  },
  -- [Code Tools]
  { "hrsh7th/cmp-emoji" },
  { "hrsh7th/cmp-calc" },
  -- [Files]
  {
    "kevinhwang91/rnvimr",
    config = function()
      require "user.rnvimr"
    end,
  },
  {
    "tamago324/lir.nvim",
    config = function()
      require "user.lir"
    end,
  },
  {
    "Shatur/neovim-session-manager",
    event = "BufRead",
    config = function()
      require("telescope").load_extension "sessions"
      require("session_manager").setup {
        sessions_dir = vim.fn.stdpath "data" .. "/sessions", -- The directory where the session files will be saved.
        autoload_last_session = true, -- Automatically load last session on startup is started without arguments.
        autosave_last_session = true, -- Automatically save last session on exit.
        autosave_ignore_paths = { "~" }, -- Folders to ignore when autosaving a session.
      }
    end,
  },
  {
    "ZSaberLv0/ZFVimDirDiff",
    cmd = { "ZFDirDiff", "ZFDirDiffMark" },
    setup = function()
      vim.g.ZFDirDiffUI_dirExpandable = "+"
    end,
  },
  -- [Find]
  {
    "windwp/nvim-spectre",
    event = "BufRead",
    config = function()
      require("user.spectre").config()
    end,
  },
  {
    "ibhagwan/fzf-lua",
    requires = "vijaymarupudi/nvim-fzf",
    config = function()
      require "user.fzf"
    end,
  },
  -- [Telescope]
  { "nvim-telescope/telescope-symbols.nvim" },
  {
    "nvim-telescope/telescope-packer.nvim",
    after = "telescope.nvim",
  },
  --[[ {
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make",
    after = "telescope.nvim",
    config = function()
      require("telescope").load_extension "fzf"
    end,
  }, ]]
  {
    "nvim-telescope/telescope-frecency.nvim",
    after = { "telescope.nvim" },
    requires = { { "tami5/sqlite.lua", module = "sqlite" } },
    config = function()
      require("telescope").load_extension "frecency"
    end,
  },
  {
    "nvim-telescope/telescope-github.nvim",
    after = "telescope.nvim",
    config = function()
      require("telescope").load_extension "gh"
    end,
  },
  {
    "nvim-telescope/telescope-z.nvim",
    after = "telescope.nvim",
    config = function()
      require("telescope").load_extension "z"
    end,
  },
  {
    "nvim-telescope/telescope-cheat.nvim",
    after = "telescope.nvim",
    requires = { { "tami5/sqlite.lua", module = "sqlite" } },
    config = function()
      require("telescope").load_extension "cheat"
    end,
  },
  {
    "jvgrootveld/telescope-zoxide",
    after = "telescope.nvim",
    config = function()
      require("telescope").load_extension "zoxide"
      -- local z_utils = require "telescope._extensions.zoxide.utils"
      require("telescope._extensions.zoxide.config").setup {
        prompt_title = "[ Z⏫ ]",
        -- mappings = {
        -- default = {
        --   after_action = function(selection)
        --     print("Update to (" .. selection.z_score .. ") " .. selection.path)
        --   end,
        -- },
        -- ["<C-q>"] = { action = z_utils.create_basic_command "split" },
        -- },
      }
    end,
  },
  {
    "AckslD/nvim-neoclip.lua",
    after = "telescope.nvim",
    config = function()
      require("telescope").load_extension "neoclip"
      require("neoclip").setup {
        filter = nil,
        preview = true,
        default_register = '"',
        content_spec_column = false,
        on_paste = {
          set_reg = false,
        },
        keys = {
          i = {
            select = "<cr>",
            paste = "<c-l>",
            paste_behind = "<c-h>",
          },
        },
      }
    end,
  },
  -- [Terminal]
  -- { "lambdalisue/guise.vim" },
  -- [UI]
  {
    {
      "liuchengxu/vista.vim",
      cmd = "Vista",
      config = function()
        vim.g.vista_icon_indent = { "╰─▸ ", "├─▸ " }
      end,
    },
    {
      "simrat39/symbols-outline.nvim",
      -- cmd = "SymbolsOutline",
      config = function()
        require("user.outline").config()
      end,
    },
    { "mbbill/undotree", cmd = "UndotreeToggle" },
    {
      "wfxr/minimap.vim",
      cmd = { "MinimapToggle" },
      config = function()
        vim.cmd "let g:minimap_width = 10"
        vim.cmd "let g:minimap_close_filetypes = ['startify', 'netrw', 'vim-plug', 'dashboard']"
        vim.cmd "let g:minimap_git_colors = 1"
        vim.cmd "let g:minimap_highlight_search = 1"
      end,
    },
    {
      "folke/trouble.nvim",
      cmd = "TroubleToggle",
      module = "trouble",
      config = function()
        require("trouble").setup {
          height = 10,
          mode = "lsp_workspace_diagnostics", -- "lsp_workspace_diagnostics", "lsp_document_diagnostics", "quickfix", "lsp_references", "loclist"
          action_keys = {
            -- map to {} to remove a mapping, for example: close = {},
            close = "q", -- close the list
            cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
            refresh = "r", -- manually refresh
            jump = { "<cr>", "<tab>" }, -- jump to the diagnostic or open / close folds
            open_split = { "<c-x>" }, -- open buffer in new split
            open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
            open_tab = { "<c-t>" }, -- open buffer in new tab
            jump_close = { "o" }, -- jump to the diagnostic and close the list
            toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
            toggle_preview = "P", -- toggle auto_preview
            hover = "K", -- opens a small popup with the full multiline message
            preview = "p", -- preview the diagnostic location
            close_folds = { "zM", "zm" }, -- close all folds
            open_folds = { "zR", "zr" }, -- open all folds
            toggle_fold = { "zA", "za" }, -- toggle fold of current file
            previous = "k", -- preview item
            next = "j", -- next item
          },
          signs = {
            error = "",
            warning = "",
            hint = "",
            information = "",
            other = "﫠",
          },
        }
      end,
    },
  },
  {
    "kevinhwang91/nvim-bqf",
    event = "BufRead",
    -- lua pp((require('bqf.config'))
    config = function()
      require("bqf").setup {
        preview = {
          win_height = 15,
          win_vheight = 15,
          border_chars = { "│", "│", "─", "─", "╭", "╮", "╰", "╯", "█" },
          -- border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
        },
        func_map = {
          stogglevm = "<Tab>", -- toggle multiple signs in visual mode
          stogglebuf = "zb", -- "'<Tab>", -- toggle signs for same buffers under the cursor
          sclear = "zc", -- "z<Tab>", -- clear the signs in current quickfix list
          filter = "zn", -- create new list for signed items
          filterr = "zN", -- create new list for non-signed items
          tab = "t",
          tabb = "T", -- like tab, but stay at quickfix window
          prevfile = "K", -- "<C-p>", -- go to next file under the cursor
          nextfile = "J", -- "<C-n>",
          pscrollup = "<C-u>",
          pscrolldown = "<C-d>",
          pscrollorig = "zz", -- scroll back to original postion in preview window
          ptogglemode = "zp", -- toggle preview window between normal and max size
        },
        filter = {
          fzf = {
            extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
          },
        },
      }
    end,
  },
  -- [Git]
  { "tpope/vim-fugitive", cmd = { "Git", "GBrowse" }, ft = { "fugitive" } },
  {
    "ruifm/gitlinker.nvim",
    event = "BufRead",
    config = function()
      require("user.gitlinker").config()
    end,
  },
  {
    "TimUntersberger/neogit",
    cmd = "Neogit",
    module = "neogit",
    config = function()
      require("neogit").setup {}
    end,
  },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
    config = function()
      require "user.diffview"
    end,
  },
  {
    "pwntester/octo.nvim",
    event = "BufRead",
    config = function()
      require("user.octo").config()
    end,
  },
  -- [Markdown]
  {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = "markdown",
  },
  { "ellisonleao/glow.nvim", cmd = "Glow" },
  -- [Write]
  {
    {
      "folke/zen-mode.nvim",
      config = function()
        require("user.zen").config()
      end,
    },
    {
      "vhyrro/neorg",
      ft = "norg",
      config = function()
        require "user.neorg"
      end,
    },
    {
      "kristijanhusak/orgmode.nvim",
      ft = { "org" },
      config = function()
        require("orgmode").setup {}
      end,
    },
    {
      "folke/todo-comments.nvim",
      -- cmd = { "TodoQuickFix", "TodoTelescope", "TodoTrouble" },
      event = "BufRead",
      config = function()
        require("todo-comments").setup {}
      end,
    },
  },
  -- [Tools]
  {
    "voldikss/vim-translator",
    cmd = { "Translate", "TranslateW" },
    setup = function()
      vim.cmd [[
        nmap <Leader>kk <Cmd>Translate<cr>
        vmap <Leader>kk :Translate<cr>
        " Display translation in a window
        nmap <Leader>kj <Cmd>TranslateW<cr>
        vmap <Leader>kj :TranslateW<cr>
        " let g:translator_window_borderchars = ['─', '│', '─', '│', '┌', '┐', '┘', '└']
        " let g:translator_window_borderchars = ['─', '│', '─', '│', '╭', '╮', '╯', '╰']
        let g:translator_window_borderchars = ['═', '║', '═', '║', '╔', '╗', '╝', '╚']
        " let g:translator_window_type = 'preview'
        " let g:translator_default_engines = ['bing', 'google', 'haici', 'youdao']
    ]]
    end,
  },
  {
    "sudormrfbin/cheatsheet.nvim",
    config = function()
      require("cheatsheet").setup {
        include_only_installed_plugins = false,
      }
    end,
  },
  {
    "dbeniamine/cheat.sh-vim",
    -- keys = "<leader>K",
    cmd = "Cheat",
    config = function()
      vim.g.CheatDoNotReplaceKeywordPrg = 1
      vim.g.CheatSheetDoNotMap = 1
    end,
  },
  {
    "romainl/vim-devdocs",
    cmd = "DD",
    setup = function()
      vim.cmd [[
        nnoremap <Leader>kd <Cmd>DD<cr>
      ]]
    end,
  },
  -- [Web]
  { "wakatime/vim-wakatime" },
  -- [LSP]
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require("user.lsp_signature").config()
    end,
  },
  {
    "weilbith/nvim-code-action-menu",
    cmd = "CodeActionMenu",
  },
  {
    "kosayoda/nvim-lightbulb",
    event = "BufRead",
    config = function()
      vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
    end,
  },
  { "arkav/lualine-lsp-progress" },
  -- [Spell]
  {
    "kamykn/spelunker.vim",
    event = "BufRead",
    config = function()
      vim.g.enable_spelunker_vim = 0
    end,
  },
  -- [Languages]
  {
    -- vim colorschemes
    "sainnhe/sonokai",
    "sainnhe/edge",
    "sainnhe/everforest",
    "sainnhe/gruvbox-material",
    "NLKNguyen/papercolor-theme",
    "bluz71/vim-moonfly-colors",
    "bluz71/vim-nightfly-guicolors",
    -- lua colorscheme
    { "lunarvim/colorschemes" },
    {
      "folke/tokyonight.nvim",
      setup = function()
        vim.g.tokyonight_style = "night" -- storm, night, day
        -- lvim.builtin.lualine.options.theme = "tokyonight"
      end,
    },
    {
      "marko-cerovac/material.nvim",
      setup = function()
        vim.g.material_style = "darker" -- darker, lighter, oceanic, palenight, deep ocean
        -- lvim.builtin.lualine.options.theme = "material-nvim"
      end,
    },
    {
      "pocco81/catppuccino.nvim",
      setup = function() end,
      config = function()
        require "user.theme.catppuccino"
      end,
    },
    {
      "shaunsingh/nord.nvim",
      setup = function()
        vim.g.nord_borders = true
      end,
    },
    {
      "tanvirtin/monokai.nvim",
      setup = function() end,
      -- setup = function()
      --   print "mono set"
      -- end,
      -- config = function()
      --   print "mono cfg"
      -- end,
    },
    {
      "Mofiqul/vscode.nvim",
      setup = function()
        vim.g.vscode_style = "dark"
        -- lvim.builtin.lualine.options.theme = "vscode"
      end,
    },
    {
      "EdenEast/nightfox.nvim",
      setup = function() end,
    },
    {
      "ful1e5/onedark.nvim",
      setup = function() end,
    },
  },
}

-- TODO: q quits in spectr_panel ft
-- [Autocommands](https://neovim.io/doc/user/autocmd.html)
-- [events](https://tech.saigonist.com/b/code/list-all-vim-script-events.html)
lvim.autocommands.custom_groups = {
  -- { Event, filetype, command } run a command at a given event for the given filetype
  -- Return to last edit position when opening files (You want this!)
  {
    "BufWinEnter",
    "*",
    [[if line("'\"") >= 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif ]],
  },
  -- [gopass: vim on Linux](https://github.com/gopasspw/gopass/blob/master/docs/setup.md)
  {
    "BufNewFile,BufRead",
    "/dev/shm/gopass.*,/run/shm/gopass.*",
    [[setlocal noswapfile nobackup noundofile]],
  },
  { "InsertEnter", "*", ":normal! zz" },
  -- { "CursorHold", "*", ":normal! ga" },
}
-- way to get os name
-- print(vim.loop.os_uname().sysname)

-- *Must* be *S*olidity not solidity
require("nvim-treesitter.parsers").get_parser_configs().solidity = {
  install_info = {
    url = "https://github.com/JoranHonig/tree-sitter-solidity",
    files = { "src/parser.c" },
    requires_generate_from_grammar = true,
  },
  filetype = "solidity",
}
