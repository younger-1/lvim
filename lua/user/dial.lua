local dial = require "dial"
vim.cmd [[
  nmap <C-a> <Plug>(dial-increment)
  nmap <C-x> <Plug>(dial-decrement)
  vmap <C-a> <Plug>(dial-increment)
  vmap <C-x> <Plug>(dial-decrement)
  vmap g<C-a> <Plug>(dial-increment-additional)
  vmap g<C-x> <Plug>(dial-decrement-additional)
]]

-- Toggle true / false
dial.augends["custom#boolean"] = dial.common.enum_cyclic {
  name = "boolean",
  strlist = { "true", "false" },
}

-- For Languages which prefer True/False, e.g. python.
dial.augends["custom#Boolean"] = dial.common.enum_cyclic {
  name = "Boolean",
  strlist = { "True", "False" },
}

-- lua print(vim.inspect(require "dial".config))

-- Add a few of augends into default searchlist
local settings = {
  "number#decimal",
  "number#decimal#fixed#zero",
  "number#hex",
  "number#binary",
  "color#hex",
  "markup#markdown#header",
  "custom#Boolean",
  "custom#boolean",
}

-- dial.config.searchlist.normal = settings

-- for _, v in ipairs(settings) do
--   table.insert(dial.config.searchlist.normal, v)
-- end

require("user.utils").add_to_set(dial.config.searchlist.normal, settings)
