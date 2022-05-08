function _G.p(...)
  local objects = vim.tbl_map(vim.inspect, { ... })
  print(table.concat(objects, "\n"))
end
