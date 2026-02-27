-- Use `jk` to exit insert mode
vim.keymap.set('i', 'jk', '<Esc>')

-- Terminal shortcut and exit with esc
vim.keymap.set('n', '<leader>t', ':terminal<CR>', opts)
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
