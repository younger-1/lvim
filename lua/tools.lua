local tools = {}

--- Returns a table with the default values that are missing.
--- either paramter can be empty.
--@param config (table) table containing entries that take priority over defaults
--@param default_config (table) table contatining default values if found
function tools.apply_defaults(config, default_config)
  config = config or {}
  default_config = default_config or {}
  local new_config = vim.tbl_deep_extend("keep", vim.empty_dict(), config)
  new_config = vim.tbl_deep_extend("keep", new_config, default_config)
  return new_config
end

--@param set1: set to be modified
function tools.add_to_set(set1, set2)
  for _, v in ipairs(set2) do
    if not vim.tbl_contains(set1, v) then
      table.insert(set1, v)
    end
  end
end

local unload_module = function(found, module_name, starts_with_only)
  -- TODO: Might need to handle cpath / compiled lua packages? Not sure.
  local matcher
  if not starts_with_only then
    matcher = function(pack)
      return string.find(pack, module_name, 1, true)
    end
  else
    matcher = function(pack)
      return string.find(pack, "^" .. module_name)
    end
  end

  -- Handle impatient.nvim automatically.
  local luacache = (_G.__luacache or {}).cache

  print "Start unload:"
  for pack, _ in pairs(package.loaded) do
    if matcher(pack) then
      print("    " .. pack .. " is found")
      package.loaded[pack] = nil
      table.insert(found, pack)

      if luacache then
        luacache[pack] = nil
      end
    end
  end
end

-- For manual reload
function tools.rr(...)
  local mods = { ... }

  -- Reload the current buffer
  if #mods == 0 then
    local bufpath = vim.api.nvim_buf_get_name(0)
    -- local bufpath = "/home/.local/lua/start/packer.nvim/lua/packer/clean.lua"
    bufpath = vim.split(bufpath, "/") -- { "", "home", ".local", "lua", "start", "packer.nvim", "lua", "packer", "clean.lua" }
    local pack = { vim.split(bufpath[#bufpath], ".", true)[1] } -- "clean"
    for i = #bufpath - 1, 1, -1 do
      if i == 1 and bufpath[i] ~= "lua" then
        print("Invalid pack path: " .. vim.api.nvim_buf_get_name(0))
        return
      end
      if bufpath[i] == "lua" then
        break
      end
      table.insert(pack, 1, bufpath[i])
    end
    pack = table.concat(pack, ".")
    tools.reload_file(pack)
    print("Reload: " .. pack)
    require("utils").reload_lv_config()
    return
  end

  pp(mods)
  local found = {}
  for _, mod in ipairs(mods) do
    -- require("plenary").reload.reload_module(mod)
    unload_module(found, mod, true)
  end

  print "Reload:"
  for _, pack in ipairs(found) do
    require(pack)
    print("    " .. pack .. " is updated")
  end

  require("utils").reload_lv_config()
end

-- Completion for not yet loaded plugins
-- Intended to provide completion for PackerLoad command
-- local loader_complete = function(lead, _, _)
--   local completion_list = {}
--   for name, plugin in pairs(_G.packer_plugins) do
--     if vim.startswith(name, lead) and not plugin.loaded then
--       table.insert(completion_list, name)
--     end
--   end
--   table.sort(completion_list)
--   return completion_list
-- end

function tools.rr_complete(lead, _, _)
  local completion_list = {}
  for name, _ in pairs(_G.package.loaded) do
    if vim.startswith(name, lead) then
      table.insert(completion_list, name)
    end
  end
  table.sort(completion_list)
  return completion_list
end

function tools.reload_file(pack)
  local luacache = (_G.__luacache or {}).cache
  package.loaded[pack] = nil
  if luacache then
    luacache[pack] = nil
  end
end

return tools
