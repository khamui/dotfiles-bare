local M = {}

function M.recording ()
  local reg = vim.fn.reg_recording()
  if (reg == '') then return '' end
  return '••• @' .. reg .. ' •••'
end

return M
