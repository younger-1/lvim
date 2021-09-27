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
use {
  'myusername/example',        -- The plugin location string
  -- The following keys are all optional
  disable = boolean,           -- Mark a plugin as inactive
  as = string,                 -- Specifies an alias under which to install the plugin
  installer = function,        -- Specifies custom installer. See "custom installers" below.
  updater = function,          -- Specifies custom updater. See "custom installers" below.
  after = string or list,      -- Specifies plugins to load before this plugin. See "sequencing" below
  rtp = string,                -- Specifies a subdirectory of the plugin to add to runtimepath.
  opt = boolean,               -- Manually marks a plugin as optional.
  branch = string,             -- Specifies a git branch to use
  tag = string,                -- Specifies a git tag to use
  commit = string,             -- Specifies a git commit to use
  lock = boolean,              -- Skip this plugin in updates/syncs
  run = string, function, or table, -- Post-update/install hook. See "update/install hooks".
  requires = string or list,   -- Specifies plugin dependencies. See "dependencies".
  rocks = string or list,      -- Specifies Luarocks dependencies for the plugin
  config = string or function, -- Specifies code to run after this plugin is loaded.
  -- The setup key implies opt = true
  setup = string or function,  -- Specifies code to run before this plugin is loaded.
  -- The following keys all imply lazy-loading and imply opt = true
  cmd = string or list,        -- Specifies commands which load this plugin. Can be an autocmd pattern.
  ft = string or list,         -- Specifies filetypes which load this plugin.
  keys = string or list,       -- Specifies maps which load this plugin. See "Keybindings".
  event = string or list,      -- Specifies autocommand events which load this plugin.
  fn = string or list          -- Specifies functions which load this plugin.
  cond = string, function, or list of strings/functions,   -- Specifies a conditional test to load this plugin
  module = string or list      -- Specifies Lua module names for require. When requiring a string which starts
                               -- with one of these module names, the plugin will be loaded.
  module_pattern = string/list -- Specifies Lua pattern of Lua module names for require. When
  requiring a string which matches one of these patterns, the plugin will be loaded.
}
--]]

require "user.cfg.global"
require "user.theme.dash-pic"
young = "Young"

-- General
lvim.format_on_save = false
lvim.transparent_window = false
-- lvim.colorscheme = "onedarker"
-- lvim.log.level = "warn"
lvim.debug = false
vim.opt.clipboard = ""
vim.opt.cmdheight = 1
vim.opt.guifont = "SauceCodePro NF"
vim.opt.inccommand = "split"
vim.opt.mouse = "nvi"
vim.opt.timeoutlen = 200
vim.opt.wrap = false

-- LSP
lvim.lsp.diagnostics.virtual_text = false
lvim.lsp.override = { "java" }
require("user.json_schemas").setup()

-- Builtins
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.dap.active = true
lvim.builtin.gitsigns.opts.numhl = true
lvim.builtin.gitsigns.opts.keymaps["x ih"] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>'
-- lvim.builtin.lualine.options.theme = "tokyonight"

-- Treesitter
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.autotag.enable = true
-- lvim.builtin.treesitter.playground.enable = true
lvim.builtin.treesitter.rainbow.enable = true
-- for finding syntax ids for non TS enabled languages
vim.cmd [[
map <F3> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>
]]

-- Telescope
--[[ tips:
  <C-e> to put command to commandline, creates new file in current directory
  <C-q> to send all results to quickfix and <M-q> to send selected items
  -- TODO:
  https://github.com/rafamadriz/NeoCode/blob/main/lua/modules/plugins/telescope.lua
--]]
local actions = require "telescope.actions"
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
      "--hidden",
    },
    file_ignore_patterns = {
      "node_modules",
      "package.json",
      "package-lock.json",
      ".git/",
      ".mkv",
      ".png",
      ".jpg",
      ".jpeg",
      ".webp",
      ".pdf",
      ".mp3",
      ".mp4",
      ".m4a",
      ".opus",
      ".flac",
      ".doc",
      ".zip",
      ".odt",
      ".ots",
      ".docx",
      ".xlsx",
      ".xls",
      ".pptx",
      ".dxvk",
      ".rpf",
      ".dll",
      ".kdbx",
      ".exe",
      ".iso",
    },
    -- horizontal, center, cursor, vertical, flex, bottom_pane
    layout_strategy = "horizontal",
    layout_config = {
      width = 0.90,
      horizontal = { preview_width = 0.5 },
    },
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
        ["<C-a>"] = actions.smart_send_to_loclist + actions.open_loclist,
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
        ["<C-a>"] = actions.smart_send_to_loclist + actions.open_loclist,
        ["<C-_>"] = actions.which_key, -- Keys to produce <C-/>
      },
    },
  },
  -- require'telescope.themes'.get_cursor()
  -- require'telescope.themes'.get_dropdown()
  -- require'telescope.themes'.get_ivy()
  pickers = {
    -- find_files = require("telescope.themes").get_dropdown(),
    -- find_files = {
    -- theme = "dropdown",
    -- {
    --   border = true,
    --   borderchars = {
    --     preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    --     prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
    --     results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
    --   },
    --   layout_config = {
    --     height = <function 2>,
    --     preview_cutoff = 1,
    --     width = <function 3>,
    --     <metatable> = <table 1>
    --   },
    --   layout_strategy = "center",
    --   preview_title = "Preview",
    --   sorting_strategy = "ascending",
    -- }
    -- },
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
  -- insert_mode = {},
  normal_mode = {
    ["Y"] = "y$",
    ["z<C-l>"] = "<cmd>nohlsearch<cr><C-l>",
    ["<C-e>"] = ":call LocListToggle()<CR>",
  },
  -- term_mode = {},
  visual_mode = {
    ["Y"] = [["+y]],
    ["d"] = [["_d]],
    ["X"] = [["+x]],
  },
  -- visual_block_mode = {},
  -- command_mode = {},
})

vim.cmd [[
" 朝闻道，金、木、水、火、土；【真香定律（王境泽）】；《静夜诗（李白）》。
" 唐僧问道：‘泼猴，若我救你出来，你该如何报答我？’ 悟空：“你若放我出来，我定会送你上西天！”
set matchpairs+=【:】,（:）,《:》,‘:’,“:”,；:。,，:。
set listchars=space:·,eol:↲,trail:~,tab:>-,extends:>,precedes:<,nbsp:+

cnoremap <C-V> <C-R>+
inoremap <C-V> <C-G>u<C-R><C-O>+
onoremap H ^
vnoremap H ^
onoremap L $
vnoremap L $
" g. z.
cnoremap <C-a> <HOME>
inoremap <C-U> <C-G>u<C-U>
inoremap <C-W> <C-G>u<C-W>

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
    p = {
      name = "pack",
      i = { 'y:lua pp(<C-r>")', "Inspect" },
    },
    l = {
      name = "lsp",
      f = { "<Cmd>vim.lsp.buf.range_formatting()<CR>", "Format" },
    },
  },

  mappings = {
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
      S = { "<cmd>Gitsigns stage_buffer<cr>", "Stage Buffer" },
    },
    j = {
      name = "justify",
      s = {
        b = { "<cmd>Telescope current_buffer_fuzzy_find<CR>", "Buffer String" },
        F = { "<cmd>Telescope filetypes<CR>", "FileTypes" },
        r = { "<cmd>Telescope reloader<CR>", "Reload Module" },
        t = { "<cmd>Telescope current_buffer_tags<CR>", "Tags" },
        T = { "<cmd>Telescope tags<CR>", "All Tags" },
      },
    },
    k = {
      name = "kit",
      c = { "<cmd>Cheatsheet<cr>", "Cheat" },
      m = { "<cmd>MinimapToggle<cr>", "Minimap" },
      t = { "<cmd>TodoQuickFix<cr>", "Todo" },
      z = { "<cmd>FocusToggle<cr>", "AutoZoom" },
    },
    l = {
      a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
      d = { "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>", "Diagnostics" },
      D = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Diagnostics LocList" },
      -- w = { "<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics" },
      -- f = { "<cmd>silent FormatWrite<cr>", "Format" },
      -- f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
      f = {
        function()
          vim.lsp.buf.formatting_sync()
          vim.cmd "write"
        end,
        "Format",
      },
      i = { "<cmd>LspInfo<cr>", "Info" },
      j = {
        "<cmd>lua vim.lsp.diagnostic.goto_next({popup_opts = {border = lvim.lsp.popup_border}})<cr>",
        "Next Diagnostic",
      },
      k = {
        "<cmd>lua vim.lsp.diagnostic.goto_prev({popup_opts = {border = lvim.lsp.popup_border}})<cr>",
        "Prev Diagnostic",
      },
      p = {
        name = "Peek",
        d = { "<cmd>lua require('lsp.peek').Peek('definition')<cr>", "Definition" },
        t = { "<cmd>lua require('lsp.peek').Peek('typeDefinition')<cr>", "Type Definition" },
        i = { "<cmd>lua require('lsp.peek').Peek('implementation')<cr>", "Implementation" },
      },
      r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
      s = { "<Cmd>lua vim.lsp.buf.document_symbol()<CR>", "Document Symbols" },
      w = { "<Cmd>lua vim.lsp.buf.workspace_symbol()<CR>", "Workspace Symbols" },
      O = { "<Cmd>lua vim.lsp.buf.outgoing_calls()<CR>", "Outgoing Calls" },
      I = { "<Cmd>lua vim.lsp.buf.incoming_calls()<CR>", "Incoming Calls" },
      l = {
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
      v = { "<cmd>Vista!!<cr>", "Vista" },
      n = { "<cmd>NullLsInfo<cr>", "Null LS" },
    },
    L = {
      C = { "<cmd>LuaCacheClear<cr>", "LuaCache Clear" },
      L = { "<cmd>LuaCacheLog<cr>", "LuaCache Log" },
      P = { "<cmd>LuaCacheProfile<cr>", "LuaCache Profile" },
      R = { "<cmd>LvimCacheReset<cr>", "LvimCache Reset" },
    },
    p = {
      C = { "<cmd>PackerCompile profile=true<cr>", "Compile+" },
      o = { ":lua pp()<left>", "Inspect" },
      -- FIXME:Search list of files of package(under cursor)
      -- o = { "", "Package Files" },
      p = { "<cmd>PackerProfile<cr>", "Profile" },
      t = { "<cmd>lua require('telescope').extensions.packer.plugins()<cr>", "Telescope Packer" },
    },
    r = {
      name = "replace",
      r = { "<cmd>lua require('spectre').open()<cr>", "Replace" },
      w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Replace Word" },
      f = { "<cmd>lua require('spectre').open_file_search()<cr>", "Replace Buffer" },
    },
    s = {
      ["<tab>"] = { "<cmd>Telescope<CR>", "🧙" },
      [" "] = { "<cmd>Telescope resume<CR>", "♻️" },
      ["<C-q>"] = { "<cmd>Telescope quickfix<CR>", "QuickList" },
      ["<C-e>"] = { "<cmd>Telescope loclist<CR>", "LocList Bug" },
      ["'"] = { "<cmd>Telescope marks<CR>", "Marks" },
      ['"'] = { "<cmd>Telescope registers<CR>", "Registers" },
      ["/"] = { "<cmd>Telescope search_history<CR>", "Search History" },
      [":"] = { "<cmd>Telescope command_history<CR>", "Command History" },
      ["."] = { "<cmd>Telescope file_browser hidden=v:true<CR>", "Browser" },
      a = { "<cmd>Telescope autocommands<CR>", "Autocommands" },
      c = { "<cmd>lua require('telescope.builtin.internal').colorscheme({enable_preview = true})<cr>", "Colorscheme" },
      g = { "<cmd>Telescope live_grep <cr>", "Grep" },
      -- TODO:
      -- f = { "<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files <cr>", "Find files" },
      G = { "<cmd>Telescope live_grep grep_open_files=v:true<cr>", "Grep in opened buffer" },
      m = {
        name = "MRU",
        -- :Telescope frecency frecency default_text=:project:
        c = { "<Cmd>lua require('telescope').extensions.frecency.frecency{ default_text = ':CWD:' }<CR>", "CWD" },
        l = { "<Cmd>lua require('telescope').extensions.frecency.frecency{ default_text = ':LSP:' }<CR>", "LSP" },
        m = { "<Cmd>lua require('telescope').extensions.frecency.frecency()<CR>", "Frecency" },
      },
      p = { "<cmd>Telescope projects<CR>", "Projects" },
      P = { "<cmd>Telescope pickers<CR>", "<Pickers>" },
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
      t = { "<cmd>TodoTelescope<CR>", "Todo" },
      T = { "<cmd>Telescope grep_string<CR>", "Text under cursor" },
      y = { "<cmd>Telescope neoclip<CR>", "Clip" },
      z = { "<cmd>lua require'telescope'.extensions.zoxide.list{}<CR>", "Z" },
      -- z = { "<cmd>lua require'telescope'.extensions.z.list{ cmd = {'zoxide', 'query', '-ls'} }<CR>", "Z" },
    },
    T = {
      h = { "<cmd>TSHighlightCapturesUnderCursor<cr>", "Highlight" },
      p = { "<cmd>TSPlaygroundToggle<cr>", "Playground" },
      t = { "<cmd>Telescope treesitter<CR>", "Telescope" },
    },
    x = {
      name = "trouble",
      ["<C-q>"] = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
      ["<C-e>"] = { "<cmd>Trouble loclist<cr>", "LocList" },
      ["."] = { "<cmd>Trouble telescope<cr>", "Telescope" },
      x = { "<cmd>TroubleToggle<cr>", "Open" },
      D = { "<cmd>Trouble lsp_definitions<cr>", "Def" },
      I = { "<cmd>Trouble lsp_implementations<cr>", "Impl" },
      R = { "<cmd>Trouble lsp_references<cr>", "Ref" },
      d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diag" },
      w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diag[workspace]" },
      t = { "<cmd>TodoTrouble<cr>", "Todo" },
    },
    z = { "<cmd>ZenMode<cr>", "Zen" },
  },
})

lvim.builtin.which_key.on_config_done = function()
  local which_key = require "which-key"
  local opts = {
    mode = "n", -- NORMAL mode
    prefix = ",",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
  }
  local mappings = {
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
  }
  which_key.register(mappings, opts)
end

-- Additional Plugins
lvim.plugins = {
  { "mfussenegger/nvim-jdtls" },
  -- { "ChristianChiarulli/vim-solidity" },
  {
    "pwntester/octo.nvim",
    event = "BufRead",
    config = function()
      require("user.octo").config()
    end,
    disable = true,
  },
  {
    "ruifm/gitlinker.nvim",
    event = "BufRead",
    config = function()
      require("user.gitlinker").config()
    end,
  },
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
    requires = { "mattn/webapi-vim" },
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
    requires = { "MunifTanjim/nui.nvim" },
    config = function()
      require "user.package-info"
    end,
  },
  {
    "rcarriga/nvim-notify",
    event = "BufRead",
    config = function()
      require("user.notify").config()
    end,
  },
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
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = "markdown",
  },
  {
    "nvim-treesitter/playground",
    event = "BufRead",
  },
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
  },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
  },
  -- younger
  -- { "gelguy/wilder.nvim", run = ":UpdateRemotePlugins", event = "CmdlineEnter", config = require "user.wilder" },
  {
    "romgrk/nvim-treesitter-context",
    cmd = "TSContextToggle",
    config = function()
      require("treesitter-context").setup {
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        throttle = true, -- Throttles plugin updates (may improve performance)
      }
    end,
  },
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
        vim.cmd [[
          let g:wordmotion_prefix = ','
        ]]
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
  },
  -- [Vim Helper]
  {
    { "tpope/vim-scriptease" },
    { "tpope/vim-unimpaired", commit = "825a3ee64" },
  },
  -- [Buffer | Window | Tab]
  {
    {
      "beauwilliams/focus.nvim",
      -- event = "BufRead",
      cmd = "FocusToggle",
      config = function()
        require("focus").setup {
          signcolumn = false,
          -- hybridnumber = true,
          excluded_filetypes = { "lir", "toggleterm" },
          excluded_buftypes = { "nofile", "prompt", "help", "quickfix" },
        }
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
    requires = { "vijaymarupudi/nvim-fzf" },
    config = function()
      require "user.fzf"
    end,
  },
  -- [Telescope]
  { "nvim-telescope/telescope-symbols.nvim" },
  -- BUG: fuck
  {
    "nvim-telescope/telescope-packer.nvim",
    opt = true,
    -- after = "telescope.nvim",
    -- module = "telescope",
    config = function()
      require("telescope").load_extension "packer"
    end,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make",
    after = "telescope.nvim",
    config = function()
      require("telescope").load_extension "fzf"
    end,
  },
  {
    "nvim-telescope/telescope-frecency.nvim",
    after = "telescope.nvim",
    requires = { "tami5/sqlite.lua" },
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
            paste = "<c-p>",
            paste_behind = "<c-b>",
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
        -- For bundled plugin cheatsheets, do not show a sheet if you don't have the plugin installed
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
    "sheerun/vim-polyglot",
    setup = function()
      vim.g.polyglot_disabled = { "markdown" }
    end,
  },
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
  },
}

-- TODO: q quits in spectr_panel ft
-- Autocommands (https://neovim.io/doc/user/autocmd.html)
lvim.autocommands.custom_groups = {
  -- { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
  -- Return to last edit position when opening files (You want this!)
  {
    "BufWinEnter",
    "*",
    [[if line("'\"") >= 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif ]],
  },
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
