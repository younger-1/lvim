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

local icon = require "user.theme.icons"

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
    b = {
      -- ["1"] = { "<cmd>BufferGoto 1<cr>", icon.numbers.a[1] },
      -- ["2"] = { "<cmd>BufferGoto 2<cr>", icon.numbers.a[2] },
      -- ["3"] = { "<cmd>BufferGoto 3<cr>", icon.numbers.a[3] },
      l = { "<cmd>BufferLast<cr>", "Last" },
      p = { "<cmd>BufferPin<cr>", "Pin" },
      B = {
        "<cmd>BufferOrderByBufferNumber<cr>",
        "Sort by BufferNumber",
      },
      W = {
        "<cmd>BufferOrderByWindowNumber<cr>",
        "Sort by WindowNumber",
      },
      -- Tabline
      a = { ":TablineToggleShowAllBuffers<cr>", "Tabline Toggle All" },
      t = { ":TablineTabNew ", "Tabline New" },
      T = { ":TablineCustom ", "Tabline+" },
      d = { ":TablineBuffersBind ", "Tabline Bound" },
      u = { ":TablineBuffersClearBind<cr>", "Tabline Unbound" },
      r = { ":TablineTabRename ", "Tabline Rename" },
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
      ["<C-e>"] = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Diagnostics LocList" },
      ["]"] = { "<Cmd>lua vim.lsp.buf.outgoing_calls()<CR>", "Outgoing Calls" },
      ["["] = { "<Cmd>lua vim.lsp.buf.incoming_calls()<CR>", "Incoming Calls" },
      -- s = { "<Cmd>lua vim.lsp.buf.document_symbol()<CR>", "Document Symbols" },
      -- S = { "<Cmd>lua vim.lsp.buf.workspace_symbol()<CR>", "Workspace Symbols" },
      -- ["'"] = {
      --   "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics{ show_header = false, border = 'single' }<cr>",
      --   "Diagnostics",
      -- },
      [" "] = {
        name = "Telescope",
        -- DIR
        d = { "<cmd>Telescope lsp_definitions<cr>", "Def" },
        i = { "<cmd>Telescope lsp_implementations<cr>", "Impl" },
        r = { "<cmd>Telescope lsp_references<cr>", "Ref" },
        --
      },
      -- a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
      a = { "<cmd>Telescope lsp_code_actions<cr>", "Code Action" },
      A = { "<cmd>Telescope lsp_range_code_actions<cr>", "Range Action" },
      c = { "<cmd>CodeActionMenu<cr>", "Code Action" },
      d = { "<cmd>Telescope lsp_document_diagnostics<cr>", "Document Diagnostics" },
      w = { "<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics" },
      W = { "<cmd>lua pp(vim.lsp.buf.list_workspace_folders())<cr>", "Workspace folders" },
      -- f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
      F = {
        function()
          vim.lsp.buf.formatting_sync()
          vim.cmd "write"
        end,
        "Format & Save",
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
      [" "] = { "<cmd>Telescope resume<CR>", "" },
      ["<tab>"] = { "<cmd>Telescope<CR>", "" },
      ["<C-q>"] = { "<cmd>Telescope quickfix<CR>", "QuickList" },
      ["<C-e>"] = { "<cmd>Telescope loclist<CR>", "LocList Bug" },
      -- ["<lt>"] = { "<cmd>Telescope quickfix<CR>", "QuickList" },
      -- ["<gt>"] = { "<cmd>Telescope loclist<CR>", "LocList" },
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
      b = "Biscuits",
      l = { ":lua require('user.tools').tabline_toggle()<cr>", "Tabline" },
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
        m = { [[:set mouse=<C-R>=&mouse == "" ? "nvi" : ""<CR><cr>]], "mouse" },
        M = { ":lua ToggleMouse()<cr>", "mouse+" },
        f = { ":call FoldTextToggle()<cr>", "hightlight" },
        y = { [[:set clipboard=<C-R>=&clipboard == "" ? "unnamedplus" : ""<CR><cr>]], "clipboard" },
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
