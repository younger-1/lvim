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

function tools.reload_file(pack)
  local luacache = (_G.__luacache or {}).cache
  package.loaded[pack] = nil
  if luacache then
    luacache[pack] = nil
  end
end

local reload_module = function(module_name, starts_with_only)
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

  pp "Start reload:"
  for pack, _ in pairs(package.loaded) do
    if matcher(pack) then
      pp(pack .. " is found")
      package.loaded[pack] = nil

      if luacache then
        luacache[pack] = nil
      end
    end
  end
end

-- For manual reload
function tools.rr(...)
  pp { ... }
  for _, mod in ipairs { ... } do
    -- require("plenary").reload.reload_module(mod)
    reload_module(mod)
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

local loader_complete = function(lead, _, _)
  local completion_list = {}
  for name, _ in pairs(_G.package.loaded) do
    if vim.startswith(name, lead) then
      table.insert(completion_list, name)
    end
  end
  table.sort(completion_list)
  return completion_list
end

return tools
