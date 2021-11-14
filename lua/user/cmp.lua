-- [Default mappings](https://github.com/hrsh7th/nvim-cmp/blob/main/lua/cmp/config/default.lua)

-- mapping = {
--   ['<Down>'] = mapping({
--     i = mapping.select_next_item({ behavior = types.cmp.SelectBehavior.Select }),
--     c = function(fallback)
--       local cmp = require('cmp')
--       cmp.close()
--       vim.schedule(cmp.suspend())
--       fallback()
--     end,
--   }),
--   ['<Up>'] = mapping({
--     i = mapping.select_prev_item({ behavior = types.cmp.SelectBehavior.Select }),
--     c = function(fallback)
--       local cmp = require('cmp')
--       cmp.close()
--       vim.schedule(cmp.suspend())
--       fallback()
--     end,
--   }),
--   ['<Tab>'] = mapping({
--     c = function(fallback)
--       local cmp = require('cmp')
--       if #cmp.core:get_sources() > 0 and not cmp.get_config().experimental.native_menu then
--         if cmp.visible() then
--           cmp.select_next_item()
--         else
--           cmp.complete()
--         end
--       else
--         fallback()
--       end
--     end,
--   }),
--   ['<S-Tab>'] = mapping({
--     c = function(fallback)
--       local cmp = require('cmp')
--       if #cmp.core:get_sources() > 0 and not cmp.get_config().experimental.native_menu then
--         if cmp.visible() then
--           cmp.select_prev_item()
--         else
--           cmp.complete()
--         end
--       else
--         fallback()
--       end
--     end,
--   }),
--   ['<C-n>'] = mapping(mapping.select_next_item({ behavior = types.cmp.SelectBehavior.Insert }), { 'i', 'c' }),
--   ['<C-p>'] = mapping(mapping.select_prev_item({ behavior = types.cmp.SelectBehavior.Insert }), { 'i', 'c' }),
--   ['<C-y>'] = mapping.confirm({ select = false }),
--   ['<C-e>'] = mapping.abort(),
-- },

local cmp = require "cmp"

lvim.builtin.cmp.mapping["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" })
lvim.builtin.cmp.mapping["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" })
-- lvim.builtin.cmp.mapping["<C-e>"] = cmp.mapping(cmp.mapping.abort(), { "i", "c" })
-- lvim.builtin.cmp.mapping["<C-e>"] = cmp.mapping {
--   i = cmp.mapping.abort(),
--   c = cmp.mapping.close(),
-- }

lvim.builtin.cmp = vim.tbl_deep_extend("force", lvim.builtin.cmp, {
  -- mapping = {
  -- ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
  -- ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
  -- ["<C-e>"] = cmp.mapping {
  --   i = cmp.mapping.abort(),
  --   c = cmp.mapping.close(),
  -- },
  -- },
  sources = {
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "luasnip" },
    { name = "cmp_tabnine" },
    { name = "nvim_lua" },
    { name = "buffer" },
    { name = "calc" },
    { name = "emoji" },
    { name = "treesitter" },
    { name = "crates" },
  },
})

-- Use buffer source for `/`
cmp.setup.cmdline("/", {
  sources = {
    { name = "buffer" },
  },
})

cmp.setup.cmdline("?", {
  sources = {
    { name = "buffer" },
  },
})
-- Use cmdline & path source for ':'
cmp.setup.cmdline(":", {
  sources = {
    { name = "path" },
    { name = "cmdline" },
  },
})
