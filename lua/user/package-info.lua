require("package-info").setup {
  {
    colors = {
      up_to_date = "#3C4048", -- Text color for up to date package virtual text
      outdated = "#6ec0fa", -- Text color for outdated package virtual text
    },
    icons = {
      enable = true, -- Whether to display icons
      style = {
        up_to_date = "|  ", -- Icon for up to date packages
        outdated = "|  ", -- Icon for outdated packages
      },
    },
    autostart = true, -- Whether to autostart when `package.json` is opened
  },
}

-- TODO: convert to buffer keybindings
-- -- Show package versions
-- vim.api.nvim_set_keymap("n", "<leader>ns", ":lua require('package-info').show()<CR>", { silent = true, noremap = true })

-- -- Hide package versions
-- vim.api.nvim_set_keymap("n", "<leader>nc", ":lua require('package-info').hide()<CR>", { silent = true, noremap = true })

-- -- Update package on line
-- vim.api.nvim_set_keymap("n", "<leader>nu", ":lua require('package-info').update()<CR>", { silent = true, noremap = true })

-- -- Delete package on line
-- vim.api.nvim_set_keymap("n", "<leader>nd", ":lua require('package-info').delete()<CR>", { silent = true, noremap = true })

-- -- Install a new package
-- vim.api.nvim_set_keymap("n", "<leader>ni", ":lua require('package-info').install()<CR>", { silent = true, noremap = true })

-- -- Reinstall dependencies
-- vim.api.nvim_set_keymap("n", "<leader>nr", ":lua require('package-info').reinstall()<CR>", { silent = true, noremap = true })

-- -- Install a different package version
-- vim.api.nvim_set_keymap("n", "<leader>np", ":lua require('package-info').change_version()<CR>", { silent = true, noremap = true })
