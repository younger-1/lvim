-- <https://github.com/ayamir/nvimdots/blob/cbe59f051b4a913fcdc014664ce32b37c3b0f577/lua/core/init.lua#L23>
local disable_distribution = function()
  vim.g.loaded_2html_plugin = 1
  vim.g.loaded_getscript = 1
  vim.g.loaded_getscriptPlugin = 1
  vim.g.loaded_gzip = 1
  vim.g.loaded_logiPat = 1
  -- Do not use builtin matchit.vim and matchparen.vim since we use vim-matchup
  vim.g.loaded_matchit = 1
  vim.g.loaded_matchparen = 1
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwFileHandlers = 1
  vim.g.loaded_netrwPlugin = 1
  vim.g.loaded_netrwSettings = 1
  vim.g.loaded_rrhelper = 1
  vim.g.loaded_spellfile_plugin = 1
  vim.g.loaded_tar = 1
  vim.g.loaded_tarPlugin = 1
  vim.g.loaded_tutor_mode_plugin = 1
  vim.g.loaded_vimball = 1
  vim.g.loaded_vimballPlugin = 1
  vim.g.loaded_zip = 1
  vim.g.loaded_zipPlugin = 1

  -- <https://github.com/jdhao/nvim-config/blob/470e35439a76298b485dc7fc5f9a54b6ec8175f1/core/globals.vim#L11>
  -- Disable Python2 support
  vim.g.loaded_python_provider = 0
  -- Disable perl provider
  vim.g.loaded_perl_provider = 0
  -- Disable ruby provider
  vim.g.loaded_ruby_provider = 0
  -- Disable node provider
  -- vim.g.loaded_node_provider = 0
  -- vim.g.loaded_remote_plugins = false

  -- [](https://github.com/nathom/filetype.nvim/issues/12)
  -- Do not source the default filetype.vim
  vim.g.did_load_filetypes = 1
end

local neovide_config = function()
  vim.cmd [[set guifont=JetBrainsMono\ Nerd\ Font:h12]]
  vim.g.neovide_refresh_rate = 60
  vim.g.neovide_cursor_vfx_mode = "railgun"
  vim.g.neovide_no_idle = true
  vim.g.neovide_cursor_animation_length = 0.03
  vim.g.neovide_cursor_trail_length = 0.05
  vim.g.neovide_cursor_antialiasing = true
  vim.g.neovide_cursor_vfx_opacity = 200.0
  vim.g.neovide_cursor_vfx_particle_lifetime = 1.2
  vim.g.neovide_cursor_vfx_particle_speed = 20.0
  vim.g.neovide_cursor_vfx_particle_density = 5.0
end

disable_distribution()
-- neovide_config()
