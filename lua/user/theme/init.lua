local M = {}

local themes = {
  sonokai = { idx = 0, "default", "atlantis", "andromeda", "shusia", "maia", "espresso" },
  edge = { idx = 0, "default", "aura", "neon" },
  everforest = { idx = 0, "medium", "soft", "hard" },
  tokyonight = { idx = 0, "storm", "night" },
  material = { idx = 0, "darker", "lighter", "palenight", "oceanic", "deep ocean" },
  catppuccino = { idx = 0, "catppuccino", "dark_catppuccino", "light_melya", "neon_latte", "soft_manilo" },
  vscode = { idx = 0, "dark", "light" },
  -- TODO:
  -- nightfox = { "nightfox", "nordfox", "palefox", "dayfox" },
  -- monokai = { "monokai", "monokai_pro", "monokai_soda" },
}
-- pp(themes["material"].idx)
-- pp(themes["material"][2])

M.change_style = function(colorname)
  local idx = themes[colorname].idx
  local style = themes[colorname][idx]
  print(colorname .. " style: " .. style)
  if colorname == "catppuccino" then
    vim.cmd("colorscheme " .. style)
    return
  elseif colorname == "everforest" then
    vim.g[colorname .. "_" .. "background"] = style
  else
    vim.g[colorname .. "_" .. "style"] = style
  end
  vim.cmd("colorscheme " .. colorname)
end

M.toggle_style = function()
  local colorname = vim.g.colors_name
  if colorname == nil then
    print "colorscheme is nil"
    return
  elseif themes[colorname] == nil then
    print(colorname .. " only has one style!")
    return
  end
  themes[colorname].idx = (themes[colorname].idx % table.getn(themes[colorname])) + 1
  M.change_style(colorname)
end

return M
