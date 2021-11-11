-- [](https://github.com/glepnir/nvim-lua-guide-zh#tips)
function _G.pp(...)
  local objects = vim.tbl_map(vim.inspect, { ... })
  -- print(unpack(objects))
  print(table.concat(objects, "\n"))
end

function _G.ppp(...)
  local objects = {}
  for i = 1, select("#", ...) do
    local v = select(i, ...)
    table.insert(objects, vim.inspect(v))
  end

  print(table.concat(objects, "\n"))
  return ...
end

-- Toggle to disable mouse mode and indentlines for easier paste
ToggleMouse = function()
  if vim.o.mouse == '' then
    -- vim.cmd[[IndentBlanklineEnable]]
    vim.o.mouse = 'nvi'
    -- vim.wo.signcolumn = 'yes'
    -- vim.wo.number = true
    print 'Mouse enabled'
  else
    -- vim.cmd[[IndentBlanklineDisable]]
    vim.o.mouse = ''
    -- vim.wo.signcolumn = 'no'
    -- vim.wo.number = false
    print 'Mouse disabled'
  end
end
