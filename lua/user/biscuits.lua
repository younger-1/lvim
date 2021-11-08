require("nvim-biscuits").setup {
  -- on_events = { "InsertLeave", "CursorHoldI" },
  toggle_keybind = "<leader>tb",
  default_config = {
    -- max_length = 12,
    -- min_distance = 5,
    -- trim_by_words = true,
    prefix_string = " 📎 ",
  },
  language_config = {
    html = {
      prefix_string = " 🌐 ",
    },
    javascript = {
      prefix_string = " ✨ ",
      max_length = 80,
    },
  },
}

-- require('nvim-biscuits').toggle_biscuits()
