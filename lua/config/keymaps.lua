-- Use `jk` to exit insert mode
vim.keymap.set('i', 'jk', '<Esc>')

-- Terminal shortcut and exit with esc
vim.keymap.set('n', '<leader>t', ':terminal<CR>')
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- Unbind cmd-line window to stop accidental invocation. Use :<C-f> to open.
vim.keymap.set('n', 'q:', '<nop>')

-- Use alt-j/k to navigate QuickFix menu
vim.keymap.set('n', '<A-j>', ':cnext<CR>')
vim.keymap.set('n', '<A-k>', ':cprevious<CR>')

-- Use tab to accept pum options, passthru enter
-- Tab to cycle forward (and select)
vim.keymap.set('i', '<Tab>', function()
  return vim.fn.pumvisible() == 1 and '<C-n>' or '<Tab>'
end, { expr = true })

-- Shift-Tab to cycle backward
vim.keymap.set('i', '<S-Tab>', function()
  return vim.fn.pumvisible() == 1 and '<C-p>' or '<S-Tab>'
end, { expr = true })

-- Enter to ONLY insert a newline, never to confirm completion
vim.keymap.set('i', '<CR>', function()
  if vim.fn.pumvisible() == 1 then
    -- <C-e> aborts the menu so Enter doesn't pick a match
    return '<C-e><CR>'
  end
  return '<CR>'
end, { expr = true })

-- Select the last pasted text
vim.keymap.set('n', 'gp', "'[v`]", { desc = "Select last pasted text" })

-- Quick replace with automatic escaping
vim.keymap.set('x', '<leader>rr', [["fy:s/\V<C-r>=escape(@f, '/\')<CR>/]])
vim.keymap.set('x', '<leader>ra', [["fy:%s/\V<C-r>=escape(@f, '/\')<CR>/]])

-- Paste unnamed register in insert mode
vim.keymap.set({ 'c', 'i' }, '<C-g>', '<C-r>"', { desc = 'Paste latest yank' })

-- Enter empty lines without switching to insert mode
vim.keymap.set('n', '<CR>', 'o<Esc>')
vim.keymap.set('n', '<S-CR>', 'm`O<Esc>``')
vim.api.nvim_create_autocmd("FileType", { -- Unmap enter when in QuickFix
  pattern = "qf,minifiles",
  callback = function()
    vim.keymap.set("n", "<CR>", "<CR>", { buffer = true })
  end,
})

-- Actions on entire buffer
vim.keymap.set('n', ' ya', "mqggyG'q", { desc = "Yank entire buffer" })
vim.keymap.set('n', ' da', 'gg"_dG', { desc = "Delete entire buffer without yanking" })
vim.keymap.set('n', ' gqa', "mqgggqG'q", { desc = "Format entire buffer" })

-- LSP keymaps
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic error under cursor' })
vim.keymap.set('i', '<C-Space>', function() vim.lsp.completion.get() end, { desc = 'Trigger LSP completion' })
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })

-- Misc
vim.keymap.set('n', '<leader><ESC>', ':nohlsearch<CR>', { silent = true, desc = 'Remove search highlights' })

vim.keymap.set('n', '<leader>wm', [[:%s/\r//g<CR>]], { silent = true, desc = 'Strip ^M from buffer' })
