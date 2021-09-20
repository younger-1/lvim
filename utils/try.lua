--[[
  0. Builtins
  [](http://www.lua.org/manual/5.1/manual.html#5.1)
--]]

-- [unpack](https://www.lua.org/pil/5.1.html)
---@returns all elements from the array, starting from index 1
-- print(unpack { 10, 20, 30 }) --> 10   20   30
-- local a, b = unpack { 10, 20, 30 } -- a=10, b=20, 30 is discarded

-- [select](https://stackoverflow.com/questions/6929117/what-does-it-do-for-i-1-select)
-- print(select "#") --> 0
-- print(select("#", { 1, 2, 3 })) --> 1 (single table as argument)
-- print(select("#", 1, 2, 3)) --> 3
-- print(select("#", { 1, 2, 3 }, 4, 5, { 6, 7, 8 })) --> 4 (a table, 2 numbers, another table)

-- [table]

---@version >5.2, JIT
-- local a = table.pack(4, 6, 5)

-- local s = table.concat({ 3, 4, 5 }, "-")
-- print(vim.inspect(s)) -- "3-4-5"

-- local b = { "u", "i", "o" }
-- for _, v in ipairs { "i", "p" } do
--   table.insert(b, v)
-- end
-- print(vim.inspect(b)) -- { "u", "i", "o", "i", "p" }

-- local c = { u = 3, i = 1, o = 2 }
-- for k, v in pairs { i = 3, g = 4 } do
--   c[k] = v
-- end
-- print(vim.inspect(c))

--[[
  1. vim
--]]
local t = { "a", "b", "c" }
local m = { b = "rust", c = "go", a = "python" }
vim.list_extend(t, { "c", "d" })
-- print(vim.inspect(t)) -- { "a", "b", "c", "c", "d" }
-- print(vim.inspect(vim.tbl_keys(t))) -- { 1, 2, 3, 4, 5 }
-- print(vim.inspect(vim.tbl_values(t))) -- { "a", "b", "c", "c", "d" }

t = vim.tbl_extend("force", t, { "x", "y", 1, 2 })
print(vim.inspect(t)) -- { "x", "y", 1, 2, "d" }
-- print(vim.tbl_islist(t)) -- true

local t1 = vim.list_slice(t, 2, 3)
-- print(vim.inspect(t1)) -- { "y", "1" }

t1 = vim.tbl_filter(function(value)
  return type(value) == "number"
end, t)
-- print(vim.inspect(t1)) -- { 1, 2 }

t1 = vim.tbl_map(function(value)
  return value .. 0
end, t)
-- print(vim.inspect(t1)) -- { "x0", "y0", "10", "20", "d0" }

--[[
  2. plenary
--]]

-- [tbl]
local tbl = require "plenary.tbl"
local t2 = tbl.pack(4, 6, 5)

-- [functional]
local fcl = require "plenary.functional"

local m2 = fcl.kv_pairs(m)
-- print(vim.inspect(m2)) -- { { "b", "rust" }, { "c", "go" }, { "a", "python" } }

m2 = fcl.kv_map(function(elem)
  return elem[2] .. "," .. elem[1]
end, m)
-- print(vim.inspect(m2)) -- { "rust,b", "go,c", "python,a" }

-- t2 = table.concat(t, "|")
t2 = fcl.join(t, "|")
-- print(vim.inspect(t2)) -- "x|y|1|2|d"

-- [iterators]
---@contains iter, wrap, unwrap, range, duplicate, from_fun, zeros, ones, rands, split, words, lines, chain, zip
---@methods of Iterator: for_each, stateful, map, flatten, filter, any, all, find, tolist, tolistn, tomap,
local iter = require "plenary.iterators"
local it = iter.iter(m)
it:for_each(function(k, v)
  print(v .. ":" .. k)
end)
m2 = it
  :map(function(k, v)
    return v .. ":" .. k
  end)
  :tolist()
print(vim.inspect(m2)) -- { "rust:b", "go:c", "python:a" }

--[[
  3. my tools
--]]
local to = require "tools"
local m3 = to.apply_defaults(m, { a = "lua", d = "zig" })
print(vim.inspect(m3)) -- { a = "python", b = "rust", c = "go", d = "zig" }

local t3 = vim.deepcopy(t)
to.add_to_set(t3, { "x", 3, "x" })
print(vim.inspect(t3))
