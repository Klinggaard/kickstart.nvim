-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- Format keybind
vim.api.nvim_create_user_command('Format', function(args)
  local range = nil
  if args.count ~= -1 then
    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
    range = {
      start = { args.line1, 0 },
      ['end'] = { args.line2, end_line:len() },
    }
  end
  require('conform').format { async = true, lsp_fallback = true, range = range }
end, { range = true })
vim.keymap.set('n', '<leader>f', ':Format<CR>', { desc = '[F]ormat file' })

-- Change header/source
vim.keymap.set('n', '<leader>cs', ':ClangdSwitchSourceHeader<CR>', { desc = '[C]hange [S]ource/header' })

-- Enable spell checking
vim.o.spell = true

-- Toggle Code Suggestions on/off with CTRL-g in normal mode:
vim.keymap.set('n', '<C-g>', '<Plug>(GitLabToggleCodeSuggestions)')

-- Set makeprg to cmake build command
vim.o.makeprg = 'cmake --build build'
vim.keymap.set('n', '<C-m>', ':make<CR>', { desc = '[M]ake' })
vim.keymap.set('n', '<leader><C-p>', ':cprevious<CR>', { desc = 'Previous make [D]iagnostic' })
vim.keymap.set('n', '<leader><C-n>', ':cnext<CR>', { desc = 'Next make [D]iagnostic' })

return {}
