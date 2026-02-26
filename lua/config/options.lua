-- Show relative line numbers
vim.o.number = true
vim.o.relativenumber = true

-- Something to do with system clipboard
vim.api.nvim_create_autocmd('UIEnter', {
  callback = function()
    vim.o.clipboard = 'unnamedplus'
  end,
})

-- Searches ignore case unless a capital letter is present
vim.o.ignorecase = true
vim.o.smartcase = true

-- Highlight current line
vim.o.cursorline = true

-- I think this shows extra lines at the end of the file
vim.o.scrolloff = 10

-- God knows
vim.o.list = true

-- Show dialog when exiting without saving
vim.o.confirm = true

-- Set tabs to 2 spaces
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

-- Highlighty when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  callback = function()
    vim.hl.on_yank()
  end,
})

-- idk
vim.cmd('packadd! nohlsearch')

