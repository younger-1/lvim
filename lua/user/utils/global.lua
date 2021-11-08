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
  if vim.o.mouse == 'nvi' then
    -- vim.cmd[[IndentBlanklineDisable]]
    vim.wo.signcolumn = 'no'
    vim.o.mouse = ''
    vim.wo.number = false
    print 'Mouse disabled'
  else
    -- vim.cmd[[IndentBlanklineEnable]]
    vim.wo.signcolumn = 'yes'
    vim.o.mouse = 'nvi'
    vim.wo.number = true
    print 'Mouse enabled'
  end
end