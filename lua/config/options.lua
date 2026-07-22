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

-- I think this shows extra lines past the end of the file
vim.o.scrolloff = 10

-- Count display lines when scrolling instead of file lines, helps files with many wrapped lines
vim.o.smoothscroll = true

-- Show tab character and trailiing spaces
vim.o.list = true

-- Show dialog when exiting without saving
vim.o.confirm = true

vim.o.splitbelow = true
vim.o.splitright = true

-- Mouse: no popup menu on right click, actions defined in keymaps.lua
vim.o.mouse = 'a'
vim.o.mousemodel = 'extend'

-- Set tabs to 2 spaces
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

-- Break newlines on word
vim.o.linebreak = true

-- Completion menu: show even with one match, don't auto-select, show docs popup, show extra preview thing
vim.o.completeopt = 'fuzzy,menuone,noinsert,popup,preview'

-- Command tab-completion: Fuzzy match, use pop-up modal, match
vim.o.wildoptions = 'fuzzy,pum'
vim.o.wildmode = 'longest:full,full'

-- Highlight when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Set colorscheme
vim.cmd [[colorscheme onehalfdark]]
