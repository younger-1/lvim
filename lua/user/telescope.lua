-- [Falling back to find_files if git_files can't find a .git directory](https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes#falling-back-to-find_files-if-git_files-cant-find-a-git-directory)
local M = {}

M.project_files = function()
  local opts = {}
  local ok = pcall(require("telescope.builtin").git_files, opts)
  if not ok then
    require("telescope.builtin").find_files(opts)
  end
end

-- [Disable highlighting for certain files](https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes#disable-highlighting-for-certain-files)
-- local previewers = require "telescope.previewers"

-- local _bad = { ".*%.csv", ".*%.txt" } -- Put all filetypes that slow you down in this array
-- local bad_files = function(filepath)
--   for _, v in ipairs(_bad) do
--     if filepath:match(v) then
--       return false
--     end
--   end

--   return true
-- end

-- local new_maker = function(filepath, bufnr, opts)
--   opts = opts or {}
--   if opts.use_ft_detect == nil then
--     opts.use_ft_detect = true
--   end
--   opts.use_ft_detect = opts.use_ft_detect == false and false or bad_files(filepath)
--   previewers.buffer_previewer_maker(filepath, bufnr, opts)
-- end

return M
