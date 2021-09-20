-- [](https://github.com/glepnir/nvim-lua-guide-zh#tips)
function _G.pp(...)
  local objects = vim.tbl_map(vim.inspect, { ... })
  print(unpack(objects))
end
