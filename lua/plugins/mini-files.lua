return {
  'nvim-mini/mini.files',
  version = '*',
  opts = {
    options = {
      permanent_delete = false,
    },
    windows = {
      preview = true,
      width_preview = 30,
    },
    mappings = {
      go_in_plus = 'L', -- Always close explorer when opening file
      go_out = 'H',
      go_in = '',
      go_out_plus = '',
    }
  },
  keys = {
    { "<leader>oo", "<CMD>e .<CR>",              desc = "Open MiniFiles" },
    { "<leader>on", "<CMD>e ~/.config/nvim<CR>", desc = "Open MiniFiles" },
    { "-", function()
      local minifiles = require('mini.files')
      local buf_name = vim.api.nvim_buf_get_name(0)
      local path = vim.fn.filereadable(buf_name) == 1 and buf_name or vim.fn.getcwd()
      minifiles.open(path)
      minifiles.reveal_cwd()
    end, { desc = "Open Mini Files" } },
  }
}
