![LunarVim Demo](./utils/media/lunarvim_logo_dark.png)

<div align="center"> <p>
    <a href="https://github.com/lunarvim/LunarVim/releases/latest">
      <img alt="Latest release" src="https://img.shields.io/github/v/release/lunarvim/LunarVim" />
    </a>
    <a href="https://github.com/lunarvim/LunarVim/pulse">
      <img alt="Last commit" src="https://img.shields.io/github/last-commit/lunarvim/LunarVim"/>
    </a>
    <a href="https://github.com/lunarvim/LunarVim/blob/main/LICENSE">
      <img src="https://img.shields.io/github/license/lunarvim/lunarvim?style=flat-square&logo=GNU&label=License" alt="License"
    />
    <a href="https://patreon.com/chrisatmachine" title="Donate to this project using Patreon">
      <img src="https://img.shields.io/badge/patreon-donate-yellow.svg" alt="Patreon donate button" />
    </a>
    <a href="https://twitter.com/intent/follow?screen_name=chrisatmachine">
      <img src="https://img.shields.io/twitter/follow/chrisatmachine?style=social&logo=twitter" alt="follow on Twitter">
    </a>
</p> </div>

## LunarVim

> <https://www.lunarvim.org/>
> <https://github.com/LunarVim/LunarVim>
> <https://www.lunarvim.org/dev/#getting-started>

An IDE layer for Neovim with sane defaults which works OOTB(out-of-the-box). Completely free and community driven.

## Project Goals

1. Provide basic functionalities required from an IDE
    - LSP
    - Formatting/Linting
    - Debugging
    - Treesitter
    - Colorschemes
2. Be as fast and lean as possible
    - Lazy loading
    - Not a single extra plugin
    - User configurable lang/feature enable/disable
3. Provide a [simple and easy](https://github.com/LunarVim/LunarVimCommunity) way for users to share their own configuration or use others.
4. Hot reload of configurations
    - Hot install of lsp/treesitter/formatter required upon openning a filetype for the first time
5. Provide a stable & maintainable error free configuration layer over neovim
    - With the help of the community behind it
    - Github workflow testing
    - Freezing plugin versions
6. Provide detailed documentation
    - Video series on how to configure LunarVim as an IDE for each lang
7. Valhalla

## Config

- <https://github.com/ChristianChiarulli/lvim>
- <https://github.com/abzcoding/lvim>
- <https://github.com/rebuilt/lvim>
- <https://github.com/jimcornmell/lvim>

## Issues

- [ ]  [[Feature]: Windows setup](https://github.com/LunarVim/LunarVim/issues/804)
- [ ]  [[Feature]: Keymapping Tables](https://github.com/LunarVim/LunarVim/issues/1548)
- [ ]  [[Bug]: Remove nlsp-settings from LunarVim](https://github.com/LunarVim/LunarVim/issues/1392)
- [x] @me [[Bug]: can't get gd to work properly in lua projects](https://github.com/LunarVim/LunarVim/issues/1602)
- [x] @me [[Bug]: can't not use nvim-telescope/telescope-packer.nvim](https://github.com/LunarVim/LunarVim/issues/1610)
- [ ]  [[Bug]: Can't set markdown linters](https://github.com/LunarVim/LunarVim/issues/1554)
- [ ]  [[Bug]: Can't set up write-good linter for markdown](https://github.com/LunarVim/LunarVim/issues/1249)
- [ ]  [[Feature]: Add save without formatting](https://github.com/LunarVim/LunarVim/issues/897)

## Pull requests

[[Feature]: Add save without formatting](https://github.com/LunarVim/LunarVim/pull/898)
[[Feature]: Add support for saving a file without formatting](https://github.com/LunarVim/LunarVim/pull/1153)
[[Feature]: Add installation script for Windows](https://github.com/LunarVim/LunarVim/pull/1261)
[[Feature]: Add lunarvim binary for windows 10](https://github.com/LunarVim/LunarVim/pull/1515)
[refactor: auto-generate language configuration](https://github.com/LunarVim/LunarVim/pull/1584)
[feat: add prelimenary LvimUpdate command](https://github.com/LunarVim/LunarVim/pull/1634)
[WIP: lua keymaps and docs](https://github.com/neovim/neovim/pull/13823)

## TODO

- [ ] add some common library or plugin path to lsp runtime path by `lvim.lang.lua.lsp.setup`
- [ ] move all uncommon plugins' mappings to buffer-mappings by condition or `ftplugin` or `ftdetect`
- [ ] more support for clangd lsp feature like auto-import
- [ ] understand [](https://github.com/LunarVim/LunarVim/issues/1600#issuecomment-925027298)
- [ ] lsp for save without formatting(:h :autoformat :formatting) [](https://github.com/LunarVim/LunarVim/issues/1600#issuecomment-925027298)
- [ ] use lua-dev [](https://github.com/mvllow/dots/blob/main/.config/nvim/init.lua#L184)
- [ ] refactor plugins' configuration in `user` fold, perhaps using `require` to generate `lvim.plugins`
- [ ] <C-w> for zoom, modes.nvim, filetype.nvim, better-escape, startup-time
- [ ] auto-session
- [ ] sudo lvim
- [ ] lua require('focus').focus_toggle()
- [ ] update `lunarvim` and show difference
- [ ] add keymappings to convert between floating-window
- [ ] use [feat: add trim_newlines formatter](https://github.com/jose-elias-alvarez/null-ls.nvim/commit/f9ca1200102655b21d0d6cc7648917e054d3e123)
- [ ]  [Workspace search and replace](https://github.com/nvim-telescope/telescope.nvim/issues/875)
- [ ]  [Search and replace across multiply files](https://github.com/nvim-lua/wishlist/issues/18)
- [ ]  [Code coverage in editor](https://github.com/nvim-lua/wishlist/issues/31)
- [ ]  [Edit git commit and git rebase -i inside neovim](https://github.com/nvim-lua/wishlist/issues/29)

## Outline

Startup

- require("bootstrap"):init()
  - update runtime-dir
  - require("impatient").setup()
  - require("config"):init { config_path }
    - require("config.defaults")
      - lvim
      - lvim.lang
    - require("core.builtins").config()
      - require("keymappings").config()
        - lvim.keys
      - require("core.which-key").config()
      - require("core.gitsigns").config()
      - require("core.cmp").config()
      - require("core.dashboard").config()
      - require("core.dap").config()
      - ...
    - require("config.settings").load_options()
  - require("plugin-loader"):init { path }

- require("config"):load()
  - local autocmds = require("core.autocmds")
    - lvim.autocommands
  - luafile config_path
  - autocmds.define_augroups(lvim.autocommands)
  - require("config.settings").load_commands()
- local plugins = require "plugins"
  - { config = require("core.[]").setup() }
- require("plugin-loader"):load { plugins, lvim.plugins }

- require("core.log")
- vim.cmd("colorscheme " .. lvim.colorscheme) -- Colorscheme must get called after plugins are loaded or it will break new installs.
- require("utils").toggle_autoformat()
- require("core.commands").load(commands.defaults)
- require("lsp").global_setup()
- require("keymappings").setup()

Reload

- require('utils').reload_lv_config()
  - require("core.lualine").config()
  - require("config"):load()
  - require("keymappings").setup() -- this should be done before loading the plugins
  - utils.toggle_autoformat()
  - require("plugin-loader"):load { plugins, lvim.plugins }
  - vim.cmd ":PackerCompile"
  - vim.cmd ":PackerInstall"
  - require("lsp.null-ls").setup(vim.bo.filetype, { force_reload = true })

## Insight

```log
# start
FixCursorHold.nvim  nlsp-settings.nvim  nvim-lspconfig  nvim-treesitter    packer.nvim   popup.nvim    telescope.nvim
lualine.nvim        null-ls.nvim        nvim-tree.lua   nvim-web-devicons  plenary.nvim  project.nvim
# opt
barbar.nvim  dashboard-nvim  friendly-snippets  gitsigns.nvim  nvim-autopairs
nvim-comment  nvim-compe  nvim-lspinstall  nvim-toggleterm.lua  vim-vsnip  which-key.nvim
```

```viml
lua print(vim.inspect(lvim.lang.lua))
echo luaeval("vim.inspect(lvim.lang.lua)")

output:
{
  formatters = {},
  linters = {},
  lsp = {
    provider = "sumneko_lua",
    setup = {
      cmd = { "/home/young/.local/share/nvim/lspinstall/lua/sumneko-lua-language-server", "-E", "/home/young/.local/share/nvim/lspinstall/lua/main.lua" },
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim", "lvim" }
          },
          runtime = {
            path = { "./?.lua", "/usr/share/luajit-2.0.5/?.lua", "/usr/local/share/lua/5.1/?.lua", "/usr/local/share/lua/5.1/?/init.lua", "/usr/share/lua/5.1/?.lua", "/usr/share/lua/5.1/?/init.lua" },
            version = "LuaJIT"
          },
          workspace = {
            library = {
              ["/home/young/.local/share/lunarvim/lvim/lua"] = true,
              ["/usr/share/nvim/runtime/lua"] = true,
              ["/usr/share/nvim/runtime/lua/vim/lsp"] = true
            },
            maxPreload = 100000,
            preloadFileSize = 1000
          }
        }
      }
    }
  }
}
```

```viml
lua print(vim.inspect(lvim.lang.lua.lsp.setup.capabilities.textDocument.completion))

output:
{
  completionItem = {
    commitCharactersSupport = false,
    deprecatedSupport = false,
    documentationFormat = { "markdown", "plaintext" },
    preselectSupport = false,
    resolveSupport = {
      properties = { "documentation", "detail", "additionalTextEdits" }
    },
    snippetSupport = true
  },
  completionItemKind = {
    valueSet = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25 }
  },
  contextSupport = false,
  dynamicRegistration = false
}
```

```viml
lua print(vim.inspect(require"lspinstall/util".extract_config("sumneko_lua")))
lua print(vim.inspect(require'lspconfig'["sumneko_lua"].document_config))

lua print(vim.inspect(require'lspinstall/servers'.lua))

lua print(vim.inspect(require'lspconfig/configs'))

lua print(vim.inspect(lvim.builtin.telescope.defaults.mappings.i))
```

## LSP

```lua
:h vim.lsp.client
lua pp(vim.lsp.get_client_by_id(1).server_capabilities)
lua pp(vim.lsp.get_client_by_id(1).resolved_capabilities)

lua pp(require("lsp").get_ls_capabilities())

:h vim.lsp.start_client

lua pp(vim.lsp.diagnostic.get_line_diagnostics())

```

- From `:h lsp-config`

```lua
local custom_lsp_attach = function(client)
  -- See `:help nvim_buf_set_keymap()` for more information
  vim.api.nvim_buf_set_keymap(0, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true})
  vim.api.nvim_buf_set_keymap(0, 'n', '<c-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true})
  -- ... and other keymappings for LSP

  -- Use LSP as the handler for omnifunc.
  --    See `:help omnifunc` and `:help ins-completion` for more information.
  vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- For plugins with an `on_attach` callback, call them here. For example:
  -- require('completion').on_attach()
end

-- An example of configuring for `sumneko_lua`,
--  a language server for Lua.

-- set the path to the sumneko installation
local system_name = "Linux" -- (Linux, macOS, or Windows)
local sumneko_root_path = '/path/to/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

require('lspconfig').sumneko_lua.setup({
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  -- An example of settings for an LSP server.
  --    For more options, see nvim-lspconfig
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
    }
  },

  on_attach = custom_lsp_attach
})
```

## Testimonials

> "I have the processing power of a potato with 4 gb of ram and LunarVim runs perfectly."
>
> - @juanCortelezzi, LunarVim user.

> "My minimal config with a good amount less code than LunarVim loads 40ms slower. Time to switch."
>
> - @mvllow, Potential LunarVim user.

<div align="center" id="madewithlua">

[![Lua](https://img.shields.io/badge/Made%20with%20Lua-blue.svg?style=for-the-badge&logo=lua)](#madewithlua)

</div>

![LunarVim Demo](./utils/media/lunarvim_logo_dark_new.png)
