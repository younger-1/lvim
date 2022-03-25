---[[--------------------------------------------]]---
--      config.lua - Configuration for LunarVim     --
--             Author: Younger-1@github             --
---[[--------------------------------------------]]---

vim.cmd [[packadd! filetype.nvim]]

local ok_young = pcall(function()
  -- require("young.mod.notify").done()
  require "young.utils.global"
  require "young.cfg.global"
  require "young.cfg.option"
end)

if not ok_young then
  vim.notify("[Young]: configuring fail", vim.log.levels.WARN)
  -- In startup, nvim do not have colorscheme, so Highlight group 'Normal' has no background highlight
  -- FIXME: use async or timer
  -- require("notify")("configuring fail", "warn", {
  --   title = "Young"
  -- })
end

vim.opt.clipboard = ""
vim.opt.cmdheight = 1
vim.opt.mouse = ""
vim.opt.scrolloff = 4

-- require("user.lualine").bubbles()
-- require "user.dashboard"
require "user.treesitter"
require "user.telescope"
require "user.whichkey"
require "user.barbar"
require "user.cmp"

young = "Young"

-- General
lvim.format_on_save = false
lvim.transparent_window = false
lvim.colorscheme = "onedarker"
lvim.log.level = "info"

lvim.builtin.alpha.active = true
-- lvim.builtin.alpha.mode = "startify"
lvim.builtin.terminal.active = true
lvim.builtin.dap.active = true
lvim.builtin.notify.active = true
lvim.builtin.gitsigns.opts.numhl = true
lvim.builtin.gitsigns.opts.keymaps["x ih"] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>'
lvim.builtin.cmp.confirm_opts.select = false
-- lvim.builtin.project.silent_chdir = false

-- LSP
lvim.lsp.automatic_servers_installation = true
lvim.lsp.diagnostics.virtual_text = false

---@usage Select which servers should be configured manually. Requires `:LvimCacheRest` to take effect.
-- vim.list_extend(lvim.lsp.override, { "jdtls" })
-- vim.list_extend(lvim.lsp.override, { "sumneko_lua" })

-- require("user.json_schemas").setup()
-- [](https://github.com/LunarVim/LunarVim/issues/1639)
-- [jsonls](https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#jsonls)
-- merely add `require("lsp").setup "json"` to `ftplugin/jsonc.lua` doesn't work
-- lvim.lang.json.lsp.setup.filetypes = { "json", "jsonc" }

require("lvim.lsp.null-ls.formatters").setup {
  { command = "stylua" },
  { command = "markdownlint", args = { "--config", vim.fn.expand "~/dotter/markdownlint.jsonc" } },
  { command = "prettier", filetypes = { "yaml" } },
  { command = "clang_format", filetypes = { "cpp" } },
  { command = "fixjson" },
}

require("lvim.lsp.null-ls.linters").setup {
  -- { command = "selene" },
  { command = "markdownlint", args = { "--config", vim.fn.expand "~/dotter/markdownlint.jsonc" } },
  -- { command = "cppcheck" },
}

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
    --
    ["<C-a>"] = "<Home>",
    ["<C-e>"] = "<End>",
    --
    ["<A-f>"] = "<S-Right>",
    ["<A-b>"] = "<S-Left>",
    --
    -- ["<C-b>"] = "<Left>",
    -- ["<C-f>"] = "<Right>",
    --
    -- Move line in insert mode
    ["<C-Up>"] = "<C-o>:m .-2<CR>",
    ["<C-Down>"] = "<C-o>:m .+1<CR>",
  },
  command_mode = {
    ["<C-V>"] = "<C-R>+",
    --
    ["<C-a>"] = { "<Home>", { silent = false } },
    ["<C-e>"] = { "<End>", { silent = false } },
    --
    ["<A-f>"] = { "<S-Right>", { silent = false } },
    ["<A-b>"] = { "<S-Left> ", { silent = false } },
    --
    -- ["<C-b>"] = "<Left>",
    -- ["<C-f>"] = "<Right>",
  },
  normal_mode = {
    ["]e"] = ":lnext<CR>",
    ["[e"] = ":lprev<CR>",
    ["<C-e>"] = ":call LocListToggle()<CR>",
    -- Remap for dealing with word wrap
    k = { "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true } },
    j = { "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true } },
    --
    Y = "y$",
    ZA = ":wqa<CR>",
    ["g<C-l>"] = "<cmd>nohlsearch<cr><C-l>",
  },
  term_mode = {
    JJ = "<C-\\><C-N>",
    JK = "<C-\\><C-N>",
  },
  visual_mode = {
    d = [["_d]], -- Use `x` to cut
    X = [["+x]], -- Use `X` for system-cut
    Y = [["+y]], -- Use `Y` for system-copy
  },
})

vim.cmd [[
onoremap H ^
vnoremap H ^
onoremap L $
vnoremap L $

" replace word under cursor
nnoremap & :<c-u>/g<home>%s/<c-r><c-w>/

" for finding syntax ids for non TS enabled languages
map <F3> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>
]]

lvim.plugins = {
  {
    vim.fn.stdpath "config",
    as = "younger-1",
  },
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
    branch = vim.fn.has "nvim-0.6" == 1 and "master" or "0.5-compat",
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
  {
    "code-biscuits/nvim-biscuits",
    event = "BufRead",
    config = function()
      require "user.biscuits"
    end,
  },
  -- [Text Object]
  -- {},
  -- [Motion]
  {
    -- {
    --   "unblevable/quick-scope",
    --   event = "BufRead",
    --   config = function()
    --     require "user.quickscope"
    --   end,
    -- },
    -- {
    --   "abecodes/tabout.nvim",
    --   config = function()
    --     require("user.tabout").config()
    --   end,
    --   wants = { "nvim-treesitter" }, -- or require if not used so far
    --   after = { "nvim-cmp", "LuaSnip" }, -- if a completion plugin is using tabs load it before
    -- },
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
        require "young.mod.matchup"
      end,
    },
    {
      "haya14busa/vim-asterisk",
      config = function()
        require "user.asterisk"
      end,
    },
    -- {
    --   "phaazon/hop.nvim",
    --   event = "BufRead",
    --   config = function()
    --     require("user.hop").config()
    --   end,
    -- },
    {
      "ggandor/lightspeed.nvim",
      event = "BufRead",
      config = function()
        require "young.mod.lightspeed"
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
        require "young.mod.easy-align"
      end,
    },
    {
      "monaqa/dial.nvim",
      event = "BufRead",
      commit = "3b70b2a",
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
        require("young.mod.filetype").done()
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
  -- {
  --   "folke/lua-dev.nvim",
  --   opt = true,
  --   -- ft = "lua",
  --   config = function()
  --     local luadev = require("lua-dev").setup {
  --       -- options that will be merged in the final lsp config
  --       lspconfig = lvim.lang.lua.lsp.setup,
  --       library = {
  --         vimruntime = false, -- runtime path
  --         types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
  --         -- plugins = true, -- installed opt or start plugins in packpath
  --         -- you can also specify the list of plugins to make available as a workspace library
  --         plugins = { "plenary.nvim", "telescope.nvim" },
  --       },
  --     }
  --     require("lspconfig").sumneko_lua.setup(luadev)
  --   end,
  -- },
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
    {
      "kdheepak/tabline.nvim",
      config = function()
        require("young.mod.tabline").done()
      end,
      requires = { "hoob3rt/lualine.nvim", "kyazdani42/nvim-web-devicons" },
    },
  },
  -- [Code Tools]
  { "hrsh7th/cmp-emoji" },
  { "hrsh7th/cmp-calc" },
  { "hrsh7th/cmp-cmdline" },
  -- { "hrsh7th/cmp-copilot" },
  -- { "github/copilot.vim" },
  -- [Files]
  {
    "kevinhwang91/rnvimr",
    config = function()
      require "user.rnvimr"
    end,
    disable = is_windows,
  },
  {
    "tamago324/lir.nvim",
    config = function()
      require "young.mod.lir"
    end,
  },
  {
    "Shatur/neovim-session-manager",
    event = "BufRead",
    config = function()
      require "young.mod.session-manager"
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
      require("young.mod.spectre").done()
    end,
  },
  {
    "ibhagwan/fzf-lua",
    module = "fzf-lua",
    config = function()
      require "user.fzf"
    end,
    disable = is_windows,
  },
  -- [Telescope]
  { "nvim-telescope/telescope-symbols.nvim" },
  {
    "nvim-telescope/telescope-packer.nvim",
  },
  --[[ {
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make",
    config = function()
      require("telescope").load_extension "fzf"
    end,
  }, ]]
  {
    "nvim-telescope/telescope-frecency.nvim",
    requires = { { "tami5/sqlite.lua", module = "sqlite" } },
    config = function()
      require("telescope").load_extension "frecency"
    end,
  },
  {
    "nvim-telescope/telescope-github.nvim",
    config = function()
      require("telescope").load_extension "gh"
    end,
  },
  {
    "nvim-telescope/telescope-z.nvim",
    config = function()
      require("telescope").load_extension "z"
    end,
  },
  {
    "nvim-telescope/telescope-cheat.nvim",
    requires = { { "tami5/sqlite.lua", module = "sqlite" } },
    config = function()
      require("telescope").load_extension "cheat"
    end,
  },
  {
    "jvgrootveld/telescope-zoxide",
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
    requires = { { "tami5/sqlite.lua", module = "sqlite" } },
    config = function()
      require "young.mod.neoclip"
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
        require "young.mod.minimap"
      end,
    },
    {
      "folke/trouble.nvim",
      cmd = "TroubleToggle",
      module = "trouble",
      config = function()
        require("trouble").setup {
          height = 10,
          mode = "document_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
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
    run = "cd app && yarn install",
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
  {
    "wakatime/vim-wakatime",
    event = "BufReadPost",
  },
  -- [LSP]
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require "young.mod.lsp-signature"
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
    -- { "lunarvim/colorschemes" }, -- conflict with Lunarvim/onedarker.nvim
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
  { 'VimLeave', '*', 'set guicursor=a:ver25' },
  { 'User', 'PackerCompileDone', ":lua require('young.mod.notify').yntf('🎴 PackerCompile done')" },
}

-- *Must* be *S*olidity not solidity
-- require("nvim-treesitter.parsers").get_parser_configs().solidity = {
--   install_info = {
--     url = "https://github.com/JoranHonig/tree-sitter-solidity",
--     files = { "src/parser.c" },
--     requires_generate_from_grammar = true,
--   },
--   filetype = "solidity",
-- }
