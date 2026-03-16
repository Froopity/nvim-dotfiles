return {
  "folke/snacks.nvim",
  config = function()
    local snacks = require('snacks')
    snacks.setup({
      scratch = {},
      indent = {},
    })

    vim.keymap.set('n', '<leader>.', function() snacks.scratch() end, { desc = "Toggle Scratchpad" })
    vim.keymap.set('n', '<leader>S', function() snacks.scratch.select() end, { desc = "Select Scratchpad" })
  end
}
