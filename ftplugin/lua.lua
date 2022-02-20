-- TODO: lunarvim lua-dev

local opts = require("young.lsp.lua").opts
opts = vim.tbl_deep_extend('force', opts, {
  lvim_provider = false,
  settings = {
    Lua = {
      workspace = {
        library = {
          [vim.fn.stdpath "config"] = true,
          [require("lvim.utils").join_paths(get_runtime_dir(), "lvim")] = true,
          -- [_G.packer_plugins["telescope.nvim"].path] = true,
        },
      },
      diagnostics = {
        globals = {
          'lvim',
          'vim',
        },
      },
    },
  },
})

local servers = require "nvim-lsp-installer.servers"
local server_available, requested_server = servers.get_server "sumneko_lua"
if server_available then
  opts.cmd_env = requested_server:get_default_options().cmd_env
end

require("lvim.lsp.manager").setup("sumneko_lua", opts)
