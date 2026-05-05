vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

require("config.options")
require("config.lazy")
require("config.keymaps")

if vim.g.neovide then
  require("config.neovide")
end
