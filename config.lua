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

require "theme.dash-pic"
-- general
lvim.format_on_save = true
lvim.colorscheme = "onedarker"
lvim.transparent_window = false
vim.opt.wrap = false
-- lvim.log.level = "warn"
lvim.debug = false
vim.opt.clipboard = ""
vim.opt.inccommand = "split"


-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- keymappings
-- view all the defaults by pressing <leader>Lk
lvim.leader = "space"

lvim.keys.normal_mode["<esc><esc>"] = "<cmd>nohlsearch<cr>"
lvim.keys.normal_mode["Y"] = "y$"
lvim.keys.visual_mode["Y"] = [["+y]]
lvim.keys.visual_mode["d"] = [["_d]]
lvim.keys.visual_mode["X"] = [["+x]]

vim.cmd [[
" 朝闻道，金、木、水、火、土；【真香定律（王境泽）】；《静夜诗（李白）》。
" 唐僧问道：‘泼猴，若我救你出来，你该如何报答我？’ 悟空：“你若放我出来，我定会送你上西天！”
set matchpairs+=【:】,（:）,《:》,‘:’,“:”,；:。,，:。
set listchars=eol:↲,trail:~,tab:>-,extends:>,precedes:<,nbsp:+

cnoremap <C-V> <C-R>+
inoremap <C-V> <C-G>u<C-R><C-O>+
onoremap H ^
onoremap L $
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

-- for finding syntax ids for non TS enabled languages
vim.cmd [[
map <F3> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>
]]

-- LSP
lvim.lsp.diagnostics.virtual_text = false
lvim.lsp.override = { "java" }
require("user.json_schemas").setup()

-- Builtins
lvim.builtin.dashboard.active = true
lvim.builtin.terminal.active = true
lvim.builtin.dap.active = true
lvim.builtin.bufferline.active = true
lvim.builtin.gitsigns.opts.numhl = true
lvim.builtin.gitsigns.opts.keymaps["x ih"] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>'
-- lvim.builtin.lualine.options.theme = "tokyonight"
-- lvim.builtin.tabnine = { active = true } -- only use for solidity and other langs that I don't have a langserver for
-- if lvim.builtin.tabnine.active then
--   lvim.builtin.compe.source.tabnine = { kind = " ", priority = 150, max_reslts = 6 }
-- end

-- Whichkey
lvim.builtin.which_key.mappings.g['"'] = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Blames" }
lvim.builtin.which_key.mappings.g["'"] = { "<cmd>Gitsigns toggle_linehl<cr>", "Highlight" }
lvim.builtin.which_key.mappings.g.q = { "<cmd>Gitsigns setqflist<cr>", "Quickfix" }
lvim.builtin.which_key.mappings.g.S = { "<cmd>Gitsigns stage_buffer<cr>", "Quickfix" }
lvim.builtin.which_key.mappings.l.d = { "<cmd>TroubleToggle<cr>", "Diagnostics" }
lvim.builtin.which_key.mappings.l.R = { "<cmd>TroubleToggle lsp_references<cr>", "References" }
lvim.builtin.which_key.mappings.l.o = { "<cmd>SymbolsOutline<cr>", "Outline" }
lvim.builtin.which_key.mappings.T.h = { "<cmd>TSHighlightCapturesUnderCursor<cr>", "Highlight" }
lvim.builtin.which_key.mappings.T.p = { "<cmd>TSPlaygroundToggle<cr>", "Playground" }

lvim.builtin.which_key.mappings.g["G"] = {
  name = "Gist",
  a = { "<cmd>Gist -b -a<cr>", "Create Anon" },
  d = { "<cmd>Gist -d<cr>", "Delete" },
  f = { "<cmd>Gist -f<cr>", "Fork" },
  g = { "<cmd>Gist -b<cr>", "Create" },
  l = { "<cmd>Gist -l<cr>", "List" },
  p = { "<cmd>Gist -b -p<cr>", "Create Private" },
}
lvim.builtin.which_key.mappings["z"] = { "<cmd>ZenMode<cr>", "Zen" }
lvim.builtin.which_key.mappings["r"] = {
  name = "Replace",
  r = { "<cmd>lua require('spectre').open()<cr>", "Replace" },
  w = { "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", "Replace Word" },
  f = { "<cmd>lua require('spectre').open_file_search()<cr>", "Replace Buffer" },
}
lvim.builtin.which_key.mappings.f = { "<cmd>lua require('lir.float').toggle()<cr>", "Files" }
lvim.builtin.which_key.mappings.s.P = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings.s.T = { "<cmd>TodoTelescope<CR>", "Projects" }

lvim.builtin.which_key.mappings["x"] = {
  name = "+Trouble",
  x = { "<cmd>TroubleToggle<cr>", "Open" },
  r = { "<cmd>Trouble lsp_references<cr>", "Ref" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Def" },
  i = { "<cmd>Trouble lsp_implementations<cr>", "Impl" },
  d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnos" },
  w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnos[workspace]" },
  j = { "<cmd>Trouble telescope<cr>", "LocationList" },
  k = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
}

lvim.builtin.which_key.mappings["k"] = {
  name = "+Kit",
  t = { "<cmd>TodoQuickFix<cr>", "Todo" },
}

-- Treesitter
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.autotag.enable = true
lvim.builtin.treesitter.highlight.enabled = true
lvim.builtin.treesitter.playground.enable = true

-- Telescope
lvim.builtin.telescope.on_config_done = function()
  local actions = require "telescope.actions"
  -- for input mode
  lvim.builtin.telescope.defaults.mappings.i["<C-j>"] = actions.move_selection_next
  lvim.builtin.telescope.defaults.mappings.i["<C-k>"] = actions.move_selection_previous
  lvim.builtin.telescope.defaults.mappings.i["<C-n>"] = actions.cycle_history_next
  lvim.builtin.telescope.defaults.mappings.i["<C-p>"] = actions.cycle_history_prev
  -- for normal mode
  lvim.builtin.telescope.defaults.mappings.n["<C-n>"] = actions.cycle_history_next
  lvim.builtin.telescope.defaults.mappings.n["<C-p>"] = actions.cycle_history_prev
end

-- Additional Plugins
lvim.plugins = {
  { "lunarvim/colorschemes" },
  { "lunarvim/onedarker" },
  {
    "folke/tokyonight.nvim",
    config = function()
      vim.g.tokyonight_style = "day" -- storm, night, day
      -- lvim.builtin.lualine.options.theme = "tokyonight"
    end,
  },
  { "mfussenegger/nvim-jdtls" },
  -- { "ChristianChiarulli/vim-solidity" },
  {
    "abecodes/tabout.nvim",
    config = function()
      require("user.tabout").config()
    end,
    wants = { "nvim-treesitter" }, -- or require if not used so far
    after = { "nvim-compe", "vim-vsnip" }, -- if a completion plugin is using tabs load it before
  },
  {
    "pwntester/octo.nvim",
    event = "BufRead",
    config = function()
      require("user.octo").config()
    end,
    disable = true,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    config = function()
      require("user.lsp_signature").config()
    end,
  },
  {
    "unblevable/quick-scope",
    event = "BufRead",
    config = function()
      require "user.quickscope"
    end,
    disable = true,
  },
  {
    "kevinhwang91/rnvimr",
    config = function()
      require "user.rnvimr"
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    -- event = "BufReadPre",
    config = function()
      require "user.blankline"
    end,
  },
  {
    "ruifm/gitlinker.nvim",
    event = "BufRead",
    config = function()
      require("user.gitlinker").config()
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
  {
    "tamago324/lir.nvim",
    config = function()
      require "user.lir"
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
    "nacro90/numb.nvim",
    event = "BufRead",
    config = function()
      require("user.numb").config()
    end,
  },
  {
    "monaqa/dial.nvim",
    event = "BufRead",
    config = function()
      require("user.dial").config()
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("user.colorizer").config()
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
    "windwp/nvim-spectre",
    event = "BufRead",
    config = function()
      require("user.spectre").config()
    end,
  },
  {
    "folke/zen-mode.nvim",
    config = function()
      require("user.zen").config()
    end,
  },
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("user.neoscroll").config()
    end,
  },
  {
    "vuki656/package-info.nvim",
    config = function()
      require "user.package-info"
    end,
    ft = "json",
  },
  {
    "rcarriga/nvim-notify",
    event = "BufRead",
    config = function()
      require("user.notify").config()
    end,
  },
  {
    "simrat39/symbols-outline.nvim",
    -- cmd = "SymbolsOutline",
    config = function()
      require("user.outline").config()
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
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "kevinhwang91/nvim-bqf",
    event = "BufRead",
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
  {
    "folke/todo-comments.nvim",
    cmd = { "TodoQuickFix", "TodoTelescope" },
    config = function()
      require("todo-comments").setup {}
    end,
  },
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
  {
    "vhyrro/neorg",
    ft = "norg",
    config = function()
      require "user.neorg"
    end,
    disabled = true,
  },
  {
    "kristijanhusak/orgmode.nvim",
    ft = { "org" },
    config = function()
      require("orgmode").setup {}
    end,
    disabled = true,
  },
  {
    -- vim plugins
    { "tpope/vim-surround" },
    { "tpope/vim-repeat" },
    { "tpope/vim-scriptease" },
    { "tpope/vim-fugitive" },
    { "wakatime/vim-wakatime" },
    { "AndrewRadev/splitjoin.vim", keys = { "gS", "gJ" } },
    -- { "gelguy/wilder.nvim", run = ":UpdateRemotePlugins", event = "CmdlineEnter", config = require "user.wilder" },
    { "mbbill/undotree", cmd = "UndotreeToggle" },
    {
      "sheerun/vim-polyglot",
      setup = function()
        -- vim.g.polyglot_disabled = { "markdown" }
      end,
    },
    {
      "bkad/CamelCaseMotion",
      config = function()
        require "user.camelcase"
      end,
    },
    {
      "mg979/vim-visual-multi",
      config = function()
        require "user.multi-cursor"
      end,
    },
    {
      "haya14busa/vim-asterisk",
      config = function()
        require "user.asterisk"
      end,
    },
    {
      "junegunn/vim-easy-align",
      config = function()
        require "user.easy-align"
      end,
    },
    {
      "kamykn/spelunker.vim",
      event = "BufRead",
      config = function()
        vim.g.enable_spelunker_vim = 0
      end,
    },
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
    {
      "Pocco81/Catppuccino.nvim",
      config = function()
        require "theme.catppuccino"
      end,
    },
    {
      "shaunsingh/nord.nvim",
      config = function()
        vim.g.nord_borders = true
      end,
    },
    { "tanvirtin/monokai.nvim" },
  },
}

vim.cmd [[ au CmdWinEnter * quit ]]
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
