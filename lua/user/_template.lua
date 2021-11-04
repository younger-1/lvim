local M = {}

M.config = function()
  local status_ok, notify = pcall(require, "")
  if not status_ok then
    return
  end
end

return M
