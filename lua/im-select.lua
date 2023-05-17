local C = {
  default_command = 'im-select',
  default_method_selected = 'com.apple.keylayout.ABC',
}

local M = {}

M.setup = function()
  if not vim.fn.executable(C.default_command) then
    vim.notify('im-select not found, please install it first', 'error')
    return
  end

  vim.api.nvim_create_autocmd({ 'InsertEnter' }, {
    callback = function()
      local current = vim.trim(vim.fn.system 'im-select')
      local prev = vim.g['current_input_method']
      if current == prev then return end
      vim.fn.system { 'im-select', prev }
    end,
  })

  vim.api.nvim_create_autocmd({ 'InsertLeave', 'VimEnter' }, {
    callback = function()
      local current = vim.trim(vim.fn.system 'im-select')
      vim.api.nvim_set_var('current_input_method', current)
      if current == C.default_method_selected then return end
      vim.fn.system { 'im-select', C.default_method_selected }
    end,
  })
end

return M
