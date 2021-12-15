require("lvim.lsp.manager").setup("sumneko_lua", {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
        path = {
          "lua/?.lua",
          "lua/?/init.lua",
        },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME"] = true,
          [vim.fn.stdpath "config"] = true,
          [_G.packer_plugins["lua-dev.nvim"].path] = true,
          [_G.packer_plugins["plenary.nvim"].path] = true,
          [_G.packer_plugins["telescope.nvim"].path] = true,
        },
        maxPreload = 2000,
        preloadFileSize = 200,
      },
    },
  },
})
