-- Use `jk` to exit insert mode
vim.keymap.set('i', 'jk', '<Esc>')

-- Terminal shortcut and exit with esc
vim.keymap.set('n', '<leader>t', ':terminal<CR>')
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- Use alt-direction to switch windows, even in insert mode
vim.keymap.set({ 't', 'i' }, '<A-h>', '<C-\\><C-n><C-w>h')
vim.keymap.set({ 't', 'i' }, '<A-j>', '<C-\\><C-n><C-w>j')
vim.keymap.set({ 't', 'i' }, '<A-k>', '<C-\\><C-n><C-w>k')
vim.keymap.set({ 't', 'i' }, '<A-l>', '<C-\\><C-n><C-w>l')
vim.keymap.set('n', '<A-h>', '<C-w>h')
vim.keymap.set('n', '<A-j>', '<C-w>j')
vim.keymap.set('n', '<A-k>', '<C-w>k')
vim.keymap.set('n', '<A-l>', '<C-w>l')

-- Select the last pasted text
vim.keymap.set('n', 'gp', "'[v`]", { desc = "Select last pasted text" })

-- Enter empty lines without switching to insert mode
vim.keymap.set('n', '<CR>', 'o<Esc>')
vim.keymap.set('n', '<S-CR>', 'm`O<Esc>``')

-- LSP keymaps
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic error under cursor' })
vim.keymap.set('i', '<C-Space>', function() vim.lsp.completion.get() end, { desc = 'Trigger LSP completion' })

vim.keymap.set('n', '<leader><ESC>', ':nohlsearch<CR>', { silent = true, desc = 'Remove search highlights' })

vim.keymap.set('n', '<leader>wm', [[:%s/\r//g<CR>]], { silent = true, desc = 'Strip ^M from buffer' })
