local M = {}

M.config = function()
  local status_ok, notify = pcall(require, "notify")
  if not status_ok then
    return
  end

  -- vim.notify = require "notify"
  notify.setup {
    -- Animation style (see below for details)
    stages = "fade_in_slide_out",

    -- Function called when a new window is opened, use for changing win settings/config
    on_open = nil,

    -- Function called when a window is closed
    on_close = nil,

    -- Render function for notifications. See notify-render()
    render = "default",

    -- Default timeout for notifications
    timeout = 5000,

    -- For stages that change opacity this is treated as the highlight behind the window
    -- Set this to either a highlight group or an RGB hex value e.g. "#000000"
    -- background_colour = "Normal",
    background_colour = '#2c2e34',

    -- Minimum width for notification windows
    minimum_width = 50,

    -- Icons for the different levels
    icons = {
      ERROR = "",
      WARN = "",
      INFO = "",
      DEBUG = "",
      TRACE = "✎",
    },
  }
end

M.demo = function()
  local my_notify = "My Awesome Plugin"
  vim.notify("This is an error message.\nSomething went wrong!", "error", {
    title = my_notify,
    on_open = function()
      vim.notify("Attempting recovery.", vim.lsp.log_levels.WARN, {
        title = my_notify,
      })
      local timer = vim.loop.new_timer()
      timer:start(2000, 0, function()
        vim.notify({ "Fixing problem.", "Please wait..." }, "info", {
          title = my_notify,
          timeout = 3000,
          on_close = function()
            vim.notify("Problem solved", nil, { title = my_notify })
            vim.notify("Error code 0x0395AF", 1, { title = my_notify })
          end,
        })
      end)
    end,
  })
end

M.demo1 = function()
  local async = require "plenary.async"
  local notify = require("notify").async

  async.run(function()
    notify("Let's wait for this to close").close()
    notify "It closed!"
  end)
end

return M
