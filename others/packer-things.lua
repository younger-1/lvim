local startup = {
  { "mfussenegger/nvim-jdtls" },
  ["nvim-jdtls"] = {
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/nvim-jdtls",
  },

  {
    "haya14busa/vim-asterisk",
    config = function()
      require "user.asterisk"
    end,
  },
  ["vim-asterisk"] = {
    config = { "\27LJ\1\2-\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\18user.asterisk\frequire\0" },
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/vim-asterisk",
  },
  -- Config for: vim-asterisk
  -- try_loadstring("\27LJ\1\2-\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\18user.asterisk\frequire\0", "config", "vim-asterisk")

  {
    "mattn/vim-gist",
    requires = "mattn/webapi-vim",
    config = function()
      vim.g.gist_open_browser_after_post = 1
    end,
  },
  ["vim-gist"] = {
    config = { "\27LJ\1\2>\0\0\2\0\3\0\0054\0\0\0007\0\1\0'\1\1\0:\1\2\0G\0\1\0!gist_open_browser_after_post\6g\bvim\0" },
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/vim-gist",
  },
  ["webapi-vim"] = {
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/webapi-vim",
  },
  -- Config for: vim-gist
  -- try_loadstring("\27LJ\1\2>\0\0\2\0\3\0\0054\0\0\0007\0\1\0'\1\1\0:\1\2\0G\0\1\0!gist_open_browser_after_post\6g\bvim\0", "config", "vim-gist")
}

local event = {
  {
    "nvim-treesitter/playground",
    event = "BufRead",
  },
  playground = {
    loaded = false,
    needs_bufread = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/playground",
  },
  -- Event lazy-loads
  -- vim.cmd [[au BufRead * ++once lua require("packer.load")({'numb.nvim', 'lightspeed.nvim', 'diffview.nvim', 'gitlinker.nvim', 'spelunker.vim', 'nvim-spectre', 'nvim-notify', 'lsp_signature.nvim', 'dial.nvim', 'playground', 'nvim-bqf', 'gitsigns.nvim', 'nvim-comment', 'todo-comments.nvim'}, { event = "BufRead *" }, _G.packer_plugins)]]

  {
    "ruifm/gitlinker.nvim",
    event = "BufRead",
    config = function()
      require("user.gitlinker").config()
    end,
  },
  ["gitlinker.nvim"] = {
    config = {
      "\27LJ\1\2=\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\vconfig\19user.gitlinker\frequire\0",
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/gitlinker.nvim",
  },
  -- Event lazy-loads
  -- vim.cmd [[au BufRead * ++once lua require("packer.load")({'numb.nvim', 'lightspeed.nvim', 'diffview.nvim', 'gitlinker.nvim', 'spelunker.vim', 'nvim-spectre', 'nvim-notify', 'lsp_signature.nvim', 'dial.nvim', 'playground', 'nvim-bqf', 'gitsigns.nvim', 'nvim-comment', 'todo-comments.nvim'}, { event = "BufRead *" }, _G.packer_plugins)]]

  {
    "andymass/vim-matchup",
    event = "CursorMoved",
    config = function()
      require "user.matchup"
    end,
  },
  ["vim-matchup"] = {
    after_files = { "/home/young/.local/share/lunarvim/site/pack/packer/opt/vim-matchup/after/plugin/matchit.vim" },
    config = { "\27LJ\1\2,\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\17user.matchup\frequire\0" },
    loaded = false,
    needs_bufread = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/vim-matchup",
  },
  -- Event lazy-loads
  -- vim.cmd [[au CursorMoved * ++once lua require("packer.load")({'vim-matchup', 'vim-wordmotion'}, { event = "CursorMoved *" }, _G.packer_plugins)]]

  {
    "kamykn/spelunker.vim",
    event = "BufRead",
    config = function()
      vim.g.enable_spelunker_vim = 0
    end,
  },
  ["spelunker.vim"] = {
    after_files = {
      "/home/young/.local/share/lunarvim/site/pack/packer/opt/spelunker.vim/after/plugin/ctrlp/spelunker.vim",
    },
    config = { "\27LJ\1\0026\0\0\2\0\3\0\0054\0\0\0007\0\1\0'\1\0\0:\1\2\0G\0\1\0\25enable_spelunker_vim\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/spelunker.vim",
  },
  -- Event lazy-loads
  -- vim.cmd [[au BufRead * ++once lua require("packer.load")({'numb.nvim', 'lightspeed.nvim', 'diffview.nvim', 'gitlinker.nvim', 'spelunker.vim', 'nvim-spectre', 'nvim-notify', 'lsp_signature.nvim', 'dial.nvim', 'playground', 'nvim-bqf', 'gitsigns.nvim', 'nvim-comment', 'todo-comments.nvim'}, { event = "BufRead *" }, _G.packer_plugins)]]
}

local cmd = {
  {
    "metakirby5/codi.vim",
    cmd = "Codi",
  },
  ["codi.vim"] = {
    commands = { "Codi" },
    loaded = false,
    needs_bufread = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/codi.vim",
  },
  -- Command lazy-loads
  -- pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Codi lua require("packer.load")({'codi.vim'}, { cmd = "Codi", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
}

local keys = {
  { "AndrewRadev/splitjoin.vim", keys = { "gS", "gJ" } },
  ["splitjoin.vim"] = {
    keys = { { "", "gS" }, { "", "gJ" } },
    loaded = false,
    needs_bufread = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/splitjoin.vim",
  },
  -- Keymap lazy-loads
  -- vim.cmd [[noremap <silent> gJ <cmd>lua require("packer.load")({'splitjoin.vim'}, { keys = "gJ", prefix = "" }, _G.packer_plugins)<cr>]]
  -- vim.cmd [[noremap <silent> gS <cmd>lua require("packer.load")({'splitjoin.vim'}, { keys = "gS", prefix = "" }, _G.packer_plugins)<cr>]]
}

local ft = {
  {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = "markdown",
  },
  ["markdown-preview.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/markdown-preview.nvim",
  },
  -- Filetype lazy-loads
  -- vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]

  -- NOTE: nui is not loaded
  {
    "vuki656/package-info.nvim",
    ft = "json",
    requires = { { "MunifTanjim/nui.nvim", opt = true } },
    config = function()
      require "user.package-info"
    end,
  },
  ["package-info.nvim"] = {
    config = { "\27LJ\1\0021\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\22user.package-info\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/package-info.nvim",
  },
  ["nui.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/nui.nvim",
  },
  -- Filetype lazy-loads
  -- vim.cmd [[au FileType json ++once lua require("packer.load")({'package-info.nvim'}, { ft = "json" }, _G.packer_plugins)]]
}

local module = {
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
    module = "trouble",
    config = function()
      require("trouble").setup {}
    end,
  },
  ["trouble.nvim"] = {
    commands = { "TroubleToggle" },
    config = {
      "\27LJ\1\2\4\0\0\4\0\24\0\0274\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0003\3\5\0:\3\6\0023\3\a\0:\3\b\0023\3\t\0:\3\n\0023\3\v\0:\3\f\0023\3\r\0:\3\14\0023\3\15\0:\3\16\0023\3\17\0:\3\18\0023\3\19\0:\3\20\2:\2\21\0013\2\22\0:\2\23\1>\0\2\1G\0\1\0\nsigns\1\0\5\fwarning\bï©\nother\bï« \16information\bï\thint\bï µ\nerror\bï\16action_keys\16toggle_fold\1\3\0\0\azA\aza\15open_folds\1\3\0\0\azR\azr\16close_folds\1\3\0\0\azM\azm\15jump_close\1\2\0\0\6o\ropen_tab\1\2\0\0\n<c-t>\16open_vsplit\1\2\0\0\n<c-v>\15open_split\1\2\0\0\n<c-x>\tjump\1\3\0\0\t<cr>\n<tab>\1\0\t\rprevious\6k\frefresh\6r\nclose\6q\19toggle_preview\6P\fpreview\6p\tnext\6j\nhover\6K\vcancel\n<esc>\16toggle_mode\6m\1\0\2\tmode\30lsp_workspace_diagnostics\vheight\3\n\nsetup\ftrouble\frequire\0",
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/trouble.nvim",
  },
  module_lazy_loads = {
    ["^trouble"] = "trouble.nvim",
  },
  -- Command lazy-loads
  -- pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TroubleToggle lua require("packer.load")({'trouble.nvim'}, { cmd = "TroubleToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
}

local setup = {
  {
    "sheerun/vim-polyglot",
    setup = function()
      vim.g.polyglot_disabled = { "markdown" }
    end,
  },
  ["vim-polyglot"] = {
    loaded = true,
    needs_bufread = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/vim-polyglot",
  },
  -- Setup for: vim-polyglot
  -- try_loadstring("\27LJ\1\2@\0\0\2\0\4\0\0054\0\0\0007\0\1\0003\1\3\0:\1\2\0G\0\1\0\1\2\0\0\rmarkdown\22polyglot_disabled\6g\bvim\0", "setup", "vim-polyglot")
  -- vim.cmd [[packadd vim-polyglot]]

  {
    "pocco81/catppuccino.nvim",
    setup = function() end,
    config = function()
      require "user.theme.catppuccino"
    end,
  },
  ["catppuccino.nvim"] = {
    config = { "\27LJ\1\0026\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\27user.theme.catppuccino\frequire\0" },
    loaded = true,
    needs_bufread = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/catppuccino.nvim",
  },
  -- Setup for: catppuccino.nvim
  -- try_loadstring("\27LJ\1\2\v\0\0\1\0\0\0\1G\0\1\0\0", "setup", "catppuccino.nvim")
  -- vim.cmd [[packadd catppuccino.nvim]]
  -- Config for: catppuccino.nvim
  -- try_loadstring("\27LJ\1\0026\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\27user.theme.catppuccino\frequire\0", "config", "catppuccino.nvim")

  {
    "chaoren/vim-wordmotion",
    event = "CursorMoved",
    setup = function()
      vim.cmd [[
          let g:wordmotion_prefix = ','
        ]]
    end,
  },
  ["vim-wordmotion"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/vim-wordmotion",
  },
  -- Setup for: vim-wordmotion
  -- try_loadstring("\27LJ\1\2T\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0005          let g:wordmotion_prefix = ','\n        \bcmd\bvim\0", "setup", "vim-wordmotion")
  -- Event lazy-loads
  -- vim.cmd [[au CursorMoved * ++once lua require("packer.load")({'vim-matchup', 'vim-wordmotion'}, { event = "CursorMoved *" }, _G.packer_plugins)]]
}

local opt = {
  {
    "nvim-telescope/telescope-packer.nvim",
    opt = true,
    config = function()
      require("telescope").load_extension "packer"
    end,
  },
  ["telescope-packer.nvim"] = {
    config = {
      "\27LJ\1\2K\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0%\1\3\0>\0\2\1G\0\1\0\vpacker\19load_extension\14telescope\frequire\0",
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/telescope-packer.nvim",
  },
}

local after = {
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make",
    after = "telescope.nvim",
    config = function()
      require("telescope").load_extension "fzf"
    end,
  },
  ["telescope-fzf-native.nvim"] = {
    config = {
      "\27LJ\1\2H\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0%\1\3\0>\0\2\1G\0\1\0\bfzf\19load_extension\14telescope\frequire\0",
    },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/telescope-fzf-native.nvim",
  },
  -- vim.cmd [[ packadd telescope-fzf-native.nvim ]]
  -- Config for: telescope-fzf-native.nvim
  -- try_loadstring("\27LJ\1\2H\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0%\1\3\0>\0\2\1G\0\1\0\bfzf\19load_extension\14telescope\frequire\0", "config", "telescope-fzf-native.nvim")

  -- NOTE: sqlite is not loaded
  {
    "nvim-telescope/telescope-frecency.nvim",
    after = { "telescope.nvim", "sqlite.lua" },
    wants = "sqlite.lua",
    requires = { { "tami5/sqlite.lua", opt = true } },
    config = function()
      require("telescope").load_extension "frecency"
    end,
  },
  ["telescope-frecency.nvim"] = {
    config = {
      "\27LJ\1\2M\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0%\1\3\0>\0\2\1G\0\1\0\rfrecency\19load_extension\14telescope\frequire\0",
    },
    load_after = {
      ["sqlite.lua"] = true,
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/telescope-frecency.nvim",
    wants = { "sqlite.lua" },
  },
  ["sqlite.lua"] = {
    after = { "telescope-frecency.nvim" },
    loaded = false,
    needs_bufread = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/sqlite.lua",
  },
}

local hybrid = {
  {
    "dhruvasagar/vim-table-mode",
    cmd = "TableModeToggle",
    keys = ",tm",
    setup = function()
      vim.g.table_mode_map_prefix = ",t"
    end,
  },
  ["vim-table-mode"] = {
    commands = { "TableModeToggle" },
    keys = { { "", ",tm" } },
    loaded = false,
    needs_bufread = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/vim-table-mode",
  },
  -- Setup for: vim-table-mode
  -- try_loadstring("\27LJ\1\2:\0\0\2\0\4\0\0054\0\0\0007\0\1\0%\1\3\0:\1\2\0G\0\1\0\a,t\26table_mode_map_prefix\6g\bvim\0", "setup", "vim-table-mode")
  -- Command lazy-loads
  -- pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TableModeToggle lua require("packer.load")({'vim-table-mode'}, { cmd = "TableModeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
  -- Keymap lazy-loads
  -- vim.cmd [[noremap <silent> ,tm <cmd>lua require("packer.load")({'vim-table-mode'}, { keys = ",tm", prefix = "" }, _G.packer_plugins)<cr>]]

  { "tpope/vim-fugitive", cmd = { "Git", "GBrowse" }, ft = { "fugitive" } },
  ["vim-fugitive"] = {
    commands = { "Git", "GBrowse" },
    loaded = false,
    needs_bufread = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/vim-fugitive",
  },
  -- Command lazy-loads
  -- pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Git lua require("packer.load")({'vim-fugitive'}, { cmd = "Git", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
  -- pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GBrowse lua require("packer.load")({'vim-fugitive'}, { cmd = "GBrowse", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
  -- Filetype lazy-loads
  -- vim.cmd [[au FileType fugitive ++once lua require("packer.load")({'vim-fugitive'}, { ft = "fugitive" }, _G.packer_plugins)]]
  -- vim.cmd [[source /home/young/.local/share/lunarvim/site/pack/packer/opt/vim-fugitive/ftdetect/fugitive.vim]]
}

local __other = {}
