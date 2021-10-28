-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/young/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/young/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/young/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/young/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/young/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\1\2?\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\22lvim.core.comment\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/Comment.nvim"
  },
  ["DAPInstall.nvim"] = {
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/DAPInstall.nvim"
  },
  ["FixCursorHold.nvim"] = {
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/FixCursorHold.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/LuaSnip"
  },
  ZFVimDirDiff = {
    keys = { { "", "ZFDirDiff" }, { "", "ZFDirDiffMark" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/ZFVimDirDiff"
  },
  ["barbar.nvim"] = {
    config = { "\27LJ\1\2B\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\25lvim.core.bufferline\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/barbar.nvim"
  },
  ["better-escape.nvim"] = {
    config = { "\27LJ\1\2\1\0\0\3\0\n\0\r4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\0014\2\6\0007\2\a\0027\2\b\2:\2\t\1>\0\2\1G\0\1\0\ftimeout\15timeoutlen\6o\bvim\fmapping\1\0\1\tkeys\n<Esc>\1\3\0\0\ajk\ajj\nsetup\18better_escape\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/better-escape.nvim"
  },
  ["catppuccino.nvim"] = {
    config = { "\27LJ\1\0026\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\27user.theme.catppuccino\frequire\0" },
    loaded = true,
    needs_bufread = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/catppuccino.nvim"
  },
  ["cheat.sh-vim"] = {
    commands = { "Cheat" },
    config = { "\27LJ\1\2`\0\0\2\0\4\0\t4\0\0\0007\0\1\0'\1\1\0:\1\2\0004\0\0\0007\0\1\0'\1\1\0:\1\3\0G\0\1\0\23CheatSheetDoNotMap CheatDoNotReplaceKeywordPrg\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/cheat.sh-vim"
  },
  ["cheatsheet.nvim"] = {
    config = { "\27LJ\1\2_\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\1G\0\1\0\1\0\1#include_only_installed_plugins\1\nsetup\15cheatsheet\frequire\0" },
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/cheatsheet.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/cmp-buffer"
  },
  ["cmp-calc"] = {
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/cmp-calc"
  },
  ["cmp-emoji"] = {
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/cmp-emoji"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/cmp_luasnip"
  },
  ["codi.vim"] = {
    commands = { "Codi" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/codi.vim"
  },
  colorschemes = {
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/colorschemes"
  },
  ["dashboard-nvim"] = {
    config = { "\27LJ\1\2A\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\24lvim.core.dashboard\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/dashboard-nvim"
  },
  ["dial.nvim"] = {
    config = { "\27LJ\1\2)\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\14user.dial\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/dial.nvim"
  },
  ["diffview.nvim"] = {
    config = { "\27LJ\1\2-\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\18user.diffview\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/diffview.nvim"
  },
  edge = {
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/edge"
  },
  everforest = {
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/everforest"
  },
  ["filetype.nvim"] = {
    config = { "\27LJ\1\2-\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\18user.filetype\frequire\0" },
    loaded = true,
    needs_bufread = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/filetype.nvim"
  },
  ["focus.nvim"] = {
    config = { "\27LJ\1\2Ù\4\0\0\5\0\25\00004\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0:\2\5\0013\2\6\0:\2\a\1>\0\2\0014\0\0\0%\1\1\0>\0\2\0027\0\b\0>\0\1\0014\0\t\0007\0\n\0007\0\v\0%\1\f\0%\2\r\0%\3\14\0003\4\15\0>\0\5\0014\0\t\0007\0\n\0007\0\v\0%\1\f\0%\2\16\0%\3\17\0003\4\18\0>\0\5\0014\0\t\0007\0\n\0007\0\v\0%\1\f\0%\2\19\0%\3\20\0003\4\21\0>\0\5\0014\0\t\0007\0\n\0007\0\v\0%\1\f\0%\2\22\0%\3\23\0003\4\24\0>\0\5\1G\0\1\0\1\0\1\vsilent\2/:lua require'focus'.split_command('l')<CR>\n<C-l>\1\0\1\vsilent\2/:lua require'focus'.split_command('k')<CR>\n<C-k>\1\0\1\vsilent\2/:lua require'focus'.split_command('j')<CR>\n<C-j>\1\0\1\vsilent\2/:lua require'focus'.split_command('h')<CR>\n<C-h>\6n\20nvim_set_keymap\bapi\bvim\17focus_toggle\22excluded_buftypes\1\5\0\0\vnofile\vprompt\thelp\rquickfix\23excluded_filetypes\1\3\0\0\blir\15toggleterm\1\0\1\15signcolumn\1\nsetup\nfocus\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/focus.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/friendly-snippets"
  },
  ["fzf-lua"] = {
    config = { "\27LJ\1\2(\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\ruser.fzf\frequire\0" },
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/fzf-lua"
  },
  ["gitlinker.nvim"] = {
    config = { "\27LJ\1\2=\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\vconfig\19user.gitlinker\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/gitlinker.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\1\2@\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\23lvim.core.gitsigns\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/gitsigns.nvim"
  },
  ["glow.nvim"] = {
    commands = { "Glow" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/glow.nvim"
  },
  ["gruvbox-material"] = {
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/gruvbox-material"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\1\2.\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\19user.blankline\frequire\0" },
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["lightspeed.nvim"] = {
    config = { "\27LJ\1\2/\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\20user.lightspeed\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/lightspeed.nvim"
  },
  ["lir.nvim"] = {
    config = { "\27LJ\1\2(\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\ruser.lir\frequire\0" },
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/lir.nvim"
  },
  ["lsp_signature.nvim"] = {
    config = { "\27LJ\1\2A\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\vconfig\23user.lsp_signature\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/lsp_signature.nvim"
  },
  ["lua-dev.nvim"] = {
    config = { "\27LJ\1\2ü\1\0\0\4\0\14\0\0244\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\a\0004\2\3\0007\2\4\0027\2\5\0027\2\6\0027\2\2\2:\2\b\0013\2\t\0003\3\n\0:\3\v\2:\2\f\1>\0\2\0024\1\0\0%\2\b\0>\1\2\0027\1\r\0017\1\2\1\16\2\0\0>\1\2\1G\0\1\0\16sumneko_lua\flibrary\fplugins\1\4\0\0\20nvim-treesitter\15focus.nvim\19telescope.nvim\1\0\2\ntypes\2\15vimruntime\1\14lspconfig\1\0\0\blsp\blua\tlang\tlvim\nsetup\flua-dev\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/lua-dev.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\1\2?\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\22lvim.core.lualine\frequire\0" },
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/markdown-preview.nvim"
  },
  ["material.nvim"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/material.nvim"
  },
  ["minimap.vim"] = {
    commands = { "MinimapToggle" },
    config = { "\27LJ\1\2û\1\0\0\2\0\6\0\0174\0\0\0007\0\1\0%\1\2\0>\0\2\0014\0\0\0007\0\1\0%\1\3\0>\0\2\0014\0\0\0007\0\1\0%\1\4\0>\0\2\0014\0\0\0007\0\1\0%\1\5\0>\0\2\1G\0\1\0'let g:minimap_highlight_search = 1!let g:minimap_git_colors = 1Slet g:minimap_close_filetypes = ['startify', 'netrw', 'vim-plug', 'dashboard']\29let g:minimap_width = 10\bcmd\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/minimap.vim"
  },
  ["modes.nvim"] = {
    config = { "\27LJ\1\2Í\1\0\0\3\0\t\0\r4\0\0\0007\0\1\0)\1\2\0:\1\2\0004\0\3\0%\1\4\0>\0\2\0027\0\5\0003\1\a\0003\2\6\0:\2\b\1>\0\2\1G\0\1\0\vcolors\1\0\2\15focus_only\1\17line_opacity\4š³æÌ\t™³¦þ\3\1\0\4\vinsert\f#78ccc5\vvisual\f#f5c359\tcopy\f#9745be\vdelete\f#c75c6a\nsetup\nmodes\frequire\15cursorline\bopt\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/modes.nvim"
  },
  ["monokai.nvim"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/monokai.nvim"
  },
  neogit = {
    commands = { "Neogit" },
    config = { "\27LJ\1\0028\0\0\2\0\3\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\1G\0\1\0\nsetup\vneogit\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/neogit"
  },
  neorg = {
    config = { "\27LJ\1\2*\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\15user.neorg\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/neorg"
  },
  ["neoscroll.nvim"] = {
    config = { "\27LJ\1\2.\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\19user.neoscroll\frequire\0" },
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/neoscroll.nvim"
  },
  ["neovim-session-manager"] = {
    config = { "\27LJ\1\2›\2\0\0\4\0\15\0\0234\0\0\0%\1\1\0>\0\2\0027\0\2\0%\1\3\0>\0\2\0014\0\0\0%\1\4\0>\0\2\0027\0\5\0003\1\v\0004\2\6\0007\2\a\0027\2\b\2%\3\t\0>\2\2\2%\3\n\0$\2\3\2:\2\f\0013\2\r\0:\2\14\1>\0\2\1G\0\1\0\26autosave_ignore_paths\1\2\0\0\6~\17sessions_dir\1\0\2\26autoload_last_session\2\26autosave_last_session\2\14/sessions\tdata\fstdpath\afn\bvim\nsetup\20session_manager\rsessions\19load_extension\14telescope\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/neovim-session-manager"
  },
  ["nightfox.nvim"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/nightfox.nvim"
  },
  ["nlsp-settings.nvim"] = {
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/nlsp-settings.nvim"
  },
  ["nord.nvim"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/nord.nvim"
  },
  ["nui.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/nui.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/null-ls.nvim"
  },
  ["numb.nvim"] = {
    config = { "\27LJ\1\0028\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\vconfig\14user.numb\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/numb.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\1\2A\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\24lvim.core.autopairs\frequire\0" },
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-bqf"] = {
    config = { "\27LJ\1\2´\3\0\0\5\0\16\0\0194\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\6\0003\2\3\0003\3\4\0:\3\5\2:\2\a\0013\2\b\0:\2\t\0013\2\r\0003\3\v\0003\4\n\0:\4\f\3:\3\14\2:\2\15\1>\0\2\1G\0\1\0\vfilter\bfzf\1\0\0\15extra_opts\1\0\0\1\5\0\0\v--bind\22ctrl-o:toggle-all\r--prompt\a> \rfunc_map\1\0\r\vsclear\azc\ttabb\6T\16pscrolldown\n<C-d>\14stogglevm\n<Tab>\14pscrollup\n<C-u>\16pscrollorig\azz\15stogglebuf\azb\vfilter\azn\rprevfile\6K\ffilterr\azN\rnextfile\6J\16ptogglemode\azp\btab\6t\fpreview\1\0\0\17border_chars\1\n\0\0\bâ”‚\bâ”‚\bâ”€\bâ”€\bâ•­\bâ•®\bâ•°\bâ•¯\bâ–ˆ\1\0\2\16win_vheight\3\15\15win_height\3\15\nsetup\bbqf\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/nvim-bqf"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\1\2;\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\18lvim.core.cmp\frequire\0" },
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/nvim-cmp"
  },
  ["nvim-code-action-menu"] = {
    commands = { "CodeActionMenu" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/nvim-code-action-menu"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\1\2=\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\vconfig\19user.colorizer\frequire\0" },
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-dap"] = {
    config = { "\27LJ\1\2;\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\18lvim.core.dap\frequire\0" },
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/nvim-dap"
  },
  ["nvim-fzf"] = {
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/nvim-fzf"
  },
  ["nvim-jdtls"] = {
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/nvim-jdtls"
  },
  ["nvim-lightbulb"] = {
    config = { "\27LJ\1\2s\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0Tautocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()\bcmd\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/nvim-lightbulb"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-neoclip.lua"] = {
    config = { '\27LJ\1\2ƒ\2\0\0\4\0\f\0\0194\0\0\0%\1\1\0>\0\2\0027\0\2\0%\1\3\0>\0\2\0014\0\0\0%\1\3\0>\0\2\0027\0\4\0003\1\5\0003\2\6\0:\2\a\0013\2\t\0003\3\b\0:\3\n\2:\2\v\1>\0\2\1G\0\1\0\tkeys\6i\1\0\0\1\0\3\17paste_behind\n<c-h>\vselect\t<cr>\npaste\n<c-l>\ron_paste\1\0\1\fset_reg\1\1\0\3\21default_register\6"\fpreview\2\24content_spec_column\1\nsetup\fneoclip\19load_extension\14telescope\frequire\0' },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/nvim-neoclip.lua"
  },
  ["nvim-spectre"] = {
    config = { "\27LJ\1\2;\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\vconfig\17user.spectre\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/nvim-spectre"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\1\2@\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\23lvim.core.nvimtree\frequire\0" },
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\1\2B\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\25lvim.core.treesitter\frequire\0" },
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    commands = { "TSContextToggle" },
    config = { "\27LJ\1\2£\1\0\0\4\0\b\0\v4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\5\0003\3\4\0:\3\6\2:\2\a\1>\0\2\1G\0\1\0\rpatterns\fdefault\1\0\0\1\4\0\0\nclass\rfunction\vmethod\1\0\3\14max_lines\3\0\rthrottle\2\venable\2\nsetup\23treesitter-context\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/nvim-treesitter-context"
  },
  ["nvim-treesitter-refactor"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/nvim-treesitter-refactor"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/nvim-treesitter-textobjects"
  },
  ["nvim-treesitter-textsubjects"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/nvim-treesitter-textsubjects"
  },
  ["nvim-ts-autotag"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/nvim-ts-autotag"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["octo.nvim"] = {
    config = { "\27LJ\1\0028\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\vconfig\14user.octo\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/octo.nvim"
  },
  ["onedark.nvim"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/onedark.nvim"
  },
  ["orgmode.nvim"] = {
    config = { "\27LJ\1\0029\0\0\2\0\3\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\1G\0\1\0\nsetup\forgmode\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/orgmode.nvim"
  },
  ["package-info.nvim"] = {
    config = { "\27LJ\1\0021\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\22user.package-info\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/package-info.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/packer.nvim"
  },
  ["papercolor-theme"] = {
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/papercolor-theme"
  },
  playground = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/popup.nvim"
  },
  ["project.nvim"] = {
    config = { "\27LJ\1\2?\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\22lvim.core.project\frequire\0" },
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/project.nvim"
  },
  rnvimr = {
    config = { "\27LJ\1\2+\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\16user.rnvimr\frequire\0" },
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/rnvimr"
  },
  sonokai = {
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/sonokai"
  },
  ["spelunker.vim"] = {
    after_files = { "/home/young/.local/share/lunarvim/site/pack/packer/opt/spelunker.vim/after/plugin/ctrlp/spelunker.vim" },
    config = { "\27LJ\1\0026\0\0\2\0\3\0\0054\0\0\0007\0\1\0'\1\0\0:\1\2\0G\0\1\0\25enable_spelunker_vim\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/spelunker.vim"
  },
  ["splitjoin.vim"] = {
    keys = { { "", "gS" }, { "", "gJ" } },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/splitjoin.vim"
  },
  ["sqlite.lua"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/sqlite.lua"
  },
  ["structlog.nvim"] = {
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/structlog.nvim"
  },
  ["symbols-outline.nvim"] = {
    config = { "\27LJ\1\2;\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\vconfig\17user.outline\frequire\0" },
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/symbols-outline.nvim"
  },
  ["telescope-cheat.nvim"] = {
    config = { "\27LJ\1\2J\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0%\1\3\0>\0\2\1G\0\1\0\ncheat\19load_extension\14telescope\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/telescope-cheat.nvim"
  },
  ["telescope-frecency.nvim"] = {
    config = { "\27LJ\1\2M\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0%\1\3\0>\0\2\1G\0\1\0\rfrecency\19load_extension\14telescope\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/telescope-frecency.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/telescope-fzf-native.nvim"
  },
  ["telescope-github.nvim"] = {
    config = { "\27LJ\1\2G\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0%\1\3\0>\0\2\1G\0\1\0\agh\19load_extension\14telescope\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/telescope-github.nvim"
  },
  ["telescope-packer.nvim"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/telescope-packer.nvim"
  },
  ["telescope-symbols.nvim"] = {
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/telescope-symbols.nvim"
  },
  ["telescope-z.nvim"] = {
    config = { "\27LJ\1\2F\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0%\1\3\0>\0\2\1G\0\1\0\6z\19load_extension\14telescope\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/telescope-z.nvim"
  },
  ["telescope-zoxide"] = {
    config = { "\27LJ\1\2¦\1\0\0\2\0\a\0\r4\0\0\0%\1\1\0>\0\2\0027\0\2\0%\1\3\0>\0\2\0014\0\0\0%\1\4\0>\0\2\0027\0\5\0003\1\6\0>\0\2\1G\0\1\0\1\0\1\17prompt_title\r[ Zâ« ]\nsetup(telescope._extensions.zoxide.config\vzoxide\19load_extension\14telescope\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/telescope-zoxide"
  },
  ["telescope.nvim"] = {
    after = { "telescope-frecency.nvim", "telescope-packer.nvim", "telescope-cheat.nvim", "telescope-zoxide", "nvim-neoclip.lua", "telescope-github.nvim", "telescope-z.nvim" },
    loaded = true,
    only_config = true
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\1\2?\0\0\2\0\3\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\1G\0\1\0\nsetup\18todo-comments\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/todo-comments.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\1\2@\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\23lvim.core.terminal\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/toggleterm.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/tokyonight.nvim"
  },
  ["trouble.nvim"] = {
    commands = { "TroubleToggle" },
    config = { "\27LJ\1\2‹\4\0\0\4\0\24\0\0274\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0003\3\5\0:\3\6\0023\3\a\0:\3\b\0023\3\t\0:\3\n\0023\3\v\0:\3\f\0023\3\r\0:\3\14\0023\3\15\0:\3\16\0023\3\17\0:\3\18\0023\3\19\0:\3\20\2:\2\21\0013\2\22\0:\2\23\1>\0\2\1G\0\1\0\nsigns\1\0\5\fwarning\bï”©\nother\bï« \16information\bï‘‰\thint\bï µ\nerror\bï™™\16action_keys\16toggle_fold\1\3\0\0\azA\aza\15open_folds\1\3\0\0\azR\azr\16close_folds\1\3\0\0\azM\azm\15jump_close\1\2\0\0\6o\ropen_tab\1\2\0\0\n<c-t>\16open_vsplit\1\2\0\0\n<c-v>\15open_split\1\2\0\0\n<c-x>\tjump\1\3\0\0\t<cr>\n<tab>\1\0\t\rprevious\6k\frefresh\6r\nclose\6q\19toggle_preview\6P\fpreview\6p\tnext\6j\nhover\6K\vcancel\n<esc>\16toggle_mode\6m\1\0\2\tmode\30lsp_workspace_diagnostics\vheight\3\n\nsetup\ftrouble\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/trouble.nvim"
  },
  undotree = {
    commands = { "UndotreeToggle" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/undotree"
  },
  ["vim-asterisk"] = {
    config = { "\27LJ\1\2-\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\18user.asterisk\frequire\0" },
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/vim-asterisk"
  },
  ["vim-caser"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/vim-caser"
  },
  ["vim-devdocs"] = {
    commands = { "DD" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/vim-devdocs"
  },
  ["vim-easy-align"] = {
    config = { "\27LJ\1\2/\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\20user.easy-align\frequire\0" },
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/vim-easy-align"
  },
  ["vim-fugitive"] = {
    commands = { "Git", "GBrowse" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/vim-fugitive"
  },
  ["vim-gist"] = {
    config = { "\27LJ\1\2>\0\0\2\0\3\0\0054\0\0\0007\0\1\0'\1\1\0:\1\2\0G\0\1\0!gist_open_browser_after_post\6g\bvim\0" },
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/vim-gist"
  },
  ["vim-matchup"] = {
    after_files = { "/home/young/.local/share/lunarvim/site/pack/packer/opt/vim-matchup/after/plugin/matchit.vim" },
    config = { "\27LJ\1\2,\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\17user.matchup\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/vim-matchup"
  },
  ["vim-moonfly-colors"] = {
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/vim-moonfly-colors"
  },
  ["vim-nightfly-guicolors"] = {
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/vim-nightfly-guicolors"
  },
  ["vim-polyglot"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/vim-polyglot"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-scriptease"] = {
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/vim-scriptease"
  },
  ["vim-startuptime"] = {
    commands = { "StartupTime" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/vim-startuptime"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/vim-surround"
  },
  ["vim-table-mode"] = {
    commands = { "TableModeToggle" },
    keys = { { "", ",tm" } },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/vim-table-mode"
  },
  ["vim-translator"] = {
    commands = { "Translate", "TranslateW" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/vim-translator"
  },
  ["vim-unimpaired"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/vim-unimpaired"
  },
  ["vim-visual-multi"] = {
    config = { "\27LJ\1\0021\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\22user.multi-cursor\frequire\0" },
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/vim-visual-multi"
  },
  ["vim-wakatime"] = {
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/vim-wakatime"
  },
  ["vim-wordmotion"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/vim-wordmotion"
  },
  ["vim-zoom"] = {
    keys = { { "", "<C-w>m" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/vim-zoom"
  },
  ["vista.vim"] = {
    commands = { "Vista" },
    config = { "\27LJ\1\2M\0\0\2\0\4\0\0054\0\0\0007\0\1\0003\1\3\0:\1\2\0G\0\1\0\1\3\0\0\15â•°â”€â–¸ \15â”œâ”€â–¸ \22vista_icon_indent\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/vista.vim"
  },
  ["vscode.nvim"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/vscode.nvim"
  },
  ["webapi-vim"] = {
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/webapi-vim"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\1\2A\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\24lvim.core.which-key\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/which-key.nvim"
  },
  ["winshift.nvim"] = {
    commands = { "WinShift" },
    config = { "\27LJ\1\2¶\1\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0:\2\5\1>\0\2\1G\0\1\0\23moving_win_options\1\0\4\16colorcolumn\5\15cursorline\1\17cursorcolumn\1\twrap\1\1\0\2\21focused_hl_group\vVisual\25highlight_moving_win\2\nsetup\rwinshift\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/opt/winshift.nvim"
  },
  ["zen-mode.nvim"] = {
    config = { "\27LJ\1\0027\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\vconfig\ruser.zen\frequire\0" },
    loaded = true,
    path = "/home/young/.local/share/lunarvim/site/pack/packer/start/zen-mode.nvim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^focus"] = "focus.nvim",
  ["^neogit"] = "neogit",
  ["^nui"] = "nui.nvim",
  ["^sqlite"] = "sqlite.lua",
  ["^trouble"] = "trouble.nvim"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Setup for: monokai.nvim
time([[Setup for monokai.nvim]], true)
try_loadstring("\27LJ\1\2\v\0\0\1\0\0\0\1G\0\1\0\0", "setup", "monokai.nvim")
time([[Setup for monokai.nvim]], false)
time([[packadd for monokai.nvim]], true)
vim.cmd [[packadd monokai.nvim]]
time([[packadd for monokai.nvim]], false)
-- Setup for: ZFVimDirDiff
time([[Setup for ZFVimDirDiff]], true)
try_loadstring("\27LJ\1\2=\0\0\2\0\4\0\0054\0\0\0007\0\1\0%\1\3\0:\1\2\0G\0\1\0\6+\30ZFDirDiffUI_dirExpandable\6g\bvim\0", "setup", "ZFVimDirDiff")
time([[Setup for ZFVimDirDiff]], false)
-- Setup for: vim-caser
time([[Setup for vim-caser]], true)
try_loadstring("\27LJ\1\0021\0\0\2\0\4\0\0054\0\0\0007\0\1\0%\1\3\0:\1\2\0G\0\1\0\a;c\17caser_prefix\6g\bvim\0", "setup", "vim-caser")
time([[Setup for vim-caser]], false)
time([[packadd for vim-caser]], true)
vim.cmd [[packadd vim-caser]]
time([[packadd for vim-caser]], false)
-- Setup for: onedark.nvim
time([[Setup for onedark.nvim]], true)
try_loadstring("\27LJ\1\2\v\0\0\1\0\0\0\1G\0\1\0\0", "setup", "onedark.nvim")
time([[Setup for onedark.nvim]], false)
time([[packadd for onedark.nvim]], true)
vim.cmd [[packadd onedark.nvim]]
time([[packadd for onedark.nvim]], false)
-- Setup for: catppuccino.nvim
time([[Setup for catppuccino.nvim]], true)
try_loadstring("\27LJ\1\2\v\0\0\1\0\0\0\1G\0\1\0\0", "setup", "catppuccino.nvim")
time([[Setup for catppuccino.nvim]], false)
time([[packadd for catppuccino.nvim]], true)
vim.cmd [[packadd catppuccino.nvim]]
time([[packadd for catppuccino.nvim]], false)
-- Setup for: tokyonight.nvim
time([[Setup for tokyonight.nvim]], true)
try_loadstring("\27LJ\1\0028\0\0\2\0\4\0\0054\0\0\0007\0\1\0%\1\3\0:\1\2\0G\0\1\0\nnight\21tokyonight_style\6g\bvim\0", "setup", "tokyonight.nvim")
time([[Setup for tokyonight.nvim]], false)
time([[packadd for tokyonight.nvim]], true)
vim.cmd [[packadd tokyonight.nvim]]
time([[packadd for tokyonight.nvim]], false)
-- Setup for: material.nvim
time([[Setup for material.nvim]], true)
try_loadstring("\27LJ\1\0027\0\0\2\0\4\0\0054\0\0\0007\0\1\0%\1\3\0:\1\2\0G\0\1\0\vdarker\19material_style\6g\bvim\0", "setup", "material.nvim")
time([[Setup for material.nvim]], false)
time([[packadd for material.nvim]], true)
vim.cmd [[packadd material.nvim]]
time([[packadd for material.nvim]], false)
-- Setup for: better-escape.nvim
time([[Setup for better-escape.nvim]], true)
try_loadstring("\27LJ\1\2€\1\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0a          silent! iunmap jk\n          silent! iunmap kj\n          silent! iunmap jj\n        \bcmd\bvim\0", "setup", "better-escape.nvim")
time([[Setup for better-escape.nvim]], false)
-- Setup for: nord.nvim
time([[Setup for nord.nvim]], true)
try_loadstring("\27LJ\1\2.\0\0\2\0\3\0\0054\0\0\0007\0\1\0)\1\2\0:\1\2\0G\0\1\0\17nord_borders\6g\bvim\0", "setup", "nord.nvim")
time([[Setup for nord.nvim]], false)
time([[packadd for nord.nvim]], true)
vim.cmd [[packadd nord.nvim]]
time([[packadd for nord.nvim]], false)
-- Setup for: winshift.nvim
time([[Setup for winshift.nvim]], true)
try_loadstring("\27LJ\1\2¤\2\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0„\2          nnoremap <C-W><C-M> <Cmd>WinShift<CR>\n          nnoremap <C-M-H> <Cmd>WinShift left<CR>\n          nnoremap <C-M-J> <Cmd>WinShift down<CR>\n          nnoremap <C-M-K> <Cmd>WinShift up<CR>\n          nnoremap <C-M-L> <Cmd>WinShift right<CR>\n        \bcmd\bvim\0", "setup", "winshift.nvim")
time([[Setup for winshift.nvim]], false)
-- Setup for: vim-translator
time([[Setup for vim-translator]], true)
try_loadstring("\27LJ\1\2¸\5\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0˜\5        nmap <Leader>kk <Cmd>Translate<cr>\n        vmap <Leader>kk :Translate<cr>\n        \" Display translation in a window\n        nmap <Leader>kj <Cmd>TranslateW<cr>\n        vmap <Leader>kj :TranslateW<cr>\n        \" let g:translator_window_borderchars = ['â”€', 'â”‚', 'â”€', 'â”‚', 'â”Œ', 'â”', 'â”˜', 'â””']\n        \" let g:translator_window_borderchars = ['â”€', 'â”‚', 'â”€', 'â”‚', 'â•­', 'â•®', 'â•¯', 'â•°']\n        let g:translator_window_borderchars = ['â•', 'â•‘', 'â•', 'â•‘', 'â•”', 'â•—', 'â•', 'â•š']\n        \" let g:translator_window_type = 'preview'\n        \" let g:translator_default_engines = ['bing', 'google', 'haici', 'youdao']\n    \bcmd\bvim\0", "setup", "vim-translator")
time([[Setup for vim-translator]], false)
-- Setup for: vim-devdocs
time([[Setup for vim-devdocs]], true)
try_loadstring("\27LJ\1\2R\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0003        nnoremap <Leader>kd <Cmd>DD<cr>\n      \bcmd\bvim\0", "setup", "vim-devdocs")
time([[Setup for vim-devdocs]], false)
-- Setup for: vim-startuptime
time([[Setup for vim-startuptime]], true)
try_loadstring("\27LJ\1\0028\0\0\2\0\3\0\0054\0\0\0007\0\1\0'\1\0\0:\1\2\0G\0\1\0\27startuptime_use_blocks\6g\bvim\0", "setup", "vim-startuptime")
time([[Setup for vim-startuptime]], false)
-- Setup for: vim-table-mode
time([[Setup for vim-table-mode]], true)
try_loadstring("\27LJ\1\2:\0\0\2\0\4\0\0054\0\0\0007\0\1\0%\1\3\0:\1\2\0G\0\1\0\a,t\26table_mode_map_prefix\6g\bvim\0", "setup", "vim-table-mode")
time([[Setup for vim-table-mode]], false)
-- Setup for: filetype.nvim
time([[Setup for filetype.nvim]], true)
try_loadstring("\27LJ\1\2\v\0\0\1\0\0\0\1G\0\1\0\0", "setup", "filetype.nvim")
time([[Setup for filetype.nvim]], false)
time([[packadd for filetype.nvim]], true)
vim.cmd [[packadd filetype.nvim]]
time([[packadd for filetype.nvim]], false)
-- Setup for: vscode.nvim
time([[Setup for vscode.nvim]], true)
try_loadstring("\27LJ\1\0023\0\0\2\0\4\0\0054\0\0\0007\0\1\0%\1\3\0:\1\2\0G\0\1\0\tdark\17vscode_style\6g\bvim\0", "setup", "vscode.nvim")
time([[Setup for vscode.nvim]], false)
time([[packadd for vscode.nvim]], true)
vim.cmd [[packadd vscode.nvim]]
time([[packadd for vscode.nvim]], false)
-- Setup for: vim-wordmotion
time([[Setup for vim-wordmotion]], true)
try_loadstring("\27LJ\1\0025\0\0\2\0\4\0\0054\0\0\0007\0\1\0%\1\3\0:\1\2\0G\0\1\0\6;\22wordmotion_prefix\6g\bvim\0", "setup", "vim-wordmotion")
time([[Setup for vim-wordmotion]], false)
-- Setup for: nightfox.nvim
time([[Setup for nightfox.nvim]], true)
try_loadstring("\27LJ\1\2\v\0\0\1\0\0\0\1G\0\1\0\0", "setup", "nightfox.nvim")
time([[Setup for nightfox.nvim]], false)
time([[packadd for nightfox.nvim]], true)
vim.cmd [[packadd nightfox.nvim]]
time([[packadd for nightfox.nvim]], false)
-- Setup for: vim-polyglot
time([[Setup for vim-polyglot]], true)
try_loadstring("\27LJ\1\2T\0\0\2\0\4\0\0054\0\0\0007\0\1\0003\1\3\0:\1\2\0G\0\1\0\1\4\0\0\15autoindent\rftdetect\rmarkdown\22polyglot_disabled\6g\bvim\0", "setup", "vim-polyglot")
time([[Setup for vim-polyglot]], false)
-- Config for: vim-gist
time([[Config for vim-gist]], true)
try_loadstring("\27LJ\1\2>\0\0\2\0\3\0\0054\0\0\0007\0\1\0'\1\1\0:\1\2\0G\0\1\0!gist_open_browser_after_post\6g\bvim\0", "config", "vim-gist")
time([[Config for vim-gist]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\1\2B\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\25lvim.core.treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: fzf-lua
time([[Config for fzf-lua]], true)
try_loadstring("\27LJ\1\2(\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\ruser.fzf\frequire\0", "config", "fzf-lua")
time([[Config for fzf-lua]], false)
-- Config for: symbols-outline.nvim
time([[Config for symbols-outline.nvim]], true)
try_loadstring("\27LJ\1\2;\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\vconfig\17user.outline\frequire\0", "config", "symbols-outline.nvim")
time([[Config for symbols-outline.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\1\2.\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\19user.blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: vim-easy-align
time([[Config for vim-easy-align]], true)
try_loadstring("\27LJ\1\2/\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\20user.easy-align\frequire\0", "config", "vim-easy-align")
time([[Config for vim-easy-align]], false)
-- Config for: vim-asterisk
time([[Config for vim-asterisk]], true)
try_loadstring("\27LJ\1\2-\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\18user.asterisk\frequire\0", "config", "vim-asterisk")
time([[Config for vim-asterisk]], false)
-- Config for: lir.nvim
time([[Config for lir.nvim]], true)
try_loadstring("\27LJ\1\2(\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\ruser.lir\frequire\0", "config", "lir.nvim")
time([[Config for lir.nvim]], false)
-- Config for: catppuccino.nvim
time([[Config for catppuccino.nvim]], true)
try_loadstring("\27LJ\1\0026\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\27user.theme.catppuccino\frequire\0", "config", "catppuccino.nvim")
time([[Config for catppuccino.nvim]], false)
-- Config for: project.nvim
time([[Config for project.nvim]], true)
try_loadstring("\27LJ\1\2?\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\22lvim.core.project\frequire\0", "config", "project.nvim")
time([[Config for project.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\1\2A\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\24lvim.core.telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\1\2=\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\vconfig\19user.colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: neoscroll.nvim
time([[Config for neoscroll.nvim]], true)
try_loadstring("\27LJ\1\2.\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\19user.neoscroll\frequire\0", "config", "neoscroll.nvim")
time([[Config for neoscroll.nvim]], false)
-- Config for: vim-visual-multi
time([[Config for vim-visual-multi]], true)
try_loadstring("\27LJ\1\0021\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\22user.multi-cursor\frequire\0", "config", "vim-visual-multi")
time([[Config for vim-visual-multi]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
try_loadstring("\27LJ\1\2;\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\18lvim.core.dap\frequire\0", "config", "nvim-dap")
time([[Config for nvim-dap]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\1\2A\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\24lvim.core.autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\1\2;\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\18lvim.core.cmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\1\2@\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\23lvim.core.nvimtree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: filetype.nvim
time([[Config for filetype.nvim]], true)
try_loadstring("\27LJ\1\2-\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\18user.filetype\frequire\0", "config", "filetype.nvim")
time([[Config for filetype.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\1\2?\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\22lvim.core.lualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: rnvimr
time([[Config for rnvimr]], true)
try_loadstring("\27LJ\1\2+\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\16user.rnvimr\frequire\0", "config", "rnvimr")
time([[Config for rnvimr]], false)
-- Config for: zen-mode.nvim
time([[Config for zen-mode.nvim]], true)
try_loadstring("\27LJ\1\0027\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\vconfig\ruser.zen\frequire\0", "config", "zen-mode.nvim")
time([[Config for zen-mode.nvim]], false)
-- Config for: cheatsheet.nvim
time([[Config for cheatsheet.nvim]], true)
try_loadstring("\27LJ\1\2_\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\1G\0\1\0\1\0\1#include_only_installed_plugins\1\nsetup\15cheatsheet\frequire\0", "config", "cheatsheet.nvim")
time([[Config for cheatsheet.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd telescope-frecency.nvim ]]

-- Config for: telescope-frecency.nvim
try_loadstring("\27LJ\1\2M\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0%\1\3\0>\0\2\1G\0\1\0\rfrecency\19load_extension\14telescope\frequire\0", "config", "telescope-frecency.nvim")

vim.cmd [[ packadd telescope-github.nvim ]]

-- Config for: telescope-github.nvim
try_loadstring("\27LJ\1\2G\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0%\1\3\0>\0\2\1G\0\1\0\agh\19load_extension\14telescope\frequire\0", "config", "telescope-github.nvim")

vim.cmd [[ packadd telescope-packer.nvim ]]
vim.cmd [[ packadd telescope-z.nvim ]]

-- Config for: telescope-z.nvim
try_loadstring("\27LJ\1\2F\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0%\1\3\0>\0\2\1G\0\1\0\6z\19load_extension\14telescope\frequire\0", "config", "telescope-z.nvim")

vim.cmd [[ packadd telescope-zoxide ]]

-- Config for: telescope-zoxide
try_loadstring("\27LJ\1\2¦\1\0\0\2\0\a\0\r4\0\0\0%\1\1\0>\0\2\0027\0\2\0%\1\3\0>\0\2\0014\0\0\0%\1\4\0>\0\2\0027\0\5\0003\1\6\0>\0\2\1G\0\1\0\1\0\1\17prompt_title\r[ Zâ« ]\nsetup(telescope._extensions.zoxide.config\vzoxide\19load_extension\14telescope\frequire\0", "config", "telescope-zoxide")

vim.cmd [[ packadd nvim-neoclip.lua ]]

-- Config for: nvim-neoclip.lua
try_loadstring('\27LJ\1\2ƒ\2\0\0\4\0\f\0\0194\0\0\0%\1\1\0>\0\2\0027\0\2\0%\1\3\0>\0\2\0014\0\0\0%\1\3\0>\0\2\0027\0\4\0003\1\5\0003\2\6\0:\2\a\0013\2\t\0003\3\b\0:\3\n\2:\2\v\1>\0\2\1G\0\1\0\tkeys\6i\1\0\0\1\0\3\17paste_behind\n<c-h>\vselect\t<cr>\npaste\n<c-l>\ron_paste\1\0\1\fset_reg\1\1\0\3\21default_register\6"\fpreview\2\24content_spec_column\1\nsetup\fneoclip\19load_extension\14telescope\frequire\0', "config", "nvim-neoclip.lua")

vim.cmd [[ packadd telescope-cheat.nvim ]]

-- Config for: telescope-cheat.nvim
try_loadstring("\27LJ\1\2J\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0%\1\3\0>\0\2\1G\0\1\0\ncheat\19load_extension\14telescope\frequire\0", "config", "telescope-cheat.nvim")

time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TableModeToggle lua require("packer.load")({'vim-table-mode'}, { cmd = "TableModeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Neogit lua require("packer.load")({'neogit'}, { cmd = "Neogit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TranslateW lua require("packer.load")({'vim-translator'}, { cmd = "TranslateW", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file WinShift lua require("packer.load")({'winshift.nvim'}, { cmd = "WinShift", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Cheat lua require("packer.load")({'cheat.sh-vim'}, { cmd = "Cheat", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Vista lua require("packer.load")({'vista.vim'}, { cmd = "Vista", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Glow lua require("packer.load")({'glow.nvim'}, { cmd = "Glow", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file MinimapToggle lua require("packer.load")({'minimap.vim'}, { cmd = "MinimapToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GBrowse lua require("packer.load")({'vim-fugitive'}, { cmd = "GBrowse", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DD lua require("packer.load")({'vim-devdocs'}, { cmd = "DD", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Translate lua require("packer.load")({'vim-translator'}, { cmd = "Translate", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Codi lua require("packer.load")({'codi.vim'}, { cmd = "Codi", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file UndotreeToggle lua require("packer.load")({'undotree'}, { cmd = "UndotreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TroubleToggle lua require("packer.load")({'trouble.nvim'}, { cmd = "TroubleToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file CodeActionMenu lua require("packer.load")({'nvim-code-action-menu'}, { cmd = "CodeActionMenu", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Git lua require("packer.load")({'vim-fugitive'}, { cmd = "Git", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TSContextToggle lua require("packer.load")({'nvim-treesitter-context'}, { cmd = "TSContextToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file StartupTime lua require("packer.load")({'vim-startuptime'}, { cmd = "StartupTime", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> ,tm <cmd>lua require("packer.load")({'vim-table-mode'}, { keys = ",tm", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> ZFDirDiffMark <cmd>lua require("packer.load")({'ZFVimDirDiff'}, { keys = "ZFDirDiffMark", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> gS <cmd>lua require("packer.load")({'splitjoin.vim'}, { keys = "gS", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> ZFDirDiff <cmd>lua require("packer.load")({'ZFVimDirDiff'}, { keys = "ZFDirDiff", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <C-w>m <cmd>lua require("packer.load")({'vim-zoom'}, { keys = "<lt>C-w>m", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> gJ <cmd>lua require("packer.load")({'splitjoin.vim'}, { keys = "gJ", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType org ++once lua require("packer.load")({'orgmode.nvim'}, { ft = "org" }, _G.packer_plugins)]]
vim.cmd [[au FileType fugitive ++once lua require("packer.load")({'vim-fugitive'}, { ft = "fugitive" }, _G.packer_plugins)]]
vim.cmd [[au FileType norg ++once lua require("packer.load")({'neorg'}, { ft = "norg" }, _G.packer_plugins)]]
vim.cmd [[au FileType json ++once lua require("packer.load")({'package-info.nvim'}, { ft = "json" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufWinEnter * ++once lua require("packer.load")({'barbar.nvim', 'toggleterm.nvim', 'which-key.nvim', 'dashboard-nvim'}, { event = "BufWinEnter *" }, _G.packer_plugins)]]
vim.cmd [[au CursorMoved * ++once lua require("packer.load")({'vim-matchup', 'vim-wordmotion'}, { event = "CursorMoved *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'better-escape.nvim', 'nvim-ts-autotag'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'octo.nvim', 'diffview.nvim', 'spelunker.vim', 'nvim-treesitter-refactor', 'nvim-treesitter-textsubjects', 'numb.nvim', 'nvim-spectre', 'lightspeed.nvim', 'gitlinker.nvim', 'lsp_signature.nvim', 'dial.nvim', 'playground', 'nvim-lightbulb', 'nvim-bqf', 'nvim-treesitter-textobjects', 'gitsigns.nvim', 'neovim-session-manager', 'todo-comments.nvim', 'Comment.nvim'}, { event = "BufRead *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/young/.local/share/lunarvim/site/pack/packer/opt/vim-fugitive/ftdetect/fugitive.vim]], true)
vim.cmd [[source /home/young/.local/share/lunarvim/site/pack/packer/opt/vim-fugitive/ftdetect/fugitive.vim]]
time([[Sourcing ftdetect script at: /home/young/.local/share/lunarvim/site/pack/packer/opt/vim-fugitive/ftdetect/fugitive.vim]], false)
time([[Sourcing ftdetect script at: /home/young/.local/share/lunarvim/site/pack/packer/opt/neorg/ftdetect/norg.vim]], true)
vim.cmd [[source /home/young/.local/share/lunarvim/site/pack/packer/opt/neorg/ftdetect/norg.vim]]
time([[Sourcing ftdetect script at: /home/young/.local/share/lunarvim/site/pack/packer/opt/neorg/ftdetect/norg.vim]], false)
time([[Sourcing ftdetect script at: /home/young/.local/share/lunarvim/site/pack/packer/opt/orgmode.nvim/ftdetect/org.vim]], true)
vim.cmd [[source /home/young/.local/share/lunarvim/site/pack/packer/opt/orgmode.nvim/ftdetect/org.vim]]
time([[Sourcing ftdetect script at: /home/young/.local/share/lunarvim/site/pack/packer/opt/orgmode.nvim/ftdetect/org.vim]], false)
time([[Sourcing ftdetect script at: /home/young/.local/share/lunarvim/site/pack/packer/opt/orgmode.nvim/ftdetect/org_archive.vim]], true)
vim.cmd [[source /home/young/.local/share/lunarvim/site/pack/packer/opt/orgmode.nvim/ftdetect/org_archive.vim]]
time([[Sourcing ftdetect script at: /home/young/.local/share/lunarvim/site/pack/packer/opt/orgmode.nvim/ftdetect/org_archive.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
