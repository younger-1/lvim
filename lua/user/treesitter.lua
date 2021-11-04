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

