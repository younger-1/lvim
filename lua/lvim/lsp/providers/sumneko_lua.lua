local opts = require("young.lsp.providers.sumneko_lua")
opts = vim.tbl_deep_extend('force', opts, {
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
-- pp(opts)

-- local servers = require "nvim-lsp-installer.servers"
-- local server_available, requested_server = servers.get_server "sumneko_lua"
-- if server_available then
--   opts.cmd_env = requested_server:get_default_options().cmd_env
-- end
-- require("lvim.lsp.manager").setup("sumneko_lua", opts)

return opts
